// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $KVTableTable extends KVTable with TableInfo<$KVTableTable, KVTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KVTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bucketMeta = const VerificationMeta('bucket');
  @override
  late final GeneratedColumn<String> bucket = GeneratedColumn<String>(
      'bucket', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [bucket, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'k_v_table';
  @override
  VerificationContext validateIntegrity(Insertable<KVTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bucket')) {
      context.handle(_bucketMeta,
          bucket.isAcceptableOrUnknown(data['bucket']!, _bucketMeta));
    } else if (isInserting) {
      context.missing(_bucketMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bucket, key};
  @override
  KVTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KVTableData(
      bucket: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bucket'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $KVTableTable createAlias(String alias) {
    return $KVTableTable(attachedDatabase, alias);
  }
}

class KVTableData extends DataClass implements Insertable<KVTableData> {
  final String bucket;
  final String key;
  final String value;
  const KVTableData(
      {required this.bucket, required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bucket'] = Variable<String>(bucket);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  KVTableCompanion toCompanion(bool nullToAbsent) {
    return KVTableCompanion(
      bucket: Value(bucket),
      key: Value(key),
      value: Value(value),
    );
  }

  factory KVTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KVTableData(
      bucket: serializer.fromJson<String>(json['bucket']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bucket': serializer.toJson<String>(bucket),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  KVTableData copyWith({String? bucket, String? key, String? value}) =>
      KVTableData(
        bucket: bucket ?? this.bucket,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('KVTableData(')
          ..write('bucket: $bucket, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bucket, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KVTableData &&
          other.bucket == this.bucket &&
          other.key == this.key &&
          other.value == this.value);
}

class KVTableCompanion extends UpdateCompanion<KVTableData> {
  final Value<String> bucket;
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const KVTableCompanion({
    this.bucket = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KVTableCompanion.insert({
    required String bucket,
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : bucket = Value(bucket),
        key = Value(key),
        value = Value(value);
  static Insertable<KVTableData> custom({
    Expression<String>? bucket,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bucket != null) 'bucket': bucket,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KVTableCompanion copyWith(
      {Value<String>? bucket,
      Value<String>? key,
      Value<String>? value,
      Value<int>? rowid}) {
    return KVTableCompanion(
      bucket: bucket ?? this.bucket,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bucket.present) {
      map['bucket'] = Variable<String>(bucket.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KVTableCompanion(')
          ..write('bucket: $bucket, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeedConfigTableTable extends FeedConfigTable
    with TableInfo<$FeedConfigTableTable, FeedConfigTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedConfigTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _internalIdMeta =
      const VerificationMeta('internalId');
  @override
  late final GeneratedColumn<String> internalId = GeneratedColumn<String>(
      'internal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _feedUrlMeta =
      const VerificationMeta('feedUrl');
  @override
  late final GeneratedColumn<String> feedUrl = GeneratedColumn<String>(
      'feed_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jsonDataMeta =
      const VerificationMeta('jsonData');
  @override
  late final GeneratedColumn<String> jsonData = GeneratedColumn<String>(
      'json_data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [internalId, name, feedUrl, category, jsonData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feed_config_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FeedConfigTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('internal_id')) {
      context.handle(
          _internalIdMeta,
          internalId.isAcceptableOrUnknown(
              data['internal_id']!, _internalIdMeta));
    } else if (isInserting) {
      context.missing(_internalIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('feed_url')) {
      context.handle(_feedUrlMeta,
          feedUrl.isAcceptableOrUnknown(data['feed_url']!, _feedUrlMeta));
    } else if (isInserting) {
      context.missing(_feedUrlMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('json_data')) {
      context.handle(_jsonDataMeta,
          jsonData.isAcceptableOrUnknown(data['json_data']!, _jsonDataMeta));
    } else if (isInserting) {
      context.missing(_jsonDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {internalId};
  @override
  FeedConfigTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedConfigTableData(
      internalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}internal_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      feedUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feed_url'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      jsonData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json_data'])!,
    );
  }

  @override
  $FeedConfigTableTable createAlias(String alias) {
    return $FeedConfigTableTable(attachedDatabase, alias);
  }
}

class FeedConfigTableData extends DataClass
    implements Insertable<FeedConfigTableData> {
  final String internalId;
  final String name;
  final String feedUrl;
  final String category;
  final String jsonData;
  const FeedConfigTableData(
      {required this.internalId,
      required this.name,
      required this.feedUrl,
      required this.category,
      required this.jsonData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['internal_id'] = Variable<String>(internalId);
    map['name'] = Variable<String>(name);
    map['feed_url'] = Variable<String>(feedUrl);
    map['category'] = Variable<String>(category);
    map['json_data'] = Variable<String>(jsonData);
    return map;
  }

  FeedConfigTableCompanion toCompanion(bool nullToAbsent) {
    return FeedConfigTableCompanion(
      internalId: Value(internalId),
      name: Value(name),
      feedUrl: Value(feedUrl),
      category: Value(category),
      jsonData: Value(jsonData),
    );
  }

  factory FeedConfigTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedConfigTableData(
      internalId: serializer.fromJson<String>(json['internalId']),
      name: serializer.fromJson<String>(json['name']),
      feedUrl: serializer.fromJson<String>(json['feedUrl']),
      category: serializer.fromJson<String>(json['category']),
      jsonData: serializer.fromJson<String>(json['jsonData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'internalId': serializer.toJson<String>(internalId),
      'name': serializer.toJson<String>(name),
      'feedUrl': serializer.toJson<String>(feedUrl),
      'category': serializer.toJson<String>(category),
      'jsonData': serializer.toJson<String>(jsonData),
    };
  }

  FeedConfigTableData copyWith(
          {String? internalId,
          String? name,
          String? feedUrl,
          String? category,
          String? jsonData}) =>
      FeedConfigTableData(
        internalId: internalId ?? this.internalId,
        name: name ?? this.name,
        feedUrl: feedUrl ?? this.feedUrl,
        category: category ?? this.category,
        jsonData: jsonData ?? this.jsonData,
      );
  @override
  String toString() {
    return (StringBuffer('FeedConfigTableData(')
          ..write('internalId: $internalId, ')
          ..write('name: $name, ')
          ..write('feedUrl: $feedUrl, ')
          ..write('category: $category, ')
          ..write('jsonData: $jsonData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(internalId, name, feedUrl, category, jsonData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedConfigTableData &&
          other.internalId == this.internalId &&
          other.name == this.name &&
          other.feedUrl == this.feedUrl &&
          other.category == this.category &&
          other.jsonData == this.jsonData);
}

class FeedConfigTableCompanion extends UpdateCompanion<FeedConfigTableData> {
  final Value<String> internalId;
  final Value<String> name;
  final Value<String> feedUrl;
  final Value<String> category;
  final Value<String> jsonData;
  final Value<int> rowid;
  const FeedConfigTableCompanion({
    this.internalId = const Value.absent(),
    this.name = const Value.absent(),
    this.feedUrl = const Value.absent(),
    this.category = const Value.absent(),
    this.jsonData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedConfigTableCompanion.insert({
    required String internalId,
    required String name,
    required String feedUrl,
    required String category,
    required String jsonData,
    this.rowid = const Value.absent(),
  })  : internalId = Value(internalId),
        name = Value(name),
        feedUrl = Value(feedUrl),
        category = Value(category),
        jsonData = Value(jsonData);
  static Insertable<FeedConfigTableData> custom({
    Expression<String>? internalId,
    Expression<String>? name,
    Expression<String>? feedUrl,
    Expression<String>? category,
    Expression<String>? jsonData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (internalId != null) 'internal_id': internalId,
      if (name != null) 'name': name,
      if (feedUrl != null) 'feed_url': feedUrl,
      if (category != null) 'category': category,
      if (jsonData != null) 'json_data': jsonData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedConfigTableCompanion copyWith(
      {Value<String>? internalId,
      Value<String>? name,
      Value<String>? feedUrl,
      Value<String>? category,
      Value<String>? jsonData,
      Value<int>? rowid}) {
    return FeedConfigTableCompanion(
      internalId: internalId ?? this.internalId,
      name: name ?? this.name,
      feedUrl: feedUrl ?? this.feedUrl,
      category: category ?? this.category,
      jsonData: jsonData ?? this.jsonData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (internalId.present) {
      map['internal_id'] = Variable<String>(internalId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (feedUrl.present) {
      map['feed_url'] = Variable<String>(feedUrl.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (jsonData.present) {
      map['json_data'] = Variable<String>(jsonData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedConfigTableCompanion(')
          ..write('internalId: $internalId, ')
          ..write('name: $name, ')
          ..write('feedUrl: $feedUrl, ')
          ..write('category: $category, ')
          ..write('jsonData: $jsonData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $KVTableTable kVTable = $KVTableTable(this);
  late final $FeedConfigTableTable feedConfigTable =
      $FeedConfigTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [kVTable, feedConfigTable];
}
