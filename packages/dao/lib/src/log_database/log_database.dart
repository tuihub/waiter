import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../connection/shared.dart';

part 'log_database.g.dart';
part 'log_database.mapper.dart';

enum LogLevel {
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
  final String message;
  final String? source;
  final String? stackTrace;
  final String? context;
  final DateTime? occurTime;
  final DateTime logTime;

  Log({
    required this.id,
    required this.level,
    required this.message,
    this.source,
    this.stackTrace,
    this.context,
    this.occurTime,
    required this.logTime,
  });
}

@UseRowClass(Log)
class LogTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get level => textEnum<LogLevel>()();
  TextColumn get message => text()();
  TextColumn get source => text().nullable()();
  TextColumn get stackTrace => text().nullable()();
  TextColumn get context => text().nullable()();
  DateTimeColumn get occurTime => dateTime().nullable()();
  DateTimeColumn get logTime => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// AppDatabase is the holder of the database instance in singleton pattern.
@DriftDatabase(
  tables: [
    LogTable,
  ],
)
class LogDatabase extends _$LogDatabase {
  LogDatabase(String dataPath, {String name = 'log'})
      : super(openConnection(dataPath, name));

  @override
  int get schemaVersion => 1;

  Future<void> log(
    LogLevel level,
    String message, {
    String? source,
    String? stackTrace,
    String? context,
    DateTime? occurTime,
  }) async {
    final logTime = DateTime.now();
    await into(logTable).insert(LogTableCompanion(
      level: Value(level),
      message: Value(message),
      source: Value(source),
      stackTrace: Value(stackTrace),
      context: Value(context),
      occurTime: Value(occurTime),
      logTime: Value(logTime),
    ));
  }

  Future<List<Log>> queryLogs({
    List<LogLevel>? levels,
    List<String>? sources,
    DateTime? from,
    DateTime? to,
    int? limit,
    int? offset,
    String? keyword,
  }) async {
    final query = select(logTable);
    if (levels != null) {
      query.where((tbl) => tbl.level.isInValues(levels));
    }
    if (sources != null) {
      query.where((tbl) => tbl.source.isIn(sources));
    }
    if (from != null) {
      query.where((tbl) => tbl.logTime.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where((tbl) => tbl.logTime.isSmallerOrEqualValue(to));
    }
    if (limit != null) {
      query.limit(limit, offset: offset);
    }
    if (keyword != null) {
      query.where((tbl) =>
          tbl.message.like('%$keyword%') |
          tbl.stackTrace.like('%$keyword%') |
          tbl.context.like('%$keyword%'));
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
  }
}
