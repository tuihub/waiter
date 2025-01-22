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
  KVTableData copyWithCompanion(KVTableCompanion data) {
    return KVTableData(
      bucket: data.bucket.present ? data.bucket.value : this.bucket,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

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

class $ServerConfigTableTable extends ServerConfigTable
    with TableInfo<$ServerConfigTableTable, ServerConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServerConfigTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
      'host', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
      'port', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _enableTLSMeta =
      const VerificationMeta('enableTLS');
  @override
  late final GeneratedColumn<bool> enableTLS = GeneratedColumn<bool>(
      'enable_t_l_s', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_t_l_s" IN (0, 1))'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<int> deviceId = GeneratedColumn<int>(
      'device_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, host, port, enableTLS, username, refreshToken, deviceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'server_config_table';
  @override
  VerificationContext validateIntegrity(Insertable<ServerConfig> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('host')) {
      context.handle(
          _hostMeta, host.isAcceptableOrUnknown(data['host']!, _hostMeta));
    } else if (isInserting) {
      context.missing(_hostMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port']!, _portMeta));
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('enable_t_l_s')) {
      context.handle(
          _enableTLSMeta,
          enableTLS.isAcceptableOrUnknown(
              data['enable_t_l_s']!, _enableTLSMeta));
    } else if (isInserting) {
      context.missing(_enableTLSMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServerConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServerConfig(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      host: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}host'])!,
      port: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}port'])!,
      enableTLS: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enable_t_l_s'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      refreshToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token']),
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}device_id']),
    );
  }

  @override
  $ServerConfigTableTable createAlias(String alias) {
    return $ServerConfigTableTable(attachedDatabase, alias);
  }
}

class ServerConfigTableCompanion extends UpdateCompanion<ServerConfig> {
  final Value<int> id;
  final Value<String> host;
  final Value<int> port;
  final Value<bool> enableTLS;
  final Value<String> username;
  final Value<String?> refreshToken;
  final Value<int?> deviceId;
  const ServerConfigTableCompanion({
    this.id = const Value.absent(),
    this.host = const Value.absent(),
    this.port = const Value.absent(),
    this.enableTLS = const Value.absent(),
    this.username = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.deviceId = const Value.absent(),
  });
  ServerConfigTableCompanion.insert({
    this.id = const Value.absent(),
    required String host,
    required int port,
    required bool enableTLS,
    required String username,
    this.refreshToken = const Value.absent(),
    this.deviceId = const Value.absent(),
  })  : host = Value(host),
        port = Value(port),
        enableTLS = Value(enableTLS),
        username = Value(username);
  static Insertable<ServerConfig> custom({
    Expression<int>? id,
    Expression<String>? host,
    Expression<int>? port,
    Expression<bool>? enableTLS,
    Expression<String>? username,
    Expression<String>? refreshToken,
    Expression<int>? deviceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (host != null) 'host': host,
      if (port != null) 'port': port,
      if (enableTLS != null) 'enable_t_l_s': enableTLS,
      if (username != null) 'username': username,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (deviceId != null) 'device_id': deviceId,
    });
  }

  ServerConfigTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? host,
      Value<int>? port,
      Value<bool>? enableTLS,
      Value<String>? username,
      Value<String?>? refreshToken,
      Value<int?>? deviceId}) {
    return ServerConfigTableCompanion(
      id: id ?? this.id,
      host: host ?? this.host,
      port: port ?? this.port,
      enableTLS: enableTLS ?? this.enableTLS,
      username: username ?? this.username,
      refreshToken: refreshToken ?? this.refreshToken,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (enableTLS.present) {
      map['enable_t_l_s'] = Variable<bool>(enableTLS.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<int>(deviceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServerConfigTableCompanion(')
          ..write('id: $id, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('enableTLS: $enableTLS, ')
          ..write('username: $username, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('deviceId: $deviceId')
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
  List<GeneratedColumn> get $columns => [internalId, name, category, jsonData];
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
  final String category;
  final String jsonData;
  const FeedConfigTableData(
      {required this.internalId,
      required this.name,
      required this.category,
      required this.jsonData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['internal_id'] = Variable<String>(internalId);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['json_data'] = Variable<String>(jsonData);
    return map;
  }

  FeedConfigTableCompanion toCompanion(bool nullToAbsent) {
    return FeedConfigTableCompanion(
      internalId: Value(internalId),
      name: Value(name),
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
      'category': serializer.toJson<String>(category),
      'jsonData': serializer.toJson<String>(jsonData),
    };
  }

  FeedConfigTableData copyWith(
          {String? internalId,
          String? name,
          String? category,
          String? jsonData}) =>
      FeedConfigTableData(
        internalId: internalId ?? this.internalId,
        name: name ?? this.name,
        category: category ?? this.category,
        jsonData: jsonData ?? this.jsonData,
      );
  FeedConfigTableData copyWithCompanion(FeedConfigTableCompanion data) {
    return FeedConfigTableData(
      internalId:
          data.internalId.present ? data.internalId.value : this.internalId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      jsonData: data.jsonData.present ? data.jsonData.value : this.jsonData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeedConfigTableData(')
          ..write('internalId: $internalId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('jsonData: $jsonData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(internalId, name, category, jsonData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedConfigTableData &&
          other.internalId == this.internalId &&
          other.name == this.name &&
          other.category == this.category &&
          other.jsonData == this.jsonData);
}

class FeedConfigTableCompanion extends UpdateCompanion<FeedConfigTableData> {
  final Value<String> internalId;
  final Value<String> name;
  final Value<String> category;
  final Value<String> jsonData;
  final Value<int> rowid;
  const FeedConfigTableCompanion({
    this.internalId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.jsonData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedConfigTableCompanion.insert({
    required String internalId,
    required String name,
    required String category,
    required String jsonData,
    this.rowid = const Value.absent(),
  })  : internalId = Value(internalId),
        name = Value(name),
        category = Value(category),
        jsonData = Value(jsonData);
  static Insertable<FeedConfigTableData> custom({
    Expression<String>? internalId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? jsonData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (internalId != null) 'internal_id': internalId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (jsonData != null) 'json_data': jsonData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedConfigTableCompanion copyWith(
      {Value<String>? internalId,
      Value<String>? name,
      Value<String>? category,
      Value<String>? jsonData,
      Value<int>? rowid}) {
    return FeedConfigTableCompanion(
      internalId: internalId ?? this.internalId,
      name: name ?? this.name,
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
          ..write('category: $category, ')
          ..write('jsonData: $jsonData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalAppTableTable extends LocalAppTable
    with TableInfo<$LocalAppTableTable, LocalApp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalAppTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastLaunchedInstUUIDMeta =
      const VerificationMeta('lastLaunchedInstUUID');
  @override
  late final GeneratedColumn<String> lastLaunchedInstUUID =
      GeneratedColumn<String>('last_launched_inst_u_u_i_d', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shortDescriptionMeta =
      const VerificationMeta('shortDescription');
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
      'short_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconImageUrlMeta =
      const VerificationMeta('iconImageUrl');
  @override
  late final GeneratedColumn<String> iconImageUrl = GeneratedColumn<String>(
      'icon_image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconImagePathMeta =
      const VerificationMeta('iconImagePath');
  @override
  late final GeneratedColumn<String> iconImagePath = GeneratedColumn<String>(
      'icon_image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backgroundImageUrlMeta =
      const VerificationMeta('backgroundImageUrl');
  @override
  late final GeneratedColumn<String> backgroundImageUrl =
      GeneratedColumn<String>('background_image_url', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backgroundImagePathMeta =
      const VerificationMeta('backgroundImagePath');
  @override
  late final GeneratedColumn<String> backgroundImagePath =
      GeneratedColumn<String>('background_image_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverImageUrlMeta =
      const VerificationMeta('coverImageUrl');
  @override
  late final GeneratedColumn<String> coverImageUrl = GeneratedColumn<String>(
      'cover_image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverImagePathMeta =
      const VerificationMeta('coverImagePath');
  @override
  late final GeneratedColumn<String> coverImagePath = GeneratedColumn<String>(
      'cover_image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _developerMeta =
      const VerificationMeta('developer');
  @override
  late final GeneratedColumn<String> developer = GeneratedColumn<String>(
      'developer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publisherMeta =
      const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
      'publisher', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        lastLaunchedInstUUID,
        shortDescription,
        iconImageUrl,
        iconImagePath,
        backgroundImageUrl,
        backgroundImagePath,
        coverImageUrl,
        coverImagePath,
        description,
        releaseDate,
        developer,
        publisher
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_app_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocalApp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_launched_inst_u_u_i_d')) {
      context.handle(
          _lastLaunchedInstUUIDMeta,
          lastLaunchedInstUUID.isAcceptableOrUnknown(
              data['last_launched_inst_u_u_i_d']!, _lastLaunchedInstUUIDMeta));
    }
    if (data.containsKey('short_description')) {
      context.handle(
          _shortDescriptionMeta,
          shortDescription.isAcceptableOrUnknown(
              data['short_description']!, _shortDescriptionMeta));
    }
    if (data.containsKey('icon_image_url')) {
      context.handle(
          _iconImageUrlMeta,
          iconImageUrl.isAcceptableOrUnknown(
              data['icon_image_url']!, _iconImageUrlMeta));
    }
    if (data.containsKey('icon_image_path')) {
      context.handle(
          _iconImagePathMeta,
          iconImagePath.isAcceptableOrUnknown(
              data['icon_image_path']!, _iconImagePathMeta));
    }
    if (data.containsKey('background_image_url')) {
      context.handle(
          _backgroundImageUrlMeta,
          backgroundImageUrl.isAcceptableOrUnknown(
              data['background_image_url']!, _backgroundImageUrlMeta));
    }
    if (data.containsKey('background_image_path')) {
      context.handle(
          _backgroundImagePathMeta,
          backgroundImagePath.isAcceptableOrUnknown(
              data['background_image_path']!, _backgroundImagePathMeta));
    }
    if (data.containsKey('cover_image_url')) {
      context.handle(
          _coverImageUrlMeta,
          coverImageUrl.isAcceptableOrUnknown(
              data['cover_image_url']!, _coverImageUrlMeta));
    }
    if (data.containsKey('cover_image_path')) {
      context.handle(
          _coverImagePathMeta,
          coverImagePath.isAcceptableOrUnknown(
              data['cover_image_path']!, _coverImagePathMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('developer')) {
      context.handle(_developerMeta,
          developer.isAcceptableOrUnknown(data['developer']!, _developerMeta));
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalApp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalApp(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lastLaunchedInstUUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}last_launched_inst_u_u_i_d']),
      shortDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description']),
      iconImageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_image_url']),
      iconImagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_image_path']),
      backgroundImageUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}background_image_url']),
      backgroundImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}background_image_path']),
      coverImageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_image_url']),
      coverImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cover_image_path']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date']),
      developer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}developer']),
      publisher: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publisher']),
    );
  }

  @override
  $LocalAppTableTable createAlias(String alias) {
    return $LocalAppTableTable(attachedDatabase, alias);
  }
}

class LocalAppTableCompanion extends UpdateCompanion<LocalApp> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> lastLaunchedInstUUID;
  final Value<String?> shortDescription;
  final Value<String?> iconImageUrl;
  final Value<String?> iconImagePath;
  final Value<String?> backgroundImageUrl;
  final Value<String?> backgroundImagePath;
  final Value<String?> coverImageUrl;
  final Value<String?> coverImagePath;
  final Value<String?> description;
  final Value<String?> releaseDate;
  final Value<String?> developer;
  final Value<String?> publisher;
  const LocalAppTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.lastLaunchedInstUUID = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.iconImageUrl = const Value.absent(),
    this.iconImagePath = const Value.absent(),
    this.backgroundImageUrl = const Value.absent(),
    this.backgroundImagePath = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.coverImagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.developer = const Value.absent(),
    this.publisher = const Value.absent(),
  });
  LocalAppTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.lastLaunchedInstUUID = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.iconImageUrl = const Value.absent(),
    this.iconImagePath = const Value.absent(),
    this.backgroundImageUrl = const Value.absent(),
    this.backgroundImagePath = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.coverImagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.developer = const Value.absent(),
    this.publisher = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name);
  static Insertable<LocalApp> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? lastLaunchedInstUUID,
    Expression<String>? shortDescription,
    Expression<String>? iconImageUrl,
    Expression<String>? iconImagePath,
    Expression<String>? backgroundImageUrl,
    Expression<String>? backgroundImagePath,
    Expression<String>? coverImageUrl,
    Expression<String>? coverImagePath,
    Expression<String>? description,
    Expression<String>? releaseDate,
    Expression<String>? developer,
    Expression<String>? publisher,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (lastLaunchedInstUUID != null)
        'last_launched_inst_u_u_i_d': lastLaunchedInstUUID,
      if (shortDescription != null) 'short_description': shortDescription,
      if (iconImageUrl != null) 'icon_image_url': iconImageUrl,
      if (iconImagePath != null) 'icon_image_path': iconImagePath,
      if (backgroundImageUrl != null)
        'background_image_url': backgroundImageUrl,
      if (backgroundImagePath != null)
        'background_image_path': backgroundImagePath,
      if (coverImageUrl != null) 'cover_image_url': coverImageUrl,
      if (coverImagePath != null) 'cover_image_path': coverImagePath,
      if (description != null) 'description': description,
      if (releaseDate != null) 'release_date': releaseDate,
      if (developer != null) 'developer': developer,
      if (publisher != null) 'publisher': publisher,
    });
  }

  LocalAppTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String?>? lastLaunchedInstUUID,
      Value<String?>? shortDescription,
      Value<String?>? iconImageUrl,
      Value<String?>? iconImagePath,
      Value<String?>? backgroundImageUrl,
      Value<String?>? backgroundImagePath,
      Value<String?>? coverImageUrl,
      Value<String?>? coverImagePath,
      Value<String?>? description,
      Value<String?>? releaseDate,
      Value<String?>? developer,
      Value<String?>? publisher}) {
    return LocalAppTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      lastLaunchedInstUUID: lastLaunchedInstUUID ?? this.lastLaunchedInstUUID,
      shortDescription: shortDescription ?? this.shortDescription,
      iconImageUrl: iconImageUrl ?? this.iconImageUrl,
      iconImagePath: iconImagePath ?? this.iconImagePath,
      backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      coverImagePath: coverImagePath ?? this.coverImagePath,
      description: description ?? this.description,
      releaseDate: releaseDate ?? this.releaseDate,
      developer: developer ?? this.developer,
      publisher: publisher ?? this.publisher,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastLaunchedInstUUID.present) {
      map['last_launched_inst_u_u_i_d'] =
          Variable<String>(lastLaunchedInstUUID.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (iconImageUrl.present) {
      map['icon_image_url'] = Variable<String>(iconImageUrl.value);
    }
    if (iconImagePath.present) {
      map['icon_image_path'] = Variable<String>(iconImagePath.value);
    }
    if (backgroundImageUrl.present) {
      map['background_image_url'] = Variable<String>(backgroundImageUrl.value);
    }
    if (backgroundImagePath.present) {
      map['background_image_path'] =
          Variable<String>(backgroundImagePath.value);
    }
    if (coverImageUrl.present) {
      map['cover_image_url'] = Variable<String>(coverImageUrl.value);
    }
    if (coverImagePath.present) {
      map['cover_image_path'] = Variable<String>(coverImagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (developer.present) {
      map['developer'] = Variable<String>(developer.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalAppTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('lastLaunchedInstUUID: $lastLaunchedInstUUID, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('iconImageUrl: $iconImageUrl, ')
          ..write('iconImagePath: $iconImagePath, ')
          ..write('backgroundImageUrl: $backgroundImageUrl, ')
          ..write('backgroundImagePath: $backgroundImagePath, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('coverImagePath: $coverImagePath, ')
          ..write('description: $description, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('developer: $developer, ')
          ..write('publisher: $publisher')
          ..write(')'))
        .toString();
  }
}

class $LocalAppInstTableTable extends LocalAppInstTable
    with TableInfo<$LocalAppInstTableTable, LocalAppInst> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalAppInstTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _appUUIDMeta =
      const VerificationMeta('appUUID');
  @override
  late final GeneratedColumn<String> appUUID = GeneratedColumn<String>(
      'app_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastLaunchedLauncherUUIDMeta =
      const VerificationMeta('lastLaunchedLauncherUUID');
  @override
  late final GeneratedColumn<String> lastLaunchedLauncherUUID =
      GeneratedColumn<String>(
          'last_launched_launcher_u_u_i_d', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, appUUID, name, path, version, lastLaunchedLauncherUUID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_app_inst_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocalAppInst> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('app_u_u_i_d')) {
      context.handle(_appUUIDMeta,
          appUUID.isAcceptableOrUnknown(data['app_u_u_i_d']!, _appUUIDMeta));
    } else if (isInserting) {
      context.missing(_appUUIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('last_launched_launcher_u_u_i_d')) {
      context.handle(
          _lastLaunchedLauncherUUIDMeta,
          lastLaunchedLauncherUUID.isAcceptableOrUnknown(
              data['last_launched_launcher_u_u_i_d']!,
              _lastLaunchedLauncherUUIDMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalAppInst map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalAppInst(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      appUUID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_u_u_i_d'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
      lastLaunchedLauncherUUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}last_launched_launcher_u_u_i_d']),
    );
  }

  @override
  $LocalAppInstTableTable createAlias(String alias) {
    return $LocalAppInstTableTable(attachedDatabase, alias);
  }
}

class LocalAppInstTableCompanion extends UpdateCompanion<LocalAppInst> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> appUUID;
  final Value<String?> name;
  final Value<String> path;
  final Value<String> version;
  final Value<String?> lastLaunchedLauncherUUID;
  const LocalAppInstTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.appUUID = const Value.absent(),
    this.name = const Value.absent(),
    this.path = const Value.absent(),
    this.version = const Value.absent(),
    this.lastLaunchedLauncherUUID = const Value.absent(),
  });
  LocalAppInstTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String appUUID,
    this.name = const Value.absent(),
    required String path,
    required String version,
    this.lastLaunchedLauncherUUID = const Value.absent(),
  })  : uuid = Value(uuid),
        appUUID = Value(appUUID),
        path = Value(path),
        version = Value(version);
  static Insertable<LocalAppInst> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? appUUID,
    Expression<String>? name,
    Expression<String>? path,
    Expression<String>? version,
    Expression<String>? lastLaunchedLauncherUUID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (appUUID != null) 'app_u_u_i_d': appUUID,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (version != null) 'version': version,
      if (lastLaunchedLauncherUUID != null)
        'last_launched_launcher_u_u_i_d': lastLaunchedLauncherUUID,
    });
  }

  LocalAppInstTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? appUUID,
      Value<String?>? name,
      Value<String>? path,
      Value<String>? version,
      Value<String?>? lastLaunchedLauncherUUID}) {
    return LocalAppInstTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      appUUID: appUUID ?? this.appUUID,
      name: name ?? this.name,
      path: path ?? this.path,
      version: version ?? this.version,
      lastLaunchedLauncherUUID:
          lastLaunchedLauncherUUID ?? this.lastLaunchedLauncherUUID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (appUUID.present) {
      map['app_u_u_i_d'] = Variable<String>(appUUID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (lastLaunchedLauncherUUID.present) {
      map['last_launched_launcher_u_u_i_d'] =
          Variable<String>(lastLaunchedLauncherUUID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalAppInstTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('appUUID: $appUUID, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('version: $version, ')
          ..write('lastLaunchedLauncherUUID: $lastLaunchedLauncherUUID')
          ..write(')'))
        .toString();
  }
}

class $LocalAppInstLauncherTableTable extends LocalAppInstLauncherTable
    with TableInfo<$LocalAppInstLauncherTableTable, LocalAppInstLauncher> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalAppInstLauncherTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _appInstUUIDMeta =
      const VerificationMeta('appInstUUID');
  @override
  late final GeneratedColumn<String> appInstUUID = GeneratedColumn<String>(
      'app_inst_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _launcherTypeMeta =
      const VerificationMeta('launcherType');
  @override
  late final GeneratedColumnWithTypeConverter<LocalAppInstLauncherType, int>
      launcherType = GeneratedColumn<int>('launcher_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LocalAppInstLauncherType>(
              $LocalAppInstLauncherTableTable.$converterlauncherType);
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'));
  static const VerificationMeta _commonMeta = const VerificationMeta('common');
  @override
  late final GeneratedColumnWithTypeConverter<LocalAppInstLaunchCommon?, String>
      common = GeneratedColumn<String>('common', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<LocalAppInstLaunchCommon?>(
              $LocalAppInstLauncherTableTable.$convertercommonn);
  static const VerificationMeta _steamMeta = const VerificationMeta('steam');
  @override
  late final GeneratedColumnWithTypeConverter<LocalAppInstLaunchSteam?, String>
      steam = GeneratedColumn<String>('steam', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<LocalAppInstLaunchSteam?>(
              $LocalAppInstLauncherTableTable.$convertersteamn);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, appInstUUID, launcherType, favorite, common, steam];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_app_inst_launcher_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalAppInstLauncher> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('app_inst_u_u_i_d')) {
      context.handle(
          _appInstUUIDMeta,
          appInstUUID.isAcceptableOrUnknown(
              data['app_inst_u_u_i_d']!, _appInstUUIDMeta));
    } else if (isInserting) {
      context.missing(_appInstUUIDMeta);
    }
    context.handle(_launcherTypeMeta, const VerificationResult.success());
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    context.handle(_commonMeta, const VerificationResult.success());
    context.handle(_steamMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalAppInstLauncher map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalAppInstLauncher(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      appInstUUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}app_inst_u_u_i_d'])!,
      launcherType: $LocalAppInstLauncherTableTable.$converterlauncherType
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}launcher_type'])!),
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite']),
      common: $LocalAppInstLauncherTableTable.$convertercommonn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}common'])),
      steam: $LocalAppInstLauncherTableTable.$convertersteamn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}steam'])),
    );
  }

  @override
  $LocalAppInstLauncherTableTable createAlias(String alias) {
    return $LocalAppInstLauncherTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LocalAppInstLauncherType, int, int>
      $converterlauncherType =
      const EnumIndexConverter<LocalAppInstLauncherType>(
          LocalAppInstLauncherType.values);
  static JsonTypeConverter2<LocalAppInstLaunchCommon, String, String>
      $convertercommon = const LocalAppInstLaunchCommonConverter();
  static JsonTypeConverter2<LocalAppInstLaunchCommon?, String?, String?>
      $convertercommonn = JsonTypeConverter2.asNullable($convertercommon);
  static JsonTypeConverter2<LocalAppInstLaunchSteam, String, String>
      $convertersteam = const LocalAppInstLaunchSteamConverter();
  static JsonTypeConverter2<LocalAppInstLaunchSteam?, String?, String?>
      $convertersteamn = JsonTypeConverter2.asNullable($convertersteam);
}

class LocalAppInstLauncherTableCompanion
    extends UpdateCompanion<LocalAppInstLauncher> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> appInstUUID;
  final Value<LocalAppInstLauncherType> launcherType;
  final Value<bool?> favorite;
  final Value<LocalAppInstLaunchCommon?> common;
  final Value<LocalAppInstLaunchSteam?> steam;
  const LocalAppInstLauncherTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.appInstUUID = const Value.absent(),
    this.launcherType = const Value.absent(),
    this.favorite = const Value.absent(),
    this.common = const Value.absent(),
    this.steam = const Value.absent(),
  });
  LocalAppInstLauncherTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String appInstUUID,
    required LocalAppInstLauncherType launcherType,
    this.favorite = const Value.absent(),
    this.common = const Value.absent(),
    this.steam = const Value.absent(),
  })  : uuid = Value(uuid),
        appInstUUID = Value(appInstUUID),
        launcherType = Value(launcherType);
  static Insertable<LocalAppInstLauncher> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? appInstUUID,
    Expression<int>? launcherType,
    Expression<bool>? favorite,
    Expression<String>? common,
    Expression<String>? steam,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (appInstUUID != null) 'app_inst_u_u_i_d': appInstUUID,
      if (launcherType != null) 'launcher_type': launcherType,
      if (favorite != null) 'favorite': favorite,
      if (common != null) 'common': common,
      if (steam != null) 'steam': steam,
    });
  }

  LocalAppInstLauncherTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? appInstUUID,
      Value<LocalAppInstLauncherType>? launcherType,
      Value<bool?>? favorite,
      Value<LocalAppInstLaunchCommon?>? common,
      Value<LocalAppInstLaunchSteam?>? steam}) {
    return LocalAppInstLauncherTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      appInstUUID: appInstUUID ?? this.appInstUUID,
      launcherType: launcherType ?? this.launcherType,
      favorite: favorite ?? this.favorite,
      common: common ?? this.common,
      steam: steam ?? this.steam,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (appInstUUID.present) {
      map['app_inst_u_u_i_d'] = Variable<String>(appInstUUID.value);
    }
    if (launcherType.present) {
      map['launcher_type'] = Variable<int>($LocalAppInstLauncherTableTable
          .$converterlauncherType
          .toSql(launcherType.value));
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (common.present) {
      map['common'] = Variable<String>($LocalAppInstLauncherTableTable
          .$convertercommonn
          .toSql(common.value));
    }
    if (steam.present) {
      map['steam'] = Variable<String>(
          $LocalAppInstLauncherTableTable.$convertersteamn.toSql(steam.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalAppInstLauncherTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('appInstUUID: $appInstUUID, ')
          ..write('launcherType: $launcherType, ')
          ..write('favorite: $favorite, ')
          ..write('common: $common, ')
          ..write('steam: $steam')
          ..write(')'))
        .toString();
  }
}

class $LocalAppRunRecordTableTable extends LocalAppRunRecordTable
    with TableInfo<$LocalAppRunRecordTableTable, LocalAppRunRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalAppRunRecordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _appUUIDMeta =
      const VerificationMeta('appUUID');
  @override
  late final GeneratedColumn<String> appUUID = GeneratedColumn<String>(
      'app_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instUUIDMeta =
      const VerificationMeta('instUUID');
  @override
  late final GeneratedColumn<String> instUUID = GeneratedColumn<String>(
      'inst_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _launcherUUIDMeta =
      const VerificationMeta('launcherUUID');
  @override
  late final GeneratedColumn<String> launcherUUID = GeneratedColumn<String>(
      'launcher_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, appUUID, instUUID, launcherUUID, startTime, endTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_app_run_record_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocalAppRunRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('app_u_u_i_d')) {
      context.handle(_appUUIDMeta,
          appUUID.isAcceptableOrUnknown(data['app_u_u_i_d']!, _appUUIDMeta));
    } else if (isInserting) {
      context.missing(_appUUIDMeta);
    }
    if (data.containsKey('inst_u_u_i_d')) {
      context.handle(_instUUIDMeta,
          instUUID.isAcceptableOrUnknown(data['inst_u_u_i_d']!, _instUUIDMeta));
    } else if (isInserting) {
      context.missing(_instUUIDMeta);
    }
    if (data.containsKey('launcher_u_u_i_d')) {
      context.handle(
          _launcherUUIDMeta,
          launcherUUID.isAcceptableOrUnknown(
              data['launcher_u_u_i_d']!, _launcherUUIDMeta));
    } else if (isInserting) {
      context.missing(_launcherUUIDMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalAppRunRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalAppRunRecord(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      appUUID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_u_u_i_d'])!,
      instUUID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}inst_u_u_i_d'])!,
      launcherUUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}launcher_u_u_i_d'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
    );
  }

  @override
  $LocalAppRunRecordTableTable createAlias(String alias) {
    return $LocalAppRunRecordTableTable(attachedDatabase, alias);
  }
}

class LocalAppRunRecordTableCompanion
    extends UpdateCompanion<LocalAppRunRecord> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> appUUID;
  final Value<String> instUUID;
  final Value<String> launcherUUID;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  const LocalAppRunRecordTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.appUUID = const Value.absent(),
    this.instUUID = const Value.absent(),
    this.launcherUUID = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  LocalAppRunRecordTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String appUUID,
    required String instUUID,
    required String launcherUUID,
    required DateTime startTime,
    this.endTime = const Value.absent(),
  })  : uuid = Value(uuid),
        appUUID = Value(appUUID),
        instUUID = Value(instUUID),
        launcherUUID = Value(launcherUUID),
        startTime = Value(startTime);
  static Insertable<LocalAppRunRecord> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? appUUID,
    Expression<String>? instUUID,
    Expression<String>? launcherUUID,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (appUUID != null) 'app_u_u_i_d': appUUID,
      if (instUUID != null) 'inst_u_u_i_d': instUUID,
      if (launcherUUID != null) 'launcher_u_u_i_d': launcherUUID,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  LocalAppRunRecordTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? appUUID,
      Value<String>? instUUID,
      Value<String>? launcherUUID,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime}) {
    return LocalAppRunRecordTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      appUUID: appUUID ?? this.appUUID,
      instUUID: instUUID ?? this.instUUID,
      launcherUUID: launcherUUID ?? this.launcherUUID,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (appUUID.present) {
      map['app_u_u_i_d'] = Variable<String>(appUUID.value);
    }
    if (instUUID.present) {
      map['inst_u_u_i_d'] = Variable<String>(instUUID.value);
    }
    if (launcherUUID.present) {
      map['launcher_u_u_i_d'] = Variable<String>(launcherUUID.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalAppRunRecordTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('appUUID: $appUUID, ')
          ..write('instUUID: $instUUID, ')
          ..write('launcherUUID: $launcherUUID, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $LocalCommonAppScanTableTable extends LocalCommonAppScanTable
    with TableInfo<$LocalCommonAppScanTableTable, LocalCommonAppScan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalCommonAppScanTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _basePathMeta =
      const VerificationMeta('basePath');
  @override
  late final GeneratedColumn<String> basePath = GeneratedColumn<String>(
      'base_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enableAutoScanMeta =
      const VerificationMeta('enableAutoScan');
  @override
  late final GeneratedColumn<bool> enableAutoScan = GeneratedColumn<bool>(
      'enable_auto_scan', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_auto_scan" IN (0, 1))'));
  static const VerificationMeta _excludeDirectoryMatchersMeta =
      const VerificationMeta('excludeDirectoryMatchers');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      excludeDirectoryMatchers = GeneratedColumn<String>(
              'exclude_directory_matchers', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $LocalCommonAppScanTableTable.$converterexcludeDirectoryMatchers);
  static const VerificationMeta _minInstallDirDepthMeta =
      const VerificationMeta('minInstallDirDepth');
  @override
  late final GeneratedColumn<int> minInstallDirDepth = GeneratedColumn<int>(
      'min_install_dir_depth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxInstallDirDepthMeta =
      const VerificationMeta('maxInstallDirDepth');
  @override
  late final GeneratedColumn<int> maxInstallDirDepth = GeneratedColumn<int>(
      'max_install_dir_depth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pathFieldMatcherMeta =
      const VerificationMeta('pathFieldMatcher');
  @override
  late final GeneratedColumnWithTypeConverter<
          List<LocalCommonAppScanPathFieldMatcher>, String> pathFieldMatcher =
      GeneratedColumn<String>('path_field_matcher', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<LocalCommonAppScanPathFieldMatcher>>(
              $LocalCommonAppScanTableTable.$converterpathFieldMatcher);
  static const VerificationMeta _pathFieldMatcherAlignmentMeta =
      const VerificationMeta('pathFieldMatcherAlignment');
  @override
  late final GeneratedColumnWithTypeConverter<
      LocalCommonAppScanPathFieldMatcherAlignment,
      String> pathFieldMatcherAlignment = GeneratedColumn<String>(
          'path_field_matcher_alignment', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<LocalCommonAppScanPathFieldMatcherAlignment>(
          $LocalCommonAppScanTableTable.$converterpathFieldMatcherAlignment);
  static const VerificationMeta _includeExecutableMatchersMeta =
      const VerificationMeta('includeExecutableMatchers');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      includeExecutableMatchers = GeneratedColumn<String>(
              'include_executable_matchers', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($LocalCommonAppScanTableTable
              .$converterincludeExecutableMatchers);
  static const VerificationMeta _excludeExecutableMatchersMeta =
      const VerificationMeta('excludeExecutableMatchers');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      excludeExecutableMatchers = GeneratedColumn<String>(
              'exclude_executable_matchers', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($LocalCommonAppScanTableTable
              .$converterexcludeExecutableMatchers);
  static const VerificationMeta _minExecutableDepthMeta =
      const VerificationMeta('minExecutableDepth');
  @override
  late final GeneratedColumn<int> minExecutableDepth = GeneratedColumn<int>(
      'min_executable_depth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxExecutableDepthMeta =
      const VerificationMeta('maxExecutableDepth');
  @override
  late final GeneratedColumn<int> maxExecutableDepth = GeneratedColumn<int>(
      'max_executable_depth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        basePath,
        enableAutoScan,
        excludeDirectoryMatchers,
        minInstallDirDepth,
        maxInstallDirDepth,
        pathFieldMatcher,
        pathFieldMatcherAlignment,
        includeExecutableMatchers,
        excludeExecutableMatchers,
        minExecutableDepth,
        maxExecutableDepth
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_common_app_scan_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocalCommonAppScan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('base_path')) {
      context.handle(_basePathMeta,
          basePath.isAcceptableOrUnknown(data['base_path']!, _basePathMeta));
    } else if (isInserting) {
      context.missing(_basePathMeta);
    }
    if (data.containsKey('enable_auto_scan')) {
      context.handle(
          _enableAutoScanMeta,
          enableAutoScan.isAcceptableOrUnknown(
              data['enable_auto_scan']!, _enableAutoScanMeta));
    } else if (isInserting) {
      context.missing(_enableAutoScanMeta);
    }
    context.handle(
        _excludeDirectoryMatchersMeta, const VerificationResult.success());
    if (data.containsKey('min_install_dir_depth')) {
      context.handle(
          _minInstallDirDepthMeta,
          minInstallDirDepth.isAcceptableOrUnknown(
              data['min_install_dir_depth']!, _minInstallDirDepthMeta));
    } else if (isInserting) {
      context.missing(_minInstallDirDepthMeta);
    }
    if (data.containsKey('max_install_dir_depth')) {
      context.handle(
          _maxInstallDirDepthMeta,
          maxInstallDirDepth.isAcceptableOrUnknown(
              data['max_install_dir_depth']!, _maxInstallDirDepthMeta));
    } else if (isInserting) {
      context.missing(_maxInstallDirDepthMeta);
    }
    context.handle(_pathFieldMatcherMeta, const VerificationResult.success());
    context.handle(
        _pathFieldMatcherAlignmentMeta, const VerificationResult.success());
    context.handle(
        _includeExecutableMatchersMeta, const VerificationResult.success());
    context.handle(
        _excludeExecutableMatchersMeta, const VerificationResult.success());
    if (data.containsKey('min_executable_depth')) {
      context.handle(
          _minExecutableDepthMeta,
          minExecutableDepth.isAcceptableOrUnknown(
              data['min_executable_depth']!, _minExecutableDepthMeta));
    } else if (isInserting) {
      context.missing(_minExecutableDepthMeta);
    }
    if (data.containsKey('max_executable_depth')) {
      context.handle(
          _maxExecutableDepthMeta,
          maxExecutableDepth.isAcceptableOrUnknown(
              data['max_executable_depth']!, _maxExecutableDepthMeta));
    } else if (isInserting) {
      context.missing(_maxExecutableDepthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalCommonAppScan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalCommonAppScan(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      basePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_path'])!,
      enableAutoScan: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enable_auto_scan'])!,
      excludeDirectoryMatchers: $LocalCommonAppScanTableTable
          .$converterexcludeDirectoryMatchers
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}exclude_directory_matchers'])!),
      minInstallDirDepth: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}min_install_dir_depth'])!,
      maxInstallDirDepth: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}max_install_dir_depth'])!,
      pathFieldMatcher: $LocalCommonAppScanTableTable.$converterpathFieldMatcher
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}path_field_matcher'])!),
      pathFieldMatcherAlignment: $LocalCommonAppScanTableTable
          .$converterpathFieldMatcherAlignment
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}path_field_matcher_alignment'])!),
      includeExecutableMatchers: $LocalCommonAppScanTableTable
          .$converterincludeExecutableMatchers
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}include_executable_matchers'])!),
      excludeExecutableMatchers: $LocalCommonAppScanTableTable
          .$converterexcludeExecutableMatchers
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}exclude_executable_matchers'])!),
      minExecutableDepth: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}min_executable_depth'])!,
      maxExecutableDepth: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}max_executable_depth'])!,
    );
  }

  @override
  $LocalCommonAppScanTableTable createAlias(String alias) {
    return $LocalCommonAppScanTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<String>, String, String>
      $converterexcludeDirectoryMatchers = const StringListConverter();
  static JsonTypeConverter2<List<LocalCommonAppScanPathFieldMatcher>, String,
          String> $converterpathFieldMatcher =
      EnumListConverter(() => LocalCommonAppScanPathFieldMatcher.values);
  static JsonTypeConverter2<LocalCommonAppScanPathFieldMatcherAlignment, String,
          String> $converterpathFieldMatcherAlignment =
      const EnumNameConverter<LocalCommonAppScanPathFieldMatcherAlignment>(
          LocalCommonAppScanPathFieldMatcherAlignment.values);
  static JsonTypeConverter2<List<String>, String, String>
      $converterincludeExecutableMatchers = const StringListConverter();
  static JsonTypeConverter2<List<String>, String, String>
      $converterexcludeExecutableMatchers = const StringListConverter();
}

class LocalCommonAppScanTableCompanion
    extends UpdateCompanion<LocalCommonAppScan> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> basePath;
  final Value<bool> enableAutoScan;
  final Value<List<String>> excludeDirectoryMatchers;
  final Value<int> minInstallDirDepth;
  final Value<int> maxInstallDirDepth;
  final Value<List<LocalCommonAppScanPathFieldMatcher>> pathFieldMatcher;
  final Value<LocalCommonAppScanPathFieldMatcherAlignment>
      pathFieldMatcherAlignment;
  final Value<List<String>> includeExecutableMatchers;
  final Value<List<String>> excludeExecutableMatchers;
  final Value<int> minExecutableDepth;
  final Value<int> maxExecutableDepth;
  const LocalCommonAppScanTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.basePath = const Value.absent(),
    this.enableAutoScan = const Value.absent(),
    this.excludeDirectoryMatchers = const Value.absent(),
    this.minInstallDirDepth = const Value.absent(),
    this.maxInstallDirDepth = const Value.absent(),
    this.pathFieldMatcher = const Value.absent(),
    this.pathFieldMatcherAlignment = const Value.absent(),
    this.includeExecutableMatchers = const Value.absent(),
    this.excludeExecutableMatchers = const Value.absent(),
    this.minExecutableDepth = const Value.absent(),
    this.maxExecutableDepth = const Value.absent(),
  });
  LocalCommonAppScanTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String basePath,
    required bool enableAutoScan,
    required List<String> excludeDirectoryMatchers,
    required int minInstallDirDepth,
    required int maxInstallDirDepth,
    required List<LocalCommonAppScanPathFieldMatcher> pathFieldMatcher,
    required LocalCommonAppScanPathFieldMatcherAlignment
        pathFieldMatcherAlignment,
    required List<String> includeExecutableMatchers,
    required List<String> excludeExecutableMatchers,
    required int minExecutableDepth,
    required int maxExecutableDepth,
  })  : uuid = Value(uuid),
        basePath = Value(basePath),
        enableAutoScan = Value(enableAutoScan),
        excludeDirectoryMatchers = Value(excludeDirectoryMatchers),
        minInstallDirDepth = Value(minInstallDirDepth),
        maxInstallDirDepth = Value(maxInstallDirDepth),
        pathFieldMatcher = Value(pathFieldMatcher),
        pathFieldMatcherAlignment = Value(pathFieldMatcherAlignment),
        includeExecutableMatchers = Value(includeExecutableMatchers),
        excludeExecutableMatchers = Value(excludeExecutableMatchers),
        minExecutableDepth = Value(minExecutableDepth),
        maxExecutableDepth = Value(maxExecutableDepth);
  static Insertable<LocalCommonAppScan> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? basePath,
    Expression<bool>? enableAutoScan,
    Expression<String>? excludeDirectoryMatchers,
    Expression<int>? minInstallDirDepth,
    Expression<int>? maxInstallDirDepth,
    Expression<String>? pathFieldMatcher,
    Expression<String>? pathFieldMatcherAlignment,
    Expression<String>? includeExecutableMatchers,
    Expression<String>? excludeExecutableMatchers,
    Expression<int>? minExecutableDepth,
    Expression<int>? maxExecutableDepth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (basePath != null) 'base_path': basePath,
      if (enableAutoScan != null) 'enable_auto_scan': enableAutoScan,
      if (excludeDirectoryMatchers != null)
        'exclude_directory_matchers': excludeDirectoryMatchers,
      if (minInstallDirDepth != null)
        'min_install_dir_depth': minInstallDirDepth,
      if (maxInstallDirDepth != null)
        'max_install_dir_depth': maxInstallDirDepth,
      if (pathFieldMatcher != null) 'path_field_matcher': pathFieldMatcher,
      if (pathFieldMatcherAlignment != null)
        'path_field_matcher_alignment': pathFieldMatcherAlignment,
      if (includeExecutableMatchers != null)
        'include_executable_matchers': includeExecutableMatchers,
      if (excludeExecutableMatchers != null)
        'exclude_executable_matchers': excludeExecutableMatchers,
      if (minExecutableDepth != null)
        'min_executable_depth': minExecutableDepth,
      if (maxExecutableDepth != null)
        'max_executable_depth': maxExecutableDepth,
    });
  }

  LocalCommonAppScanTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? basePath,
      Value<bool>? enableAutoScan,
      Value<List<String>>? excludeDirectoryMatchers,
      Value<int>? minInstallDirDepth,
      Value<int>? maxInstallDirDepth,
      Value<List<LocalCommonAppScanPathFieldMatcher>>? pathFieldMatcher,
      Value<LocalCommonAppScanPathFieldMatcherAlignment>?
          pathFieldMatcherAlignment,
      Value<List<String>>? includeExecutableMatchers,
      Value<List<String>>? excludeExecutableMatchers,
      Value<int>? minExecutableDepth,
      Value<int>? maxExecutableDepth}) {
    return LocalCommonAppScanTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      basePath: basePath ?? this.basePath,
      enableAutoScan: enableAutoScan ?? this.enableAutoScan,
      excludeDirectoryMatchers:
          excludeDirectoryMatchers ?? this.excludeDirectoryMatchers,
      minInstallDirDepth: minInstallDirDepth ?? this.minInstallDirDepth,
      maxInstallDirDepth: maxInstallDirDepth ?? this.maxInstallDirDepth,
      pathFieldMatcher: pathFieldMatcher ?? this.pathFieldMatcher,
      pathFieldMatcherAlignment:
          pathFieldMatcherAlignment ?? this.pathFieldMatcherAlignment,
      includeExecutableMatchers:
          includeExecutableMatchers ?? this.includeExecutableMatchers,
      excludeExecutableMatchers:
          excludeExecutableMatchers ?? this.excludeExecutableMatchers,
      minExecutableDepth: minExecutableDepth ?? this.minExecutableDepth,
      maxExecutableDepth: maxExecutableDepth ?? this.maxExecutableDepth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (basePath.present) {
      map['base_path'] = Variable<String>(basePath.value);
    }
    if (enableAutoScan.present) {
      map['enable_auto_scan'] = Variable<bool>(enableAutoScan.value);
    }
    if (excludeDirectoryMatchers.present) {
      map['exclude_directory_matchers'] = Variable<String>(
          $LocalCommonAppScanTableTable.$converterexcludeDirectoryMatchers
              .toSql(excludeDirectoryMatchers.value));
    }
    if (minInstallDirDepth.present) {
      map['min_install_dir_depth'] = Variable<int>(minInstallDirDepth.value);
    }
    if (maxInstallDirDepth.present) {
      map['max_install_dir_depth'] = Variable<int>(maxInstallDirDepth.value);
    }
    if (pathFieldMatcher.present) {
      map['path_field_matcher'] = Variable<String>($LocalCommonAppScanTableTable
          .$converterpathFieldMatcher
          .toSql(pathFieldMatcher.value));
    }
    if (pathFieldMatcherAlignment.present) {
      map['path_field_matcher_alignment'] = Variable<String>(
          $LocalCommonAppScanTableTable.$converterpathFieldMatcherAlignment
              .toSql(pathFieldMatcherAlignment.value));
    }
    if (includeExecutableMatchers.present) {
      map['include_executable_matchers'] = Variable<String>(
          $LocalCommonAppScanTableTable.$converterincludeExecutableMatchers
              .toSql(includeExecutableMatchers.value));
    }
    if (excludeExecutableMatchers.present) {
      map['exclude_executable_matchers'] = Variable<String>(
          $LocalCommonAppScanTableTable.$converterexcludeExecutableMatchers
              .toSql(excludeExecutableMatchers.value));
    }
    if (minExecutableDepth.present) {
      map['min_executable_depth'] = Variable<int>(minExecutableDepth.value);
    }
    if (maxExecutableDepth.present) {
      map['max_executable_depth'] = Variable<int>(maxExecutableDepth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalCommonAppScanTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('basePath: $basePath, ')
          ..write('enableAutoScan: $enableAutoScan, ')
          ..write('excludeDirectoryMatchers: $excludeDirectoryMatchers, ')
          ..write('minInstallDirDepth: $minInstallDirDepth, ')
          ..write('maxInstallDirDepth: $maxInstallDirDepth, ')
          ..write('pathFieldMatcher: $pathFieldMatcher, ')
          ..write('pathFieldMatcherAlignment: $pathFieldMatcherAlignment, ')
          ..write('includeExecutableMatchers: $includeExecutableMatchers, ')
          ..write('excludeExecutableMatchers: $excludeExecutableMatchers, ')
          ..write('minExecutableDepth: $minExecutableDepth, ')
          ..write('maxExecutableDepth: $maxExecutableDepth')
          ..write(')'))
        .toString();
  }
}

class $LocalCommonAppScanResultTableTable extends LocalCommonAppScanResultTable
    with
        TableInfo<$LocalCommonAppScanResultTableTable,
            LocalCommonAppScanResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalCommonAppScanResultTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _scanUUIDMeta =
      const VerificationMeta('scanUUID');
  @override
  late final GeneratedColumn<String> scanUUID = GeneratedColumn<String>(
      'scan_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _installPathMeta =
      const VerificationMeta('installPath');
  @override
  late final GeneratedColumn<String> installPath = GeneratedColumn<String>(
      'install_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _launcherPathsMeta =
      const VerificationMeta('launcherPaths');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      launcherPaths = GeneratedColumn<String>(
              'launcher_paths', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $LocalCommonAppScanResultTableTable.$converterlauncherPaths);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, scanUUID, name, version, installPath, launcherPaths];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_common_app_scan_result_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalCommonAppScanResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('scan_u_u_i_d')) {
      context.handle(_scanUUIDMeta,
          scanUUID.isAcceptableOrUnknown(data['scan_u_u_i_d']!, _scanUUIDMeta));
    } else if (isInserting) {
      context.missing(_scanUUIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('install_path')) {
      context.handle(
          _installPathMeta,
          installPath.isAcceptableOrUnknown(
              data['install_path']!, _installPathMeta));
    } else if (isInserting) {
      context.missing(_installPathMeta);
    }
    context.handle(_launcherPathsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalCommonAppScanResult map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalCommonAppScanResult(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      scanUUID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scan_u_u_i_d'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version']),
      installPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}install_path'])!,
      launcherPaths: $LocalCommonAppScanResultTableTable.$converterlauncherPaths
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}launcher_paths'])!),
    );
  }

  @override
  $LocalCommonAppScanResultTableTable createAlias(String alias) {
    return $LocalCommonAppScanResultTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<String>, String, String>
      $converterlauncherPaths = const StringListConverter();
}

class LocalCommonAppScanResultTableCompanion
    extends UpdateCompanion<LocalCommonAppScanResult> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> scanUUID;
  final Value<String?> name;
  final Value<String?> version;
  final Value<String> installPath;
  final Value<List<String>> launcherPaths;
  const LocalCommonAppScanResultTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.scanUUID = const Value.absent(),
    this.name = const Value.absent(),
    this.version = const Value.absent(),
    this.installPath = const Value.absent(),
    this.launcherPaths = const Value.absent(),
  });
  LocalCommonAppScanResultTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String scanUUID,
    this.name = const Value.absent(),
    this.version = const Value.absent(),
    required String installPath,
    required List<String> launcherPaths,
  })  : uuid = Value(uuid),
        scanUUID = Value(scanUUID),
        installPath = Value(installPath),
        launcherPaths = Value(launcherPaths);
  static Insertable<LocalCommonAppScanResult> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? scanUUID,
    Expression<String>? name,
    Expression<String>? version,
    Expression<String>? installPath,
    Expression<String>? launcherPaths,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (scanUUID != null) 'scan_u_u_i_d': scanUUID,
      if (name != null) 'name': name,
      if (version != null) 'version': version,
      if (installPath != null) 'install_path': installPath,
      if (launcherPaths != null) 'launcher_paths': launcherPaths,
    });
  }

  LocalCommonAppScanResultTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? scanUUID,
      Value<String?>? name,
      Value<String?>? version,
      Value<String>? installPath,
      Value<List<String>>? launcherPaths}) {
    return LocalCommonAppScanResultTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      scanUUID: scanUUID ?? this.scanUUID,
      name: name ?? this.name,
      version: version ?? this.version,
      installPath: installPath ?? this.installPath,
      launcherPaths: launcherPaths ?? this.launcherPaths,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (scanUUID.present) {
      map['scan_u_u_i_d'] = Variable<String>(scanUUID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (installPath.present) {
      map['install_path'] = Variable<String>(installPath.value);
    }
    if (launcherPaths.present) {
      map['launcher_paths'] = Variable<String>(
          $LocalCommonAppScanResultTableTable.$converterlauncherPaths
              .toSql(launcherPaths.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalCommonAppScanResultTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('scanUUID: $scanUUID, ')
          ..write('name: $name, ')
          ..write('version: $version, ')
          ..write('installPath: $installPath, ')
          ..write('launcherPaths: $launcherPaths')
          ..write(')'))
        .toString();
  }
}

class $LocalSteamAppScanTableTable extends LocalSteamAppScanTable
    with TableInfo<$LocalSteamAppScanTableTable, LocalSteamAppScan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSteamAppScanTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _libraryPathMeta =
      const VerificationMeta('libraryPath');
  @override
  late final GeneratedColumn<String> libraryPath = GeneratedColumn<String>(
      'library_path', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _enableAutoScanMeta =
      const VerificationMeta('enableAutoScan');
  @override
  late final GeneratedColumn<bool> enableAutoScan = GeneratedColumn<bool>(
      'enable_auto_scan', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_auto_scan" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, uuid, libraryPath, enableAutoScan];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_steam_app_scan_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocalSteamAppScan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('library_path')) {
      context.handle(
          _libraryPathMeta,
          libraryPath.isAcceptableOrUnknown(
              data['library_path']!, _libraryPathMeta));
    } else if (isInserting) {
      context.missing(_libraryPathMeta);
    }
    if (data.containsKey('enable_auto_scan')) {
      context.handle(
          _enableAutoScanMeta,
          enableAutoScan.isAcceptableOrUnknown(
              data['enable_auto_scan']!, _enableAutoScanMeta));
    } else if (isInserting) {
      context.missing(_enableAutoScanMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalSteamAppScan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSteamAppScan(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      libraryPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}library_path'])!,
      enableAutoScan: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enable_auto_scan'])!,
    );
  }

  @override
  $LocalSteamAppScanTableTable createAlias(String alias) {
    return $LocalSteamAppScanTableTable(attachedDatabase, alias);
  }
}

class LocalSteamAppScanTableCompanion
    extends UpdateCompanion<LocalSteamAppScan> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> libraryPath;
  final Value<bool> enableAutoScan;
  const LocalSteamAppScanTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.libraryPath = const Value.absent(),
    this.enableAutoScan = const Value.absent(),
  });
  LocalSteamAppScanTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String libraryPath,
    required bool enableAutoScan,
  })  : uuid = Value(uuid),
        libraryPath = Value(libraryPath),
        enableAutoScan = Value(enableAutoScan);
  static Insertable<LocalSteamAppScan> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? libraryPath,
    Expression<bool>? enableAutoScan,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (libraryPath != null) 'library_path': libraryPath,
      if (enableAutoScan != null) 'enable_auto_scan': enableAutoScan,
    });
  }

  LocalSteamAppScanTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? libraryPath,
      Value<bool>? enableAutoScan}) {
    return LocalSteamAppScanTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      libraryPath: libraryPath ?? this.libraryPath,
      enableAutoScan: enableAutoScan ?? this.enableAutoScan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (libraryPath.present) {
      map['library_path'] = Variable<String>(libraryPath.value);
    }
    if (enableAutoScan.present) {
      map['enable_auto_scan'] = Variable<bool>(enableAutoScan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSteamAppScanTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('libraryPath: $libraryPath, ')
          ..write('enableAutoScan: $enableAutoScan')
          ..write(')'))
        .toString();
  }
}

class $LocalSteamAppScanResultTableTable extends LocalSteamAppScanResultTable
    with
        TableInfo<$LocalSteamAppScanResultTableTable, LocalSteamAppScanResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSteamAppScanResultTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _scanUUIDMeta =
      const VerificationMeta('scanUUID');
  @override
  late final GeneratedColumn<String> scanUUID = GeneratedColumn<String>(
      'scan_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _steamAppIDMeta =
      const VerificationMeta('steamAppID');
  @override
  late final GeneratedColumn<String> steamAppID = GeneratedColumn<String>(
      'steam_app_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _installPathMeta =
      const VerificationMeta('installPath');
  @override
  late final GeneratedColumn<String> installPath = GeneratedColumn<String>(
      'install_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _launcherPathMeta =
      const VerificationMeta('launcherPath');
  @override
  late final GeneratedColumn<String> launcherPath = GeneratedColumn<String>(
      'launcher_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeOnDiskMeta =
      const VerificationMeta('sizeOnDisk');
  @override
  late final GeneratedColumn<String> sizeOnDisk = GeneratedColumn<String>(
      'size_on_disk', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        scanUUID,
        steamAppID,
        name,
        installPath,
        launcherPath,
        sizeOnDisk
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_steam_app_scan_result_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalSteamAppScanResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('scan_u_u_i_d')) {
      context.handle(_scanUUIDMeta,
          scanUUID.isAcceptableOrUnknown(data['scan_u_u_i_d']!, _scanUUIDMeta));
    } else if (isInserting) {
      context.missing(_scanUUIDMeta);
    }
    if (data.containsKey('steam_app_i_d')) {
      context.handle(
          _steamAppIDMeta,
          steamAppID.isAcceptableOrUnknown(
              data['steam_app_i_d']!, _steamAppIDMeta));
    } else if (isInserting) {
      context.missing(_steamAppIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('install_path')) {
      context.handle(
          _installPathMeta,
          installPath.isAcceptableOrUnknown(
              data['install_path']!, _installPathMeta));
    } else if (isInserting) {
      context.missing(_installPathMeta);
    }
    if (data.containsKey('launcher_path')) {
      context.handle(
          _launcherPathMeta,
          launcherPath.isAcceptableOrUnknown(
              data['launcher_path']!, _launcherPathMeta));
    } else if (isInserting) {
      context.missing(_launcherPathMeta);
    }
    if (data.containsKey('size_on_disk')) {
      context.handle(
          _sizeOnDiskMeta,
          sizeOnDisk.isAcceptableOrUnknown(
              data['size_on_disk']!, _sizeOnDiskMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalSteamAppScanResult map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSteamAppScanResult(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      scanUUID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scan_u_u_i_d'])!,
      steamAppID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}steam_app_i_d'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      installPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}install_path'])!,
      launcherPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}launcher_path'])!,
      sizeOnDisk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size_on_disk']),
    );
  }

  @override
  $LocalSteamAppScanResultTableTable createAlias(String alias) {
    return $LocalSteamAppScanResultTableTable(attachedDatabase, alias);
  }
}

class LocalSteamAppScanResultTableCompanion
    extends UpdateCompanion<LocalSteamAppScanResult> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> scanUUID;
  final Value<String> steamAppID;
  final Value<String> name;
  final Value<String> installPath;
  final Value<String> launcherPath;
  final Value<String?> sizeOnDisk;
  const LocalSteamAppScanResultTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.scanUUID = const Value.absent(),
    this.steamAppID = const Value.absent(),
    this.name = const Value.absent(),
    this.installPath = const Value.absent(),
    this.launcherPath = const Value.absent(),
    this.sizeOnDisk = const Value.absent(),
  });
  LocalSteamAppScanResultTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String scanUUID,
    required String steamAppID,
    required String name,
    required String installPath,
    required String launcherPath,
    this.sizeOnDisk = const Value.absent(),
  })  : uuid = Value(uuid),
        scanUUID = Value(scanUUID),
        steamAppID = Value(steamAppID),
        name = Value(name),
        installPath = Value(installPath),
        launcherPath = Value(launcherPath);
  static Insertable<LocalSteamAppScanResult> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? scanUUID,
    Expression<String>? steamAppID,
    Expression<String>? name,
    Expression<String>? installPath,
    Expression<String>? launcherPath,
    Expression<String>? sizeOnDisk,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (scanUUID != null) 'scan_u_u_i_d': scanUUID,
      if (steamAppID != null) 'steam_app_i_d': steamAppID,
      if (name != null) 'name': name,
      if (installPath != null) 'install_path': installPath,
      if (launcherPath != null) 'launcher_path': launcherPath,
      if (sizeOnDisk != null) 'size_on_disk': sizeOnDisk,
    });
  }

  LocalSteamAppScanResultTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? scanUUID,
      Value<String>? steamAppID,
      Value<String>? name,
      Value<String>? installPath,
      Value<String>? launcherPath,
      Value<String?>? sizeOnDisk}) {
    return LocalSteamAppScanResultTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      scanUUID: scanUUID ?? this.scanUUID,
      steamAppID: steamAppID ?? this.steamAppID,
      name: name ?? this.name,
      installPath: installPath ?? this.installPath,
      launcherPath: launcherPath ?? this.launcherPath,
      sizeOnDisk: sizeOnDisk ?? this.sizeOnDisk,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (scanUUID.present) {
      map['scan_u_u_i_d'] = Variable<String>(scanUUID.value);
    }
    if (steamAppID.present) {
      map['steam_app_i_d'] = Variable<String>(steamAppID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (installPath.present) {
      map['install_path'] = Variable<String>(installPath.value);
    }
    if (launcherPath.present) {
      map['launcher_path'] = Variable<String>(launcherPath.value);
    }
    if (sizeOnDisk.present) {
      map['size_on_disk'] = Variable<String>(sizeOnDisk.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSteamAppScanResultTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('scanUUID: $scanUUID, ')
          ..write('steamAppID: $steamAppID, ')
          ..write('name: $name, ')
          ..write('installPath: $installPath, ')
          ..write('launcherPath: $launcherPath, ')
          ..write('sizeOnDisk: $sizeOnDisk')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $KVTableTable kVTable = $KVTableTable(this);
  late final $ServerConfigTableTable serverConfigTable =
      $ServerConfigTableTable(this);
  late final $FeedConfigTableTable feedConfigTable =
      $FeedConfigTableTable(this);
  late final $LocalAppTableTable localAppTable = $LocalAppTableTable(this);
  late final $LocalAppInstTableTable localAppInstTable =
      $LocalAppInstTableTable(this);
  late final $LocalAppInstLauncherTableTable localAppInstLauncherTable =
      $LocalAppInstLauncherTableTable(this);
  late final $LocalAppRunRecordTableTable localAppRunRecordTable =
      $LocalAppRunRecordTableTable(this);
  late final $LocalCommonAppScanTableTable localCommonAppScanTable =
      $LocalCommonAppScanTableTable(this);
  late final $LocalCommonAppScanResultTableTable localCommonAppScanResultTable =
      $LocalCommonAppScanResultTableTable(this);
  late final $LocalSteamAppScanTableTable localSteamAppScanTable =
      $LocalSteamAppScanTableTable(this);
  late final $LocalSteamAppScanResultTableTable localSteamAppScanResultTable =
      $LocalSteamAppScanResultTableTable(this);
  late final Index server = Index('server',
      'CREATE UNIQUE INDEX server ON server_config_table (host, port, username)');
  late final Index localAppUuid = Index('local_app_uuid',
      'CREATE INDEX local_app_uuid ON local_app_table (uuid)');
  late final Index localAppInstUuid = Index('local_app_inst_uuid',
      'CREATE INDEX local_app_inst_uuid ON local_app_inst_table (uuid)');
  late final Index localAppInstAppUuid = Index('local_app_inst_app_uuid',
      'CREATE INDEX local_app_inst_app_uuid ON local_app_inst_table (app_u_u_i_d)');
  late final Index localAppInstLauncherUuid = Index(
      'local_app_inst_launcher_uuid',
      'CREATE INDEX local_app_inst_launcher_uuid ON local_app_inst_launcher_table (uuid)');
  late final Index localAppInstLauncherAppInstUuid = Index(
      'local_app_inst_launcher_app_inst_uuid',
      'CREATE INDEX local_app_inst_launcher_app_inst_uuid ON local_app_inst_launcher_table (app_inst_u_u_i_d)');
  late final Index localAppRunRecordUuid = Index('local_app_run_record_uuid',
      'CREATE INDEX local_app_run_record_uuid ON local_app_run_record_table (uuid)');
  late final Index localAppRunRecordAppUuid = Index(
      'local_app_run_record_app_uuid',
      'CREATE INDEX local_app_run_record_app_uuid ON local_app_run_record_table (app_u_u_i_d, inst_u_u_i_d, launcher_u_u_i_d)');
  late final Index localCommonAppScanUuid = Index('local_common_app_scan_uuid',
      'CREATE INDEX local_common_app_scan_uuid ON local_common_app_scan_table (uuid)');
  late final Index localCommonAppScanBasePath = Index(
      'local_common_app_scan_base_path',
      'CREATE INDEX local_common_app_scan_base_path ON local_common_app_scan_table (base_path)');
  late final Index localCommonAppScanResultUuid = Index(
      'local_common_app_scan_result_uuid',
      'CREATE INDEX local_common_app_scan_result_uuid ON local_common_app_scan_result_table (uuid)');
  late final Index localCommonAppScanResultScanUuid = Index(
      'local_common_app_scan_result_scan_uuid',
      'CREATE INDEX local_common_app_scan_result_scan_uuid ON local_common_app_scan_result_table (scan_u_u_i_d)');
  late final Index localSteamAppScanUuid = Index('local_steam_app_scan_uuid',
      'CREATE INDEX local_steam_app_scan_uuid ON local_steam_app_scan_table (uuid)');
  late final Index localSteamAppScanResultScanUuid = Index(
      'local_steam_app_scan_result_scan_uuid',
      'CREATE INDEX local_steam_app_scan_result_scan_uuid ON local_steam_app_scan_result_table (scan_u_u_i_d)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        kVTable,
        serverConfigTable,
        feedConfigTable,
        localAppTable,
        localAppInstTable,
        localAppInstLauncherTable,
        localAppRunRecordTable,
        localCommonAppScanTable,
        localCommonAppScanResultTable,
        localSteamAppScanTable,
        localSteamAppScanResultTable,
        server,
        localAppUuid,
        localAppInstUuid,
        localAppInstAppUuid,
        localAppInstLauncherUuid,
        localAppInstLauncherAppInstUuid,
        localAppRunRecordUuid,
        localAppRunRecordAppUuid,
        localCommonAppScanUuid,
        localCommonAppScanBasePath,
        localCommonAppScanResultUuid,
        localCommonAppScanResultScanUuid,
        localSteamAppScanUuid,
        localSteamAppScanResultScanUuid
      ];
}

typedef $$KVTableTableCreateCompanionBuilder = KVTableCompanion Function({
  required String bucket,
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$KVTableTableUpdateCompanionBuilder = KVTableCompanion Function({
  Value<String> bucket,
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$KVTableTableFilterComposer
    extends Composer<_$AppDatabase, $KVTableTable> {
  $$KVTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get bucket => $composableBuilder(
      column: $table.bucket, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$KVTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KVTableTable> {
  $$KVTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get bucket => $composableBuilder(
      column: $table.bucket, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$KVTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KVTableTable> {
  $$KVTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get bucket =>
      $composableBuilder(column: $table.bucket, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$KVTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KVTableTable,
    KVTableData,
    $$KVTableTableFilterComposer,
    $$KVTableTableOrderingComposer,
    $$KVTableTableAnnotationComposer,
    $$KVTableTableCreateCompanionBuilder,
    $$KVTableTableUpdateCompanionBuilder,
    (KVTableData, BaseReferences<_$AppDatabase, $KVTableTable, KVTableData>),
    KVTableData,
    PrefetchHooks Function()> {
  $$KVTableTableTableManager(_$AppDatabase db, $KVTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KVTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KVTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KVTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> bucket = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              KVTableCompanion(
            bucket: bucket,
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String bucket,
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              KVTableCompanion.insert(
            bucket: bucket,
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KVTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $KVTableTable,
    KVTableData,
    $$KVTableTableFilterComposer,
    $$KVTableTableOrderingComposer,
    $$KVTableTableAnnotationComposer,
    $$KVTableTableCreateCompanionBuilder,
    $$KVTableTableUpdateCompanionBuilder,
    (KVTableData, BaseReferences<_$AppDatabase, $KVTableTable, KVTableData>),
    KVTableData,
    PrefetchHooks Function()>;
typedef $$ServerConfigTableTableCreateCompanionBuilder
    = ServerConfigTableCompanion Function({
  Value<int> id,
  required String host,
  required int port,
  required bool enableTLS,
  required String username,
  Value<String?> refreshToken,
  Value<int?> deviceId,
});
typedef $$ServerConfigTableTableUpdateCompanionBuilder
    = ServerConfigTableCompanion Function({
  Value<int> id,
  Value<String> host,
  Value<int> port,
  Value<bool> enableTLS,
  Value<String> username,
  Value<String?> refreshToken,
  Value<int?> deviceId,
});

class $$ServerConfigTableTableFilterComposer
    extends Composer<_$AppDatabase, $ServerConfigTableTable> {
  $$ServerConfigTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get host => $composableBuilder(
      column: $table.host, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get port => $composableBuilder(
      column: $table.port, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enableTLS => $composableBuilder(
      column: $table.enableTLS, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));
}

class $$ServerConfigTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ServerConfigTableTable> {
  $$ServerConfigTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get host => $composableBuilder(
      column: $table.host, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get port => $composableBuilder(
      column: $table.port, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enableTLS => $composableBuilder(
      column: $table.enableTLS, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));
}

class $$ServerConfigTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServerConfigTableTable> {
  $$ServerConfigTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get host =>
      $composableBuilder(column: $table.host, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<bool> get enableTLS =>
      $composableBuilder(column: $table.enableTLS, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => column);

  GeneratedColumn<int> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);
}

class $$ServerConfigTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ServerConfigTableTable,
    ServerConfig,
    $$ServerConfigTableTableFilterComposer,
    $$ServerConfigTableTableOrderingComposer,
    $$ServerConfigTableTableAnnotationComposer,
    $$ServerConfigTableTableCreateCompanionBuilder,
    $$ServerConfigTableTableUpdateCompanionBuilder,
    (
      ServerConfig,
      BaseReferences<_$AppDatabase, $ServerConfigTableTable, ServerConfig>
    ),
    ServerConfig,
    PrefetchHooks Function()> {
  $$ServerConfigTableTableTableManager(
      _$AppDatabase db, $ServerConfigTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServerConfigTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServerConfigTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServerConfigTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> host = const Value.absent(),
            Value<int> port = const Value.absent(),
            Value<bool> enableTLS = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String?> refreshToken = const Value.absent(),
            Value<int?> deviceId = const Value.absent(),
          }) =>
              ServerConfigTableCompanion(
            id: id,
            host: host,
            port: port,
            enableTLS: enableTLS,
            username: username,
            refreshToken: refreshToken,
            deviceId: deviceId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String host,
            required int port,
            required bool enableTLS,
            required String username,
            Value<String?> refreshToken = const Value.absent(),
            Value<int?> deviceId = const Value.absent(),
          }) =>
              ServerConfigTableCompanion.insert(
            id: id,
            host: host,
            port: port,
            enableTLS: enableTLS,
            username: username,
            refreshToken: refreshToken,
            deviceId: deviceId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ServerConfigTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ServerConfigTableTable,
    ServerConfig,
    $$ServerConfigTableTableFilterComposer,
    $$ServerConfigTableTableOrderingComposer,
    $$ServerConfigTableTableAnnotationComposer,
    $$ServerConfigTableTableCreateCompanionBuilder,
    $$ServerConfigTableTableUpdateCompanionBuilder,
    (
      ServerConfig,
      BaseReferences<_$AppDatabase, $ServerConfigTableTable, ServerConfig>
    ),
    ServerConfig,
    PrefetchHooks Function()>;
typedef $$FeedConfigTableTableCreateCompanionBuilder = FeedConfigTableCompanion
    Function({
  required String internalId,
  required String name,
  required String category,
  required String jsonData,
  Value<int> rowid,
});
typedef $$FeedConfigTableTableUpdateCompanionBuilder = FeedConfigTableCompanion
    Function({
  Value<String> internalId,
  Value<String> name,
  Value<String> category,
  Value<String> jsonData,
  Value<int> rowid,
});

class $$FeedConfigTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeedConfigTableTable> {
  $$FeedConfigTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get internalId => $composableBuilder(
      column: $table.internalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jsonData => $composableBuilder(
      column: $table.jsonData, builder: (column) => ColumnFilters(column));
}

class $$FeedConfigTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedConfigTableTable> {
  $$FeedConfigTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get internalId => $composableBuilder(
      column: $table.internalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jsonData => $composableBuilder(
      column: $table.jsonData, builder: (column) => ColumnOrderings(column));
}

class $$FeedConfigTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedConfigTableTable> {
  $$FeedConfigTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get internalId => $composableBuilder(
      column: $table.internalId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get jsonData =>
      $composableBuilder(column: $table.jsonData, builder: (column) => column);
}

class $$FeedConfigTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedConfigTableTable,
    FeedConfigTableData,
    $$FeedConfigTableTableFilterComposer,
    $$FeedConfigTableTableOrderingComposer,
    $$FeedConfigTableTableAnnotationComposer,
    $$FeedConfigTableTableCreateCompanionBuilder,
    $$FeedConfigTableTableUpdateCompanionBuilder,
    (
      FeedConfigTableData,
      BaseReferences<_$AppDatabase, $FeedConfigTableTable, FeedConfigTableData>
    ),
    FeedConfigTableData,
    PrefetchHooks Function()> {
  $$FeedConfigTableTableTableManager(
      _$AppDatabase db, $FeedConfigTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedConfigTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedConfigTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedConfigTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> internalId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> jsonData = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeedConfigTableCompanion(
            internalId: internalId,
            name: name,
            category: category,
            jsonData: jsonData,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String internalId,
            required String name,
            required String category,
            required String jsonData,
            Value<int> rowid = const Value.absent(),
          }) =>
              FeedConfigTableCompanion.insert(
            internalId: internalId,
            name: name,
            category: category,
            jsonData: jsonData,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeedConfigTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeedConfigTableTable,
    FeedConfigTableData,
    $$FeedConfigTableTableFilterComposer,
    $$FeedConfigTableTableOrderingComposer,
    $$FeedConfigTableTableAnnotationComposer,
    $$FeedConfigTableTableCreateCompanionBuilder,
    $$FeedConfigTableTableUpdateCompanionBuilder,
    (
      FeedConfigTableData,
      BaseReferences<_$AppDatabase, $FeedConfigTableTable, FeedConfigTableData>
    ),
    FeedConfigTableData,
    PrefetchHooks Function()>;
typedef $$LocalAppTableTableCreateCompanionBuilder = LocalAppTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<String?> lastLaunchedInstUUID,
  Value<String?> shortDescription,
  Value<String?> iconImageUrl,
  Value<String?> iconImagePath,
  Value<String?> backgroundImageUrl,
  Value<String?> backgroundImagePath,
  Value<String?> coverImageUrl,
  Value<String?> coverImagePath,
  Value<String?> description,
  Value<String?> releaseDate,
  Value<String?> developer,
  Value<String?> publisher,
});
typedef $$LocalAppTableTableUpdateCompanionBuilder = LocalAppTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String?> lastLaunchedInstUUID,
  Value<String?> shortDescription,
  Value<String?> iconImageUrl,
  Value<String?> iconImagePath,
  Value<String?> backgroundImageUrl,
  Value<String?> backgroundImagePath,
  Value<String?> coverImageUrl,
  Value<String?> coverImagePath,
  Value<String?> description,
  Value<String?> releaseDate,
  Value<String?> developer,
  Value<String?> publisher,
});

class $$LocalAppTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalAppTableTable> {
  $$LocalAppTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastLaunchedInstUUID => $composableBuilder(
      column: $table.lastLaunchedInstUUID,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconImageUrl => $composableBuilder(
      column: $table.iconImageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconImagePath => $composableBuilder(
      column: $table.iconImagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backgroundImageUrl => $composableBuilder(
      column: $table.backgroundImageUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backgroundImagePath => $composableBuilder(
      column: $table.backgroundImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverImageUrl => $composableBuilder(
      column: $table.coverImageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverImagePath => $composableBuilder(
      column: $table.coverImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get developer => $composableBuilder(
      column: $table.developer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publisher => $composableBuilder(
      column: $table.publisher, builder: (column) => ColumnFilters(column));
}

class $$LocalAppTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalAppTableTable> {
  $$LocalAppTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastLaunchedInstUUID => $composableBuilder(
      column: $table.lastLaunchedInstUUID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconImageUrl => $composableBuilder(
      column: $table.iconImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconImagePath => $composableBuilder(
      column: $table.iconImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backgroundImageUrl => $composableBuilder(
      column: $table.backgroundImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backgroundImagePath => $composableBuilder(
      column: $table.backgroundImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageUrl => $composableBuilder(
      column: $table.coverImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImagePath => $composableBuilder(
      column: $table.coverImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get developer => $composableBuilder(
      column: $table.developer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publisher => $composableBuilder(
      column: $table.publisher, builder: (column) => ColumnOrderings(column));
}

class $$LocalAppTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalAppTableTable> {
  $$LocalAppTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lastLaunchedInstUUID => $composableBuilder(
      column: $table.lastLaunchedInstUUID, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription, builder: (column) => column);

  GeneratedColumn<String> get iconImageUrl => $composableBuilder(
      column: $table.iconImageUrl, builder: (column) => column);

  GeneratedColumn<String> get iconImagePath => $composableBuilder(
      column: $table.iconImagePath, builder: (column) => column);

  GeneratedColumn<String> get backgroundImageUrl => $composableBuilder(
      column: $table.backgroundImageUrl, builder: (column) => column);

  GeneratedColumn<String> get backgroundImagePath => $composableBuilder(
      column: $table.backgroundImagePath, builder: (column) => column);

  GeneratedColumn<String> get coverImageUrl => $composableBuilder(
      column: $table.coverImageUrl, builder: (column) => column);

  GeneratedColumn<String> get coverImagePath => $composableBuilder(
      column: $table.coverImagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<String> get developer =>
      $composableBuilder(column: $table.developer, builder: (column) => column);

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);
}

class $$LocalAppTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalAppTableTable,
    LocalApp,
    $$LocalAppTableTableFilterComposer,
    $$LocalAppTableTableOrderingComposer,
    $$LocalAppTableTableAnnotationComposer,
    $$LocalAppTableTableCreateCompanionBuilder,
    $$LocalAppTableTableUpdateCompanionBuilder,
    (LocalApp, BaseReferences<_$AppDatabase, $LocalAppTableTable, LocalApp>),
    LocalApp,
    PrefetchHooks Function()> {
  $$LocalAppTableTableTableManager(_$AppDatabase db, $LocalAppTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalAppTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalAppTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalAppTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> lastLaunchedInstUUID = const Value.absent(),
            Value<String?> shortDescription = const Value.absent(),
            Value<String?> iconImageUrl = const Value.absent(),
            Value<String?> iconImagePath = const Value.absent(),
            Value<String?> backgroundImageUrl = const Value.absent(),
            Value<String?> backgroundImagePath = const Value.absent(),
            Value<String?> coverImageUrl = const Value.absent(),
            Value<String?> coverImagePath = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<String?> developer = const Value.absent(),
            Value<String?> publisher = const Value.absent(),
          }) =>
              LocalAppTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            lastLaunchedInstUUID: lastLaunchedInstUUID,
            shortDescription: shortDescription,
            iconImageUrl: iconImageUrl,
            iconImagePath: iconImagePath,
            backgroundImageUrl: backgroundImageUrl,
            backgroundImagePath: backgroundImagePath,
            coverImageUrl: coverImageUrl,
            coverImagePath: coverImagePath,
            description: description,
            releaseDate: releaseDate,
            developer: developer,
            publisher: publisher,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<String?> lastLaunchedInstUUID = const Value.absent(),
            Value<String?> shortDescription = const Value.absent(),
            Value<String?> iconImageUrl = const Value.absent(),
            Value<String?> iconImagePath = const Value.absent(),
            Value<String?> backgroundImageUrl = const Value.absent(),
            Value<String?> backgroundImagePath = const Value.absent(),
            Value<String?> coverImageUrl = const Value.absent(),
            Value<String?> coverImagePath = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<String?> developer = const Value.absent(),
            Value<String?> publisher = const Value.absent(),
          }) =>
              LocalAppTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            lastLaunchedInstUUID: lastLaunchedInstUUID,
            shortDescription: shortDescription,
            iconImageUrl: iconImageUrl,
            iconImagePath: iconImagePath,
            backgroundImageUrl: backgroundImageUrl,
            backgroundImagePath: backgroundImagePath,
            coverImageUrl: coverImageUrl,
            coverImagePath: coverImagePath,
            description: description,
            releaseDate: releaseDate,
            developer: developer,
            publisher: publisher,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalAppTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalAppTableTable,
    LocalApp,
    $$LocalAppTableTableFilterComposer,
    $$LocalAppTableTableOrderingComposer,
    $$LocalAppTableTableAnnotationComposer,
    $$LocalAppTableTableCreateCompanionBuilder,
    $$LocalAppTableTableUpdateCompanionBuilder,
    (LocalApp, BaseReferences<_$AppDatabase, $LocalAppTableTable, LocalApp>),
    LocalApp,
    PrefetchHooks Function()>;
typedef $$LocalAppInstTableTableCreateCompanionBuilder
    = LocalAppInstTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String appUUID,
  Value<String?> name,
  required String path,
  required String version,
  Value<String?> lastLaunchedLauncherUUID,
});
typedef $$LocalAppInstTableTableUpdateCompanionBuilder
    = LocalAppInstTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> appUUID,
  Value<String?> name,
  Value<String> path,
  Value<String> version,
  Value<String?> lastLaunchedLauncherUUID,
});

class $$LocalAppInstTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalAppInstTableTable> {
  $$LocalAppInstTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appUUID => $composableBuilder(
      column: $table.appUUID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastLaunchedLauncherUUID => $composableBuilder(
      column: $table.lastLaunchedLauncherUUID,
      builder: (column) => ColumnFilters(column));
}

class $$LocalAppInstTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalAppInstTableTable> {
  $$LocalAppInstTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appUUID => $composableBuilder(
      column: $table.appUUID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastLaunchedLauncherUUID => $composableBuilder(
      column: $table.lastLaunchedLauncherUUID,
      builder: (column) => ColumnOrderings(column));
}

class $$LocalAppInstTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalAppInstTableTable> {
  $$LocalAppInstTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get appUUID =>
      $composableBuilder(column: $table.appUUID, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get lastLaunchedLauncherUUID => $composableBuilder(
      column: $table.lastLaunchedLauncherUUID, builder: (column) => column);
}

class $$LocalAppInstTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalAppInstTableTable,
    LocalAppInst,
    $$LocalAppInstTableTableFilterComposer,
    $$LocalAppInstTableTableOrderingComposer,
    $$LocalAppInstTableTableAnnotationComposer,
    $$LocalAppInstTableTableCreateCompanionBuilder,
    $$LocalAppInstTableTableUpdateCompanionBuilder,
    (
      LocalAppInst,
      BaseReferences<_$AppDatabase, $LocalAppInstTableTable, LocalAppInst>
    ),
    LocalAppInst,
    PrefetchHooks Function()> {
  $$LocalAppInstTableTableTableManager(
      _$AppDatabase db, $LocalAppInstTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalAppInstTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalAppInstTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalAppInstTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> appUUID = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String> version = const Value.absent(),
            Value<String?> lastLaunchedLauncherUUID = const Value.absent(),
          }) =>
              LocalAppInstTableCompanion(
            id: id,
            uuid: uuid,
            appUUID: appUUID,
            name: name,
            path: path,
            version: version,
            lastLaunchedLauncherUUID: lastLaunchedLauncherUUID,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String appUUID,
            Value<String?> name = const Value.absent(),
            required String path,
            required String version,
            Value<String?> lastLaunchedLauncherUUID = const Value.absent(),
          }) =>
              LocalAppInstTableCompanion.insert(
            id: id,
            uuid: uuid,
            appUUID: appUUID,
            name: name,
            path: path,
            version: version,
            lastLaunchedLauncherUUID: lastLaunchedLauncherUUID,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalAppInstTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalAppInstTableTable,
    LocalAppInst,
    $$LocalAppInstTableTableFilterComposer,
    $$LocalAppInstTableTableOrderingComposer,
    $$LocalAppInstTableTableAnnotationComposer,
    $$LocalAppInstTableTableCreateCompanionBuilder,
    $$LocalAppInstTableTableUpdateCompanionBuilder,
    (
      LocalAppInst,
      BaseReferences<_$AppDatabase, $LocalAppInstTableTable, LocalAppInst>
    ),
    LocalAppInst,
    PrefetchHooks Function()>;
typedef $$LocalAppInstLauncherTableTableCreateCompanionBuilder
    = LocalAppInstLauncherTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String appInstUUID,
  required LocalAppInstLauncherType launcherType,
  Value<bool?> favorite,
  Value<LocalAppInstLaunchCommon?> common,
  Value<LocalAppInstLaunchSteam?> steam,
});
typedef $$LocalAppInstLauncherTableTableUpdateCompanionBuilder
    = LocalAppInstLauncherTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> appInstUUID,
  Value<LocalAppInstLauncherType> launcherType,
  Value<bool?> favorite,
  Value<LocalAppInstLaunchCommon?> common,
  Value<LocalAppInstLaunchSteam?> steam,
});

class $$LocalAppInstLauncherTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalAppInstLauncherTableTable> {
  $$LocalAppInstLauncherTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appInstUUID => $composableBuilder(
      column: $table.appInstUUID, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LocalAppInstLauncherType,
          LocalAppInstLauncherType, int>
      get launcherType => $composableBuilder(
          column: $table.launcherType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get favorite => $composableBuilder(
      column: $table.favorite, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LocalAppInstLaunchCommon?,
          LocalAppInstLaunchCommon, String>
      get common => $composableBuilder(
          column: $table.common,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<LocalAppInstLaunchSteam?,
          LocalAppInstLaunchSteam, String>
      get steam => $composableBuilder(
          column: $table.steam,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$LocalAppInstLauncherTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalAppInstLauncherTableTable> {
  $$LocalAppInstLauncherTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appInstUUID => $composableBuilder(
      column: $table.appInstUUID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get launcherType => $composableBuilder(
      column: $table.launcherType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get favorite => $composableBuilder(
      column: $table.favorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get common => $composableBuilder(
      column: $table.common, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get steam => $composableBuilder(
      column: $table.steam, builder: (column) => ColumnOrderings(column));
}

class $$LocalAppInstLauncherTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalAppInstLauncherTableTable> {
  $$LocalAppInstLauncherTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get appInstUUID => $composableBuilder(
      column: $table.appInstUUID, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalAppInstLauncherType, int>
      get launcherType => $composableBuilder(
          column: $table.launcherType, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalAppInstLaunchCommon?, String>
      get common => $composableBuilder(
          column: $table.common, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalAppInstLaunchSteam?, String>
      get steam =>
          $composableBuilder(column: $table.steam, builder: (column) => column);
}

class $$LocalAppInstLauncherTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalAppInstLauncherTableTable,
    LocalAppInstLauncher,
    $$LocalAppInstLauncherTableTableFilterComposer,
    $$LocalAppInstLauncherTableTableOrderingComposer,
    $$LocalAppInstLauncherTableTableAnnotationComposer,
    $$LocalAppInstLauncherTableTableCreateCompanionBuilder,
    $$LocalAppInstLauncherTableTableUpdateCompanionBuilder,
    (
      LocalAppInstLauncher,
      BaseReferences<_$AppDatabase, $LocalAppInstLauncherTableTable,
          LocalAppInstLauncher>
    ),
    LocalAppInstLauncher,
    PrefetchHooks Function()> {
  $$LocalAppInstLauncherTableTableTableManager(
      _$AppDatabase db, $LocalAppInstLauncherTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalAppInstLauncherTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalAppInstLauncherTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalAppInstLauncherTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> appInstUUID = const Value.absent(),
            Value<LocalAppInstLauncherType> launcherType = const Value.absent(),
            Value<bool?> favorite = const Value.absent(),
            Value<LocalAppInstLaunchCommon?> common = const Value.absent(),
            Value<LocalAppInstLaunchSteam?> steam = const Value.absent(),
          }) =>
              LocalAppInstLauncherTableCompanion(
            id: id,
            uuid: uuid,
            appInstUUID: appInstUUID,
            launcherType: launcherType,
            favorite: favorite,
            common: common,
            steam: steam,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String appInstUUID,
            required LocalAppInstLauncherType launcherType,
            Value<bool?> favorite = const Value.absent(),
            Value<LocalAppInstLaunchCommon?> common = const Value.absent(),
            Value<LocalAppInstLaunchSteam?> steam = const Value.absent(),
          }) =>
              LocalAppInstLauncherTableCompanion.insert(
            id: id,
            uuid: uuid,
            appInstUUID: appInstUUID,
            launcherType: launcherType,
            favorite: favorite,
            common: common,
            steam: steam,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalAppInstLauncherTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalAppInstLauncherTableTable,
        LocalAppInstLauncher,
        $$LocalAppInstLauncherTableTableFilterComposer,
        $$LocalAppInstLauncherTableTableOrderingComposer,
        $$LocalAppInstLauncherTableTableAnnotationComposer,
        $$LocalAppInstLauncherTableTableCreateCompanionBuilder,
        $$LocalAppInstLauncherTableTableUpdateCompanionBuilder,
        (
          LocalAppInstLauncher,
          BaseReferences<_$AppDatabase, $LocalAppInstLauncherTableTable,
              LocalAppInstLauncher>
        ),
        LocalAppInstLauncher,
        PrefetchHooks Function()>;
typedef $$LocalAppRunRecordTableTableCreateCompanionBuilder
    = LocalAppRunRecordTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String appUUID,
  required String instUUID,
  required String launcherUUID,
  required DateTime startTime,
  Value<DateTime?> endTime,
});
typedef $$LocalAppRunRecordTableTableUpdateCompanionBuilder
    = LocalAppRunRecordTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> appUUID,
  Value<String> instUUID,
  Value<String> launcherUUID,
  Value<DateTime> startTime,
  Value<DateTime?> endTime,
});

class $$LocalAppRunRecordTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalAppRunRecordTableTable> {
  $$LocalAppRunRecordTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appUUID => $composableBuilder(
      column: $table.appUUID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instUUID => $composableBuilder(
      column: $table.instUUID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get launcherUUID => $composableBuilder(
      column: $table.launcherUUID, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));
}

class $$LocalAppRunRecordTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalAppRunRecordTableTable> {
  $$LocalAppRunRecordTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appUUID => $composableBuilder(
      column: $table.appUUID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instUUID => $composableBuilder(
      column: $table.instUUID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get launcherUUID => $composableBuilder(
      column: $table.launcherUUID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));
}

class $$LocalAppRunRecordTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalAppRunRecordTableTable> {
  $$LocalAppRunRecordTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get appUUID =>
      $composableBuilder(column: $table.appUUID, builder: (column) => column);

  GeneratedColumn<String> get instUUID =>
      $composableBuilder(column: $table.instUUID, builder: (column) => column);

  GeneratedColumn<String> get launcherUUID => $composableBuilder(
      column: $table.launcherUUID, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);
}

class $$LocalAppRunRecordTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalAppRunRecordTableTable,
    LocalAppRunRecord,
    $$LocalAppRunRecordTableTableFilterComposer,
    $$LocalAppRunRecordTableTableOrderingComposer,
    $$LocalAppRunRecordTableTableAnnotationComposer,
    $$LocalAppRunRecordTableTableCreateCompanionBuilder,
    $$LocalAppRunRecordTableTableUpdateCompanionBuilder,
    (
      LocalAppRunRecord,
      BaseReferences<_$AppDatabase, $LocalAppRunRecordTableTable,
          LocalAppRunRecord>
    ),
    LocalAppRunRecord,
    PrefetchHooks Function()> {
  $$LocalAppRunRecordTableTableTableManager(
      _$AppDatabase db, $LocalAppRunRecordTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalAppRunRecordTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalAppRunRecordTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalAppRunRecordTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> appUUID = const Value.absent(),
            Value<String> instUUID = const Value.absent(),
            Value<String> launcherUUID = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
          }) =>
              LocalAppRunRecordTableCompanion(
            id: id,
            uuid: uuid,
            appUUID: appUUID,
            instUUID: instUUID,
            launcherUUID: launcherUUID,
            startTime: startTime,
            endTime: endTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String appUUID,
            required String instUUID,
            required String launcherUUID,
            required DateTime startTime,
            Value<DateTime?> endTime = const Value.absent(),
          }) =>
              LocalAppRunRecordTableCompanion.insert(
            id: id,
            uuid: uuid,
            appUUID: appUUID,
            instUUID: instUUID,
            launcherUUID: launcherUUID,
            startTime: startTime,
            endTime: endTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalAppRunRecordTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalAppRunRecordTableTable,
        LocalAppRunRecord,
        $$LocalAppRunRecordTableTableFilterComposer,
        $$LocalAppRunRecordTableTableOrderingComposer,
        $$LocalAppRunRecordTableTableAnnotationComposer,
        $$LocalAppRunRecordTableTableCreateCompanionBuilder,
        $$LocalAppRunRecordTableTableUpdateCompanionBuilder,
        (
          LocalAppRunRecord,
          BaseReferences<_$AppDatabase, $LocalAppRunRecordTableTable,
              LocalAppRunRecord>
        ),
        LocalAppRunRecord,
        PrefetchHooks Function()>;
typedef $$LocalCommonAppScanTableTableCreateCompanionBuilder
    = LocalCommonAppScanTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String basePath,
  required bool enableAutoScan,
  required List<String> excludeDirectoryMatchers,
  required int minInstallDirDepth,
  required int maxInstallDirDepth,
  required List<LocalCommonAppScanPathFieldMatcher> pathFieldMatcher,
  required LocalCommonAppScanPathFieldMatcherAlignment
      pathFieldMatcherAlignment,
  required List<String> includeExecutableMatchers,
  required List<String> excludeExecutableMatchers,
  required int minExecutableDepth,
  required int maxExecutableDepth,
});
typedef $$LocalCommonAppScanTableTableUpdateCompanionBuilder
    = LocalCommonAppScanTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> basePath,
  Value<bool> enableAutoScan,
  Value<List<String>> excludeDirectoryMatchers,
  Value<int> minInstallDirDepth,
  Value<int> maxInstallDirDepth,
  Value<List<LocalCommonAppScanPathFieldMatcher>> pathFieldMatcher,
  Value<LocalCommonAppScanPathFieldMatcherAlignment> pathFieldMatcherAlignment,
  Value<List<String>> includeExecutableMatchers,
  Value<List<String>> excludeExecutableMatchers,
  Value<int> minExecutableDepth,
  Value<int> maxExecutableDepth,
});

class $$LocalCommonAppScanTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalCommonAppScanTableTable> {
  $$LocalCommonAppScanTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get basePath => $composableBuilder(
      column: $table.basePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enableAutoScan => $composableBuilder(
      column: $table.enableAutoScan,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get excludeDirectoryMatchers => $composableBuilder(
          column: $table.excludeDirectoryMatchers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get minInstallDirDepth => $composableBuilder(
      column: $table.minInstallDirDepth,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxInstallDirDepth => $composableBuilder(
      column: $table.maxInstallDirDepth,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<LocalCommonAppScanPathFieldMatcher>,
          List<LocalCommonAppScanPathFieldMatcher>, String>
      get pathFieldMatcher => $composableBuilder(
          column: $table.pathFieldMatcher,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<LocalCommonAppScanPathFieldMatcherAlignment,
          LocalCommonAppScanPathFieldMatcherAlignment, String>
      get pathFieldMatcherAlignment => $composableBuilder(
          column: $table.pathFieldMatcherAlignment,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get includeExecutableMatchers => $composableBuilder(
          column: $table.includeExecutableMatchers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get excludeExecutableMatchers => $composableBuilder(
          column: $table.excludeExecutableMatchers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get minExecutableDepth => $composableBuilder(
      column: $table.minExecutableDepth,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxExecutableDepth => $composableBuilder(
      column: $table.maxExecutableDepth,
      builder: (column) => ColumnFilters(column));
}

class $$LocalCommonAppScanTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalCommonAppScanTableTable> {
  $$LocalCommonAppScanTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get basePath => $composableBuilder(
      column: $table.basePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enableAutoScan => $composableBuilder(
      column: $table.enableAutoScan,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get excludeDirectoryMatchers => $composableBuilder(
      column: $table.excludeDirectoryMatchers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minInstallDirDepth => $composableBuilder(
      column: $table.minInstallDirDepth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxInstallDirDepth => $composableBuilder(
      column: $table.maxInstallDirDepth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pathFieldMatcher => $composableBuilder(
      column: $table.pathFieldMatcher,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pathFieldMatcherAlignment => $composableBuilder(
      column: $table.pathFieldMatcherAlignment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get includeExecutableMatchers => $composableBuilder(
      column: $table.includeExecutableMatchers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get excludeExecutableMatchers => $composableBuilder(
      column: $table.excludeExecutableMatchers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minExecutableDepth => $composableBuilder(
      column: $table.minExecutableDepth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxExecutableDepth => $composableBuilder(
      column: $table.maxExecutableDepth,
      builder: (column) => ColumnOrderings(column));
}

class $$LocalCommonAppScanTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalCommonAppScanTableTable> {
  $$LocalCommonAppScanTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get basePath =>
      $composableBuilder(column: $table.basePath, builder: (column) => column);

  GeneratedColumn<bool> get enableAutoScan => $composableBuilder(
      column: $table.enableAutoScan, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get excludeDirectoryMatchers => $composableBuilder(
          column: $table.excludeDirectoryMatchers, builder: (column) => column);

  GeneratedColumn<int> get minInstallDirDepth => $composableBuilder(
      column: $table.minInstallDirDepth, builder: (column) => column);

  GeneratedColumn<int> get maxInstallDirDepth => $composableBuilder(
      column: $table.maxInstallDirDepth, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<LocalCommonAppScanPathFieldMatcher>,
          String>
      get pathFieldMatcher => $composableBuilder(
          column: $table.pathFieldMatcher, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalCommonAppScanPathFieldMatcherAlignment,
          String>
      get pathFieldMatcherAlignment => $composableBuilder(
          column: $table.pathFieldMatcherAlignment,
          builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get includeExecutableMatchers => $composableBuilder(
          column: $table.includeExecutableMatchers,
          builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get excludeExecutableMatchers => $composableBuilder(
          column: $table.excludeExecutableMatchers,
          builder: (column) => column);

  GeneratedColumn<int> get minExecutableDepth => $composableBuilder(
      column: $table.minExecutableDepth, builder: (column) => column);

  GeneratedColumn<int> get maxExecutableDepth => $composableBuilder(
      column: $table.maxExecutableDepth, builder: (column) => column);
}

class $$LocalCommonAppScanTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalCommonAppScanTableTable,
    LocalCommonAppScan,
    $$LocalCommonAppScanTableTableFilterComposer,
    $$LocalCommonAppScanTableTableOrderingComposer,
    $$LocalCommonAppScanTableTableAnnotationComposer,
    $$LocalCommonAppScanTableTableCreateCompanionBuilder,
    $$LocalCommonAppScanTableTableUpdateCompanionBuilder,
    (
      LocalCommonAppScan,
      BaseReferences<_$AppDatabase, $LocalCommonAppScanTableTable,
          LocalCommonAppScan>
    ),
    LocalCommonAppScan,
    PrefetchHooks Function()> {
  $$LocalCommonAppScanTableTableTableManager(
      _$AppDatabase db, $LocalCommonAppScanTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalCommonAppScanTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalCommonAppScanTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalCommonAppScanTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> basePath = const Value.absent(),
            Value<bool> enableAutoScan = const Value.absent(),
            Value<List<String>> excludeDirectoryMatchers = const Value.absent(),
            Value<int> minInstallDirDepth = const Value.absent(),
            Value<int> maxInstallDirDepth = const Value.absent(),
            Value<List<LocalCommonAppScanPathFieldMatcher>> pathFieldMatcher =
                const Value.absent(),
            Value<LocalCommonAppScanPathFieldMatcherAlignment>
                pathFieldMatcherAlignment = const Value.absent(),
            Value<List<String>> includeExecutableMatchers =
                const Value.absent(),
            Value<List<String>> excludeExecutableMatchers =
                const Value.absent(),
            Value<int> minExecutableDepth = const Value.absent(),
            Value<int> maxExecutableDepth = const Value.absent(),
          }) =>
              LocalCommonAppScanTableCompanion(
            id: id,
            uuid: uuid,
            basePath: basePath,
            enableAutoScan: enableAutoScan,
            excludeDirectoryMatchers: excludeDirectoryMatchers,
            minInstallDirDepth: minInstallDirDepth,
            maxInstallDirDepth: maxInstallDirDepth,
            pathFieldMatcher: pathFieldMatcher,
            pathFieldMatcherAlignment: pathFieldMatcherAlignment,
            includeExecutableMatchers: includeExecutableMatchers,
            excludeExecutableMatchers: excludeExecutableMatchers,
            minExecutableDepth: minExecutableDepth,
            maxExecutableDepth: maxExecutableDepth,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String basePath,
            required bool enableAutoScan,
            required List<String> excludeDirectoryMatchers,
            required int minInstallDirDepth,
            required int maxInstallDirDepth,
            required List<LocalCommonAppScanPathFieldMatcher> pathFieldMatcher,
            required LocalCommonAppScanPathFieldMatcherAlignment
                pathFieldMatcherAlignment,
            required List<String> includeExecutableMatchers,
            required List<String> excludeExecutableMatchers,
            required int minExecutableDepth,
            required int maxExecutableDepth,
          }) =>
              LocalCommonAppScanTableCompanion.insert(
            id: id,
            uuid: uuid,
            basePath: basePath,
            enableAutoScan: enableAutoScan,
            excludeDirectoryMatchers: excludeDirectoryMatchers,
            minInstallDirDepth: minInstallDirDepth,
            maxInstallDirDepth: maxInstallDirDepth,
            pathFieldMatcher: pathFieldMatcher,
            pathFieldMatcherAlignment: pathFieldMatcherAlignment,
            includeExecutableMatchers: includeExecutableMatchers,
            excludeExecutableMatchers: excludeExecutableMatchers,
            minExecutableDepth: minExecutableDepth,
            maxExecutableDepth: maxExecutableDepth,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalCommonAppScanTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalCommonAppScanTableTable,
        LocalCommonAppScan,
        $$LocalCommonAppScanTableTableFilterComposer,
        $$LocalCommonAppScanTableTableOrderingComposer,
        $$LocalCommonAppScanTableTableAnnotationComposer,
        $$LocalCommonAppScanTableTableCreateCompanionBuilder,
        $$LocalCommonAppScanTableTableUpdateCompanionBuilder,
        (
          LocalCommonAppScan,
          BaseReferences<_$AppDatabase, $LocalCommonAppScanTableTable,
              LocalCommonAppScan>
        ),
        LocalCommonAppScan,
        PrefetchHooks Function()>;
typedef $$LocalCommonAppScanResultTableTableCreateCompanionBuilder
    = LocalCommonAppScanResultTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String scanUUID,
  Value<String?> name,
  Value<String?> version,
  required String installPath,
  required List<String> launcherPaths,
});
typedef $$LocalCommonAppScanResultTableTableUpdateCompanionBuilder
    = LocalCommonAppScanResultTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> scanUUID,
  Value<String?> name,
  Value<String?> version,
  Value<String> installPath,
  Value<List<String>> launcherPaths,
});

class $$LocalCommonAppScanResultTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalCommonAppScanResultTableTable> {
  $$LocalCommonAppScanResultTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scanUUID => $composableBuilder(
      column: $table.scanUUID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get installPath => $composableBuilder(
      column: $table.installPath, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get launcherPaths => $composableBuilder(
          column: $table.launcherPaths,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$LocalCommonAppScanResultTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalCommonAppScanResultTableTable> {
  $$LocalCommonAppScanResultTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scanUUID => $composableBuilder(
      column: $table.scanUUID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get installPath => $composableBuilder(
      column: $table.installPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get launcherPaths => $composableBuilder(
      column: $table.launcherPaths,
      builder: (column) => ColumnOrderings(column));
}

class $$LocalCommonAppScanResultTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalCommonAppScanResultTableTable> {
  $$LocalCommonAppScanResultTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get scanUUID =>
      $composableBuilder(column: $table.scanUUID, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get installPath => $composableBuilder(
      column: $table.installPath, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get launcherPaths =>
      $composableBuilder(
          column: $table.launcherPaths, builder: (column) => column);
}

class $$LocalCommonAppScanResultTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalCommonAppScanResultTableTable,
    LocalCommonAppScanResult,
    $$LocalCommonAppScanResultTableTableFilterComposer,
    $$LocalCommonAppScanResultTableTableOrderingComposer,
    $$LocalCommonAppScanResultTableTableAnnotationComposer,
    $$LocalCommonAppScanResultTableTableCreateCompanionBuilder,
    $$LocalCommonAppScanResultTableTableUpdateCompanionBuilder,
    (
      LocalCommonAppScanResult,
      BaseReferences<_$AppDatabase, $LocalCommonAppScanResultTableTable,
          LocalCommonAppScanResult>
    ),
    LocalCommonAppScanResult,
    PrefetchHooks Function()> {
  $$LocalCommonAppScanResultTableTableTableManager(
      _$AppDatabase db, $LocalCommonAppScanResultTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalCommonAppScanResultTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalCommonAppScanResultTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalCommonAppScanResultTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> scanUUID = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> version = const Value.absent(),
            Value<String> installPath = const Value.absent(),
            Value<List<String>> launcherPaths = const Value.absent(),
          }) =>
              LocalCommonAppScanResultTableCompanion(
            id: id,
            uuid: uuid,
            scanUUID: scanUUID,
            name: name,
            version: version,
            installPath: installPath,
            launcherPaths: launcherPaths,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String scanUUID,
            Value<String?> name = const Value.absent(),
            Value<String?> version = const Value.absent(),
            required String installPath,
            required List<String> launcherPaths,
          }) =>
              LocalCommonAppScanResultTableCompanion.insert(
            id: id,
            uuid: uuid,
            scanUUID: scanUUID,
            name: name,
            version: version,
            installPath: installPath,
            launcherPaths: launcherPaths,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalCommonAppScanResultTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalCommonAppScanResultTableTable,
        LocalCommonAppScanResult,
        $$LocalCommonAppScanResultTableTableFilterComposer,
        $$LocalCommonAppScanResultTableTableOrderingComposer,
        $$LocalCommonAppScanResultTableTableAnnotationComposer,
        $$LocalCommonAppScanResultTableTableCreateCompanionBuilder,
        $$LocalCommonAppScanResultTableTableUpdateCompanionBuilder,
        (
          LocalCommonAppScanResult,
          BaseReferences<_$AppDatabase, $LocalCommonAppScanResultTableTable,
              LocalCommonAppScanResult>
        ),
        LocalCommonAppScanResult,
        PrefetchHooks Function()>;
typedef $$LocalSteamAppScanTableTableCreateCompanionBuilder
    = LocalSteamAppScanTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String libraryPath,
  required bool enableAutoScan,
});
typedef $$LocalSteamAppScanTableTableUpdateCompanionBuilder
    = LocalSteamAppScanTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> libraryPath,
  Value<bool> enableAutoScan,
});

class $$LocalSteamAppScanTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSteamAppScanTableTable> {
  $$LocalSteamAppScanTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get libraryPath => $composableBuilder(
      column: $table.libraryPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enableAutoScan => $composableBuilder(
      column: $table.enableAutoScan,
      builder: (column) => ColumnFilters(column));
}

class $$LocalSteamAppScanTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSteamAppScanTableTable> {
  $$LocalSteamAppScanTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get libraryPath => $composableBuilder(
      column: $table.libraryPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enableAutoScan => $composableBuilder(
      column: $table.enableAutoScan,
      builder: (column) => ColumnOrderings(column));
}

class $$LocalSteamAppScanTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSteamAppScanTableTable> {
  $$LocalSteamAppScanTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get libraryPath => $composableBuilder(
      column: $table.libraryPath, builder: (column) => column);

  GeneratedColumn<bool> get enableAutoScan => $composableBuilder(
      column: $table.enableAutoScan, builder: (column) => column);
}

class $$LocalSteamAppScanTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalSteamAppScanTableTable,
    LocalSteamAppScan,
    $$LocalSteamAppScanTableTableFilterComposer,
    $$LocalSteamAppScanTableTableOrderingComposer,
    $$LocalSteamAppScanTableTableAnnotationComposer,
    $$LocalSteamAppScanTableTableCreateCompanionBuilder,
    $$LocalSteamAppScanTableTableUpdateCompanionBuilder,
    (
      LocalSteamAppScan,
      BaseReferences<_$AppDatabase, $LocalSteamAppScanTableTable,
          LocalSteamAppScan>
    ),
    LocalSteamAppScan,
    PrefetchHooks Function()> {
  $$LocalSteamAppScanTableTableTableManager(
      _$AppDatabase db, $LocalSteamAppScanTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSteamAppScanTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalSteamAppScanTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalSteamAppScanTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> libraryPath = const Value.absent(),
            Value<bool> enableAutoScan = const Value.absent(),
          }) =>
              LocalSteamAppScanTableCompanion(
            id: id,
            uuid: uuid,
            libraryPath: libraryPath,
            enableAutoScan: enableAutoScan,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String libraryPath,
            required bool enableAutoScan,
          }) =>
              LocalSteamAppScanTableCompanion.insert(
            id: id,
            uuid: uuid,
            libraryPath: libraryPath,
            enableAutoScan: enableAutoScan,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalSteamAppScanTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalSteamAppScanTableTable,
        LocalSteamAppScan,
        $$LocalSteamAppScanTableTableFilterComposer,
        $$LocalSteamAppScanTableTableOrderingComposer,
        $$LocalSteamAppScanTableTableAnnotationComposer,
        $$LocalSteamAppScanTableTableCreateCompanionBuilder,
        $$LocalSteamAppScanTableTableUpdateCompanionBuilder,
        (
          LocalSteamAppScan,
          BaseReferences<_$AppDatabase, $LocalSteamAppScanTableTable,
              LocalSteamAppScan>
        ),
        LocalSteamAppScan,
        PrefetchHooks Function()>;
typedef $$LocalSteamAppScanResultTableTableCreateCompanionBuilder
    = LocalSteamAppScanResultTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String scanUUID,
  required String steamAppID,
  required String name,
  required String installPath,
  required String launcherPath,
  Value<String?> sizeOnDisk,
});
typedef $$LocalSteamAppScanResultTableTableUpdateCompanionBuilder
    = LocalSteamAppScanResultTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> scanUUID,
  Value<String> steamAppID,
  Value<String> name,
  Value<String> installPath,
  Value<String> launcherPath,
  Value<String?> sizeOnDisk,
});

class $$LocalSteamAppScanResultTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSteamAppScanResultTableTable> {
  $$LocalSteamAppScanResultTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scanUUID => $composableBuilder(
      column: $table.scanUUID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get steamAppID => $composableBuilder(
      column: $table.steamAppID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get installPath => $composableBuilder(
      column: $table.installPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get launcherPath => $composableBuilder(
      column: $table.launcherPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sizeOnDisk => $composableBuilder(
      column: $table.sizeOnDisk, builder: (column) => ColumnFilters(column));
}

class $$LocalSteamAppScanResultTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSteamAppScanResultTableTable> {
  $$LocalSteamAppScanResultTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scanUUID => $composableBuilder(
      column: $table.scanUUID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get steamAppID => $composableBuilder(
      column: $table.steamAppID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get installPath => $composableBuilder(
      column: $table.installPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get launcherPath => $composableBuilder(
      column: $table.launcherPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sizeOnDisk => $composableBuilder(
      column: $table.sizeOnDisk, builder: (column) => ColumnOrderings(column));
}

class $$LocalSteamAppScanResultTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSteamAppScanResultTableTable> {
  $$LocalSteamAppScanResultTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get scanUUID =>
      $composableBuilder(column: $table.scanUUID, builder: (column) => column);

  GeneratedColumn<String> get steamAppID => $composableBuilder(
      column: $table.steamAppID, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get installPath => $composableBuilder(
      column: $table.installPath, builder: (column) => column);

  GeneratedColumn<String> get launcherPath => $composableBuilder(
      column: $table.launcherPath, builder: (column) => column);

  GeneratedColumn<String> get sizeOnDisk => $composableBuilder(
      column: $table.sizeOnDisk, builder: (column) => column);
}

class $$LocalSteamAppScanResultTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalSteamAppScanResultTableTable,
    LocalSteamAppScanResult,
    $$LocalSteamAppScanResultTableTableFilterComposer,
    $$LocalSteamAppScanResultTableTableOrderingComposer,
    $$LocalSteamAppScanResultTableTableAnnotationComposer,
    $$LocalSteamAppScanResultTableTableCreateCompanionBuilder,
    $$LocalSteamAppScanResultTableTableUpdateCompanionBuilder,
    (
      LocalSteamAppScanResult,
      BaseReferences<_$AppDatabase, $LocalSteamAppScanResultTableTable,
          LocalSteamAppScanResult>
    ),
    LocalSteamAppScanResult,
    PrefetchHooks Function()> {
  $$LocalSteamAppScanResultTableTableTableManager(
      _$AppDatabase db, $LocalSteamAppScanResultTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSteamAppScanResultTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalSteamAppScanResultTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalSteamAppScanResultTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> scanUUID = const Value.absent(),
            Value<String> steamAppID = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> installPath = const Value.absent(),
            Value<String> launcherPath = const Value.absent(),
            Value<String?> sizeOnDisk = const Value.absent(),
          }) =>
              LocalSteamAppScanResultTableCompanion(
            id: id,
            uuid: uuid,
            scanUUID: scanUUID,
            steamAppID: steamAppID,
            name: name,
            installPath: installPath,
            launcherPath: launcherPath,
            sizeOnDisk: sizeOnDisk,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String scanUUID,
            required String steamAppID,
            required String name,
            required String installPath,
            required String launcherPath,
            Value<String?> sizeOnDisk = const Value.absent(),
          }) =>
              LocalSteamAppScanResultTableCompanion.insert(
            id: id,
            uuid: uuid,
            scanUUID: scanUUID,
            steamAppID: steamAppID,
            name: name,
            installPath: installPath,
            launcherPath: launcherPath,
            sizeOnDisk: sizeOnDisk,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalSteamAppScanResultTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalSteamAppScanResultTableTable,
        LocalSteamAppScanResult,
        $$LocalSteamAppScanResultTableTableFilterComposer,
        $$LocalSteamAppScanResultTableTableOrderingComposer,
        $$LocalSteamAppScanResultTableTableAnnotationComposer,
        $$LocalSteamAppScanResultTableTableCreateCompanionBuilder,
        $$LocalSteamAppScanResultTableTableUpdateCompanionBuilder,
        (
          LocalSteamAppScanResult,
          BaseReferences<_$AppDatabase, $LocalSteamAppScanResultTableTable,
              LocalSteamAppScanResult>
        ),
        LocalSteamAppScanResult,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$KVTableTableTableManager get kVTable =>
      $$KVTableTableTableManager(_db, _db.kVTable);
  $$ServerConfigTableTableTableManager get serverConfigTable =>
      $$ServerConfigTableTableTableManager(_db, _db.serverConfigTable);
  $$FeedConfigTableTableTableManager get feedConfigTable =>
      $$FeedConfigTableTableTableManager(_db, _db.feedConfigTable);
  $$LocalAppTableTableTableManager get localAppTable =>
      $$LocalAppTableTableTableManager(_db, _db.localAppTable);
  $$LocalAppInstTableTableTableManager get localAppInstTable =>
      $$LocalAppInstTableTableTableManager(_db, _db.localAppInstTable);
  $$LocalAppInstLauncherTableTableTableManager get localAppInstLauncherTable =>
      $$LocalAppInstLauncherTableTableTableManager(
          _db, _db.localAppInstLauncherTable);
  $$LocalAppRunRecordTableTableTableManager get localAppRunRecordTable =>
      $$LocalAppRunRecordTableTableTableManager(
          _db, _db.localAppRunRecordTable);
  $$LocalCommonAppScanTableTableTableManager get localCommonAppScanTable =>
      $$LocalCommonAppScanTableTableTableManager(
          _db, _db.localCommonAppScanTable);
  $$LocalCommonAppScanResultTableTableTableManager
      get localCommonAppScanResultTable =>
          $$LocalCommonAppScanResultTableTableTableManager(
              _db, _db.localCommonAppScanResultTable);
  $$LocalSteamAppScanTableTableTableManager get localSteamAppScanTable =>
      $$LocalSteamAppScanTableTableTableManager(
          _db, _db.localSteamAppScanTable);
  $$LocalSteamAppScanResultTableTableTableManager
      get localSteamAppScanResultTable =>
          $$LocalSteamAppScanResultTableTableTableManager(
              _db, _db.localSteamAppScanResultTable);
}
