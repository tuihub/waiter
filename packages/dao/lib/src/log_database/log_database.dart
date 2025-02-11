import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../connection/shared.dart';

part 'log_database.g.dart';
part 'log_database.mapper.dart';

enum LogLevel {
  ongoing,
  trace,
  debug,
  info,
  warning,
  error,
}

@MappableClass()
class Log with LogMappable {
  final int id;
  final LogLevel level;
  final String title;
  final String? message;
  final String? source;
  final String? stackTrace;
  final String? context;
  final DateTime? occurTime;
  final DateTime logTime;

  Log({
    required this.id,
    required this.level,
    required this.title,
    this.message,
    this.source,
    this.stackTrace,
    this.context,
    this.occurTime,
    required this.logTime,
  });
}

@MappableClass()
class LogFilter with LogFilterMappable {
  final List<LogLevel>? levels;
  final List<String>? sources;
  final DateTime? from;
  final DateTime? to;
  final int? limit;
  final int? offset;
  final String? keyword;

  const LogFilter({
    this.levels,
    this.sources,
    this.from,
    this.to,
    this.limit,
    this.offset,
    this.keyword,
  });
}

@UseRowClass(Log)
class LogTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get level => textEnum<LogLevel>()();
  TextColumn get title => text()();
  TextColumn get message => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get stackTrace => text().nullable()();
  TextColumn get context => text().nullable()();
  DateTimeColumn get occurTime => dateTime().nullable()();
  DateTimeColumn get logTime => dateTime()();
}

@UseRowClass(Log)
class CacheServerLogTable extends Table {
  IntColumn get id => integer()();
  TextColumn get level => textEnum<LogLevel>()();
  TextColumn get title => text()();
  TextColumn get message => text().nullable()();
  TextColumn get source => text()(); // Use ServerID as source
  TextColumn get stackTrace => text().nullable()();
  TextColumn get context => text().nullable()();
  DateTimeColumn get occurTime => dateTime().nullable()();
  DateTimeColumn get logTime => dateTime()();

  @override
  Set<Column> get primaryKey => {id, source};
}

// AppDatabase is the holder of the database instance in singleton pattern.
@DriftDatabase(
  tables: [
    LogTable,
    CacheServerLogTable,
  ],
)
class LogDatabase extends _$LogDatabase {
  LogDatabase(String dataPath, {String name = 'log'})
      : super(openConnection(dataPath, name));

  @override
  int get schemaVersion => 1;

  Future<void> log(
    LogLevel level,
    String title,
    String? message, {
    String? source,
    String? stackTrace,
    String? context,
    DateTime? occurTime,
  }) async {
    final logTime = DateTime.now();
    await into(logTable).insert(LogTableCompanion(
      level: Value(level),
      title: Value(title),
      message: Value(message),
      source: Value(source),
      stackTrace: Value(stackTrace),
      context: Value(context),
      occurTime: Value(occurTime),
      logTime: Value(logTime),
    ));
  }

  Future<void> cacheServerLogs(
    String serverID,
    List<Log> logs,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        cacheServerLogTable,
        logs
            .map((log) => CacheServerLogTableCompanion(
                  id: Value(log.id),
                  level: Value(log.level),
                  title: Value(log.title),
                  message: Value(log.message),
                  source: Value(serverID),
                  stackTrace: Value(log.stackTrace),
                  context: Value(log.context),
                  occurTime: Value(log.occurTime),
                  logTime: Value(log.logTime),
                ))
            .toList(),
      );
    });
  }

  Future<List<Log>> queryLogs(
    LogFilter filter, {
    List<String>? serverIDs,
  }) async {
    final query = select(logTable);
    if (serverIDs != null) {
      if (serverIDs.isEmpty) {
        query.join([
          crossJoin(
            cacheServerLogTable,
          ),
        ]);
      } else {
        query.join([
          leftOuterJoin(
            cacheServerLogTable,
            cacheServerLogTable.source.isIn(serverIDs),
          ),
        ]);
      }
    }
    if (filter.levels != null) {
      query.where((tbl) => tbl.level.isInValues(filter.levels!));
    }
    if (filter.sources != null) {
      query
          .where((tbl) => tbl.source.isIn(filter.sources! + (serverIDs ?? [])));
    }
    if (filter.from != null) {
      query.where((tbl) => tbl.logTime.isBiggerOrEqualValue(filter.from!));
    }
    if (filter.to != null) {
      query.where((tbl) => tbl.logTime.isSmallerOrEqualValue(filter.to!));
    }
    if (filter.limit != null) {
      query.limit(filter.limit!, offset: filter.offset);
    }
    if (filter.keyword != null) {
      query.where((tbl) =>
          tbl.title.like('%${filter.keyword}%') |
          tbl.message.like('%${filter.keyword}%') |
          tbl.stackTrace.like('%${filter.keyword}%') |
          tbl.context.like('%${filter.keyword}%'));
    }
    query.orderBy([
      (tbl) => OrderingTerm(expression: tbl.logTime, mode: OrderingMode.desc)
    ]);
    return query.get();
  }

  Future<void> clearLogs(int dayAgo, List<LogLevel> levels) async {
    final from = DateTime.now().subtract(Duration(days: dayAgo));
    await (delete(logTable)
          ..where((tbl) =>
              tbl.logTime.isSmallerOrEqualValue(from) &
              tbl.level.isInValues(levels)))
        .go();
    await (delete(cacheServerLogTable)
          ..where((tbl) =>
              tbl.logTime.isSmallerOrEqualValue(from) &
              tbl.level.isInValues(levels)))
        .go();
  }
}
