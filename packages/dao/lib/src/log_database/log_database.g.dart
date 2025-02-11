// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_database.dart';

// ignore_for_file: type=lint
class $LogTableTable extends LogTable with TableInfo<$LogTableTable, Log> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumnWithTypeConverter<LogLevel, String> level =
      GeneratedColumn<String>('level', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LogLevel>($LogTableTable.$converterlevel);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stackTraceMeta =
      const VerificationMeta('stackTrace');
  @override
  late final GeneratedColumn<String> stackTrace = GeneratedColumn<String>(
      'stack_trace', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contextMeta =
      const VerificationMeta('context');
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
      'context', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _occurTimeMeta =
      const VerificationMeta('occurTime');
  @override
  late final GeneratedColumn<DateTime> occurTime = GeneratedColumn<DateTime>(
      'occur_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _logTimeMeta =
      const VerificationMeta('logTime');
  @override
  late final GeneratedColumn<DateTime> logTime = GeneratedColumn<DateTime>(
      'log_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        level,
        title,
        message,
        source,
        stackTrace,
        context,
        occurTime,
        logTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_table';
  @override
  VerificationContext validateIntegrity(Insertable<Log> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_levelMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('stack_trace')) {
      context.handle(
          _stackTraceMeta,
          stackTrace.isAcceptableOrUnknown(
              data['stack_trace']!, _stackTraceMeta));
    }
    if (data.containsKey('context')) {
      context.handle(_contextMeta,
          this.context.isAcceptableOrUnknown(data['context']!, _contextMeta));
    }
    if (data.containsKey('occur_time')) {
      context.handle(_occurTimeMeta,
          occurTime.isAcceptableOrUnknown(data['occur_time']!, _occurTimeMeta));
    }
    if (data.containsKey('log_time')) {
      context.handle(_logTimeMeta,
          logTime.isAcceptableOrUnknown(data['log_time']!, _logTimeMeta));
    } else if (isInserting) {
      context.missing(_logTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Log map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Log(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      level: $LogTableTable.$converterlevel.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
      stackTrace: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stack_trace']),
      context: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context']),
      occurTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occur_time']),
      logTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}log_time'])!,
    );
  }

  @override
  $LogTableTable createAlias(String alias) {
    return $LogTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogLevel, String, String> $converterlevel =
      const EnumNameConverter<LogLevel>(LogLevel.values);
}

class LogTableCompanion extends UpdateCompanion<Log> {
  final Value<int> id;
  final Value<LogLevel> level;
  final Value<String> title;
  final Value<String?> message;
  final Value<String?> source;
  final Value<String?> stackTrace;
  final Value<String?> context;
  final Value<DateTime?> occurTime;
  final Value<DateTime> logTime;
  const LogTableCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.source = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.context = const Value.absent(),
    this.occurTime = const Value.absent(),
    this.logTime = const Value.absent(),
  });
  LogTableCompanion.insert({
    this.id = const Value.absent(),
    required LogLevel level,
    required String title,
    this.message = const Value.absent(),
    this.source = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.context = const Value.absent(),
    this.occurTime = const Value.absent(),
    required DateTime logTime,
  })  : level = Value(level),
        title = Value(title),
        logTime = Value(logTime);
  static Insertable<Log> custom({
    Expression<int>? id,
    Expression<String>? level,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? source,
    Expression<String>? stackTrace,
    Expression<String>? context,
    Expression<DateTime>? occurTime,
    Expression<DateTime>? logTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (source != null) 'source': source,
      if (stackTrace != null) 'stack_trace': stackTrace,
      if (context != null) 'context': context,
      if (occurTime != null) 'occur_time': occurTime,
      if (logTime != null) 'log_time': logTime,
    });
  }

  LogTableCompanion copyWith(
      {Value<int>? id,
      Value<LogLevel>? level,
      Value<String>? title,
      Value<String?>? message,
      Value<String?>? source,
      Value<String?>? stackTrace,
      Value<String?>? context,
      Value<DateTime?>? occurTime,
      Value<DateTime>? logTime}) {
    return LogTableCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      title: title ?? this.title,
      message: message ?? this.message,
      source: source ?? this.source,
      stackTrace: stackTrace ?? this.stackTrace,
      context: context ?? this.context,
      occurTime: occurTime ?? this.occurTime,
      logTime: logTime ?? this.logTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (level.present) {
      map['level'] =
          Variable<String>($LogTableTable.$converterlevel.toSql(level.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (stackTrace.present) {
      map['stack_trace'] = Variable<String>(stackTrace.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (occurTime.present) {
      map['occur_time'] = Variable<DateTime>(occurTime.value);
    }
    if (logTime.present) {
      map['log_time'] = Variable<DateTime>(logTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogTableCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('source: $source, ')
          ..write('stackTrace: $stackTrace, ')
          ..write('context: $context, ')
          ..write('occurTime: $occurTime, ')
          ..write('logTime: $logTime')
          ..write(')'))
        .toString();
  }
}

class $CacheServerLogTableTable extends CacheServerLogTable
    with TableInfo<$CacheServerLogTableTable, Log> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheServerLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumnWithTypeConverter<LogLevel, String> level =
      GeneratedColumn<String>('level', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LogLevel>($CacheServerLogTableTable.$converterlevel);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stackTraceMeta =
      const VerificationMeta('stackTrace');
  @override
  late final GeneratedColumn<String> stackTrace = GeneratedColumn<String>(
      'stack_trace', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contextMeta =
      const VerificationMeta('context');
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
      'context', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _occurTimeMeta =
      const VerificationMeta('occurTime');
  @override
  late final GeneratedColumn<DateTime> occurTime = GeneratedColumn<DateTime>(
      'occur_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _logTimeMeta =
      const VerificationMeta('logTime');
  @override
  late final GeneratedColumn<DateTime> logTime = GeneratedColumn<DateTime>(
      'log_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        level,
        title,
        message,
        source,
        stackTrace,
        context,
        occurTime,
        logTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_server_log_table';
  @override
  VerificationContext validateIntegrity(Insertable<Log> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    context.handle(_levelMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('stack_trace')) {
      context.handle(
          _stackTraceMeta,
          stackTrace.isAcceptableOrUnknown(
              data['stack_trace']!, _stackTraceMeta));
    }
    if (data.containsKey('context')) {
      context.handle(_contextMeta,
          this.context.isAcceptableOrUnknown(data['context']!, _contextMeta));
    }
    if (data.containsKey('occur_time')) {
      context.handle(_occurTimeMeta,
          occurTime.isAcceptableOrUnknown(data['occur_time']!, _occurTimeMeta));
    }
    if (data.containsKey('log_time')) {
      context.handle(_logTimeMeta,
          logTime.isAcceptableOrUnknown(data['log_time']!, _logTimeMeta));
    } else if (isInserting) {
      context.missing(_logTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, source};
  @override
  Log map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Log(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      level: $CacheServerLogTableTable.$converterlevel.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      stackTrace: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stack_trace']),
      context: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context']),
      occurTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occur_time']),
      logTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}log_time'])!,
    );
  }

  @override
  $CacheServerLogTableTable createAlias(String alias) {
    return $CacheServerLogTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogLevel, String, String> $converterlevel =
      const EnumNameConverter<LogLevel>(LogLevel.values);
}

class CacheServerLogTableCompanion extends UpdateCompanion<Log> {
  final Value<int> id;
  final Value<LogLevel> level;
  final Value<String> title;
  final Value<String?> message;
  final Value<String> source;
  final Value<String?> stackTrace;
  final Value<String?> context;
  final Value<DateTime?> occurTime;
  final Value<DateTime> logTime;
  final Value<int> rowid;
  const CacheServerLogTableCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.source = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.context = const Value.absent(),
    this.occurTime = const Value.absent(),
    this.logTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CacheServerLogTableCompanion.insert({
    required int id,
    required LogLevel level,
    required String title,
    this.message = const Value.absent(),
    required String source,
    this.stackTrace = const Value.absent(),
    this.context = const Value.absent(),
    this.occurTime = const Value.absent(),
    required DateTime logTime,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        level = Value(level),
        title = Value(title),
        source = Value(source),
        logTime = Value(logTime);
  static Insertable<Log> custom({
    Expression<int>? id,
    Expression<String>? level,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? source,
    Expression<String>? stackTrace,
    Expression<String>? context,
    Expression<DateTime>? occurTime,
    Expression<DateTime>? logTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (source != null) 'source': source,
      if (stackTrace != null) 'stack_trace': stackTrace,
      if (context != null) 'context': context,
      if (occurTime != null) 'occur_time': occurTime,
      if (logTime != null) 'log_time': logTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CacheServerLogTableCompanion copyWith(
      {Value<int>? id,
      Value<LogLevel>? level,
      Value<String>? title,
      Value<String?>? message,
      Value<String>? source,
      Value<String?>? stackTrace,
      Value<String?>? context,
      Value<DateTime?>? occurTime,
      Value<DateTime>? logTime,
      Value<int>? rowid}) {
    return CacheServerLogTableCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      title: title ?? this.title,
      message: message ?? this.message,
      source: source ?? this.source,
      stackTrace: stackTrace ?? this.stackTrace,
      context: context ?? this.context,
      occurTime: occurTime ?? this.occurTime,
      logTime: logTime ?? this.logTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(
          $CacheServerLogTableTable.$converterlevel.toSql(level.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (stackTrace.present) {
      map['stack_trace'] = Variable<String>(stackTrace.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (occurTime.present) {
      map['occur_time'] = Variable<DateTime>(occurTime.value);
    }
    if (logTime.present) {
      map['log_time'] = Variable<DateTime>(logTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheServerLogTableCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('source: $source, ')
          ..write('stackTrace: $stackTrace, ')
          ..write('context: $context, ')
          ..write('occurTime: $occurTime, ')
          ..write('logTime: $logTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LogDatabase extends GeneratedDatabase {
  _$LogDatabase(QueryExecutor e) : super(e);
  $LogDatabaseManager get managers => $LogDatabaseManager(this);
  late final $LogTableTable logTable = $LogTableTable(this);
  late final $CacheServerLogTableTable cacheServerLogTable =
      $CacheServerLogTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [logTable, cacheServerLogTable];
}

typedef $$LogTableTableCreateCompanionBuilder = LogTableCompanion Function({
  Value<int> id,
  required LogLevel level,
  required String title,
  Value<String?> message,
  Value<String?> source,
  Value<String?> stackTrace,
  Value<String?> context,
  Value<DateTime?> occurTime,
  required DateTime logTime,
});
typedef $$LogTableTableUpdateCompanionBuilder = LogTableCompanion Function({
  Value<int> id,
  Value<LogLevel> level,
  Value<String> title,
  Value<String?> message,
  Value<String?> source,
  Value<String?> stackTrace,
  Value<String?> context,
  Value<DateTime?> occurTime,
  Value<DateTime> logTime,
});

class $$LogTableTableFilterComposer
    extends Composer<_$LogDatabase, $LogTableTable> {
  $$LogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LogLevel, LogLevel, String> get level =>
      $composableBuilder(
          column: $table.level,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get occurTime => $composableBuilder(
      column: $table.occurTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get logTime => $composableBuilder(
      column: $table.logTime, builder: (column) => ColumnFilters(column));
}

class $$LogTableTableOrderingComposer
    extends Composer<_$LogDatabase, $LogTableTable> {
  $$LogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get occurTime => $composableBuilder(
      column: $table.occurTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get logTime => $composableBuilder(
      column: $table.logTime, builder: (column) => ColumnOrderings(column));
}

class $$LogTableTableAnnotationComposer
    extends Composer<_$LogDatabase, $LogTableTable> {
  $$LogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogLevel, String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => column);

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);

  GeneratedColumn<DateTime> get occurTime =>
      $composableBuilder(column: $table.occurTime, builder: (column) => column);

  GeneratedColumn<DateTime> get logTime =>
      $composableBuilder(column: $table.logTime, builder: (column) => column);
}

class $$LogTableTableTableManager extends RootTableManager<
    _$LogDatabase,
    $LogTableTable,
    Log,
    $$LogTableTableFilterComposer,
    $$LogTableTableOrderingComposer,
    $$LogTableTableAnnotationComposer,
    $$LogTableTableCreateCompanionBuilder,
    $$LogTableTableUpdateCompanionBuilder,
    (Log, BaseReferences<_$LogDatabase, $LogTableTable, Log>),
    Log,
    PrefetchHooks Function()> {
  $$LogTableTableTableManager(_$LogDatabase db, $LogTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<LogLevel> level = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> message = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<String?> stackTrace = const Value.absent(),
            Value<String?> context = const Value.absent(),
            Value<DateTime?> occurTime = const Value.absent(),
            Value<DateTime> logTime = const Value.absent(),
          }) =>
              LogTableCompanion(
            id: id,
            level: level,
            title: title,
            message: message,
            source: source,
            stackTrace: stackTrace,
            context: context,
            occurTime: occurTime,
            logTime: logTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required LogLevel level,
            required String title,
            Value<String?> message = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<String?> stackTrace = const Value.absent(),
            Value<String?> context = const Value.absent(),
            Value<DateTime?> occurTime = const Value.absent(),
            required DateTime logTime,
          }) =>
              LogTableCompanion.insert(
            id: id,
            level: level,
            title: title,
            message: message,
            source: source,
            stackTrace: stackTrace,
            context: context,
            occurTime: occurTime,
            logTime: logTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LogTableTableProcessedTableManager = ProcessedTableManager<
    _$LogDatabase,
    $LogTableTable,
    Log,
    $$LogTableTableFilterComposer,
    $$LogTableTableOrderingComposer,
    $$LogTableTableAnnotationComposer,
    $$LogTableTableCreateCompanionBuilder,
    $$LogTableTableUpdateCompanionBuilder,
    (Log, BaseReferences<_$LogDatabase, $LogTableTable, Log>),
    Log,
    PrefetchHooks Function()>;
typedef $$CacheServerLogTableTableCreateCompanionBuilder
    = CacheServerLogTableCompanion Function({
  required int id,
  required LogLevel level,
  required String title,
  Value<String?> message,
  required String source,
  Value<String?> stackTrace,
  Value<String?> context,
  Value<DateTime?> occurTime,
  required DateTime logTime,
  Value<int> rowid,
});
typedef $$CacheServerLogTableTableUpdateCompanionBuilder
    = CacheServerLogTableCompanion Function({
  Value<int> id,
  Value<LogLevel> level,
  Value<String> title,
  Value<String?> message,
  Value<String> source,
  Value<String?> stackTrace,
  Value<String?> context,
  Value<DateTime?> occurTime,
  Value<DateTime> logTime,
  Value<int> rowid,
});

class $$CacheServerLogTableTableFilterComposer
    extends Composer<_$LogDatabase, $CacheServerLogTableTable> {
  $$CacheServerLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LogLevel, LogLevel, String> get level =>
      $composableBuilder(
          column: $table.level,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get occurTime => $composableBuilder(
      column: $table.occurTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get logTime => $composableBuilder(
      column: $table.logTime, builder: (column) => ColumnFilters(column));
}

class $$CacheServerLogTableTableOrderingComposer
    extends Composer<_$LogDatabase, $CacheServerLogTableTable> {
  $$CacheServerLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get occurTime => $composableBuilder(
      column: $table.occurTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get logTime => $composableBuilder(
      column: $table.logTime, builder: (column) => ColumnOrderings(column));
}

class $$CacheServerLogTableTableAnnotationComposer
    extends Composer<_$LogDatabase, $CacheServerLogTableTable> {
  $$CacheServerLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogLevel, String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => column);

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);

  GeneratedColumn<DateTime> get occurTime =>
      $composableBuilder(column: $table.occurTime, builder: (column) => column);

  GeneratedColumn<DateTime> get logTime =>
      $composableBuilder(column: $table.logTime, builder: (column) => column);
}

class $$CacheServerLogTableTableTableManager extends RootTableManager<
    _$LogDatabase,
    $CacheServerLogTableTable,
    Log,
    $$CacheServerLogTableTableFilterComposer,
    $$CacheServerLogTableTableOrderingComposer,
    $$CacheServerLogTableTableAnnotationComposer,
    $$CacheServerLogTableTableCreateCompanionBuilder,
    $$CacheServerLogTableTableUpdateCompanionBuilder,
    (Log, BaseReferences<_$LogDatabase, $CacheServerLogTableTable, Log>),
    Log,
    PrefetchHooks Function()> {
  $$CacheServerLogTableTableTableManager(
      _$LogDatabase db, $CacheServerLogTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CacheServerLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CacheServerLogTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CacheServerLogTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<LogLevel> level = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> message = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String?> stackTrace = const Value.absent(),
            Value<String?> context = const Value.absent(),
            Value<DateTime?> occurTime = const Value.absent(),
            Value<DateTime> logTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CacheServerLogTableCompanion(
            id: id,
            level: level,
            title: title,
            message: message,
            source: source,
            stackTrace: stackTrace,
            context: context,
            occurTime: occurTime,
            logTime: logTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required LogLevel level,
            required String title,
            Value<String?> message = const Value.absent(),
            required String source,
            Value<String?> stackTrace = const Value.absent(),
            Value<String?> context = const Value.absent(),
            Value<DateTime?> occurTime = const Value.absent(),
            required DateTime logTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              CacheServerLogTableCompanion.insert(
            id: id,
            level: level,
            title: title,
            message: message,
            source: source,
            stackTrace: stackTrace,
            context: context,
            occurTime: occurTime,
            logTime: logTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CacheServerLogTableTableProcessedTableManager = ProcessedTableManager<
    _$LogDatabase,
    $CacheServerLogTableTable,
    Log,
    $$CacheServerLogTableTableFilterComposer,
    $$CacheServerLogTableTableOrderingComposer,
    $$CacheServerLogTableTableAnnotationComposer,
    $$CacheServerLogTableTableCreateCompanionBuilder,
    $$CacheServerLogTableTableUpdateCompanionBuilder,
    (Log, BaseReferences<_$LogDatabase, $CacheServerLogTableTable, Log>),
    Log,
    PrefetchHooks Function()>;

class $LogDatabaseManager {
  final _$LogDatabase _db;
  $LogDatabaseManager(this._db);
  $$LogTableTableTableManager get logTable =>
      $$LogTableTableTableManager(_db, _db.logTable);
  $$CacheServerLogTableTableTableManager get cacheServerLogTable =>
      $$CacheServerLogTableTableTableManager(_db, _db.cacheServerLogTable);
}
