// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerConfig _$ServerConfigFromJson(Map<String, dynamic> json) {
  return _ServerConfig.fromJson(json);
}

/// @nodoc
mixin _$ServerConfig {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  bool get tls => throw _privateConstructorUsedError;
  String? get serverName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  int? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerConfigCopyWith<ServerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConfigCopyWith<$Res> {
  factory $ServerConfigCopyWith(
          ServerConfig value, $Res Function(ServerConfig) then) =
      _$ServerConfigCopyWithImpl<$Res, ServerConfig>;
  @useResult
  $Res call(
      {String host,
      int port,
      bool tls,
      String? serverName,
      String? username,
      String? refreshToken,
      int? deviceId});
}

/// @nodoc
class _$ServerConfigCopyWithImpl<$Res, $Val extends ServerConfig>
    implements $ServerConfigCopyWith<$Res> {
  _$ServerConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? tls = null,
    Object? serverName = freezed,
    Object? username = freezed,
    Object? refreshToken = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      tls: null == tls
          ? _value.tls
          : tls // ignore: cast_nullable_to_non_nullable
              as bool,
      serverName: freezed == serverName
          ? _value.serverName
          : serverName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerConfigImplCopyWith<$Res>
    implements $ServerConfigCopyWith<$Res> {
  factory _$$ServerConfigImplCopyWith(
          _$ServerConfigImpl value, $Res Function(_$ServerConfigImpl) then) =
      __$$ServerConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String host,
      int port,
      bool tls,
      String? serverName,
      String? username,
      String? refreshToken,
      int? deviceId});
}

/// @nodoc
class __$$ServerConfigImplCopyWithImpl<$Res>
    extends _$ServerConfigCopyWithImpl<$Res, _$ServerConfigImpl>
    implements _$$ServerConfigImplCopyWith<$Res> {
  __$$ServerConfigImplCopyWithImpl(
      _$ServerConfigImpl _value, $Res Function(_$ServerConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? tls = null,
    Object? serverName = freezed,
    Object? username = freezed,
    Object? refreshToken = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$ServerConfigImpl(
      null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      null == tls
          ? _value.tls
          : tls // ignore: cast_nullable_to_non_nullable
              as bool,
      serverName: freezed == serverName
          ? _value.serverName
          : serverName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerConfigImpl extends _ServerConfig {
  const _$ServerConfigImpl(this.host, this.port, this.tls,
      {this.serverName, this.username, this.refreshToken, this.deviceId})
      : super._();

  factory _$ServerConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerConfigImplFromJson(json);

  @override
  final String host;
  @override
  final int port;
  @override
  final bool tls;
  @override
  final String? serverName;
  @override
  final String? username;
  @override
  final String? refreshToken;
  @override
  final int? deviceId;

  @override
  String toString() {
    return 'ServerConfig(host: $host, port: $port, tls: $tls, serverName: $serverName, username: $username, refreshToken: $refreshToken, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.tls, tls) || other.tls == tls) &&
            (identical(other.serverName, serverName) ||
                other.serverName == serverName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, host, port, tls, serverName,
      username, refreshToken, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerConfigImplCopyWith<_$ServerConfigImpl> get copyWith =>
      __$$ServerConfigImplCopyWithImpl<_$ServerConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerConfigImplToJson(
      this,
    );
  }
}

abstract class _ServerConfig extends ServerConfig {
  const factory _ServerConfig(final String host, final int port, final bool tls,
      {final String? serverName,
      final String? username,
      final String? refreshToken,
      final int? deviceId}) = _$ServerConfigImpl;
  const _ServerConfig._() : super._();

  factory _ServerConfig.fromJson(Map<String, dynamic> json) =
      _$ServerConfigImpl.fromJson;

  @override
  String get host;
  @override
  int get port;
  @override
  bool get tls;
  @override
  String? get serverName;
  @override
  String? get username;
  @override
  String? get refreshToken;
  @override
  int? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$ServerConfigImplCopyWith<_$ServerConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientCommonData _$ClientCommonDataFromJson(Map<String, dynamic> json) {
  return _ClientCommonData.fromJson(json);
}

/// @nodoc
mixin _$ClientCommonData {
  String? get lastServerId => throw _privateConstructorUsedError;
  String? get themeName => throw _privateConstructorUsedError;
  int? get themeMode => throw _privateConstructorUsedError;
  Map<String, ServerConfig>? get servers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCommonDataCopyWith<ClientCommonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCommonDataCopyWith<$Res> {
  factory $ClientCommonDataCopyWith(
          ClientCommonData value, $Res Function(ClientCommonData) then) =
      _$ClientCommonDataCopyWithImpl<$Res, ClientCommonData>;
  @useResult
  $Res call(
      {String? lastServerId,
      String? themeName,
      int? themeMode,
      Map<String, ServerConfig>? servers});
}

/// @nodoc
class _$ClientCommonDataCopyWithImpl<$Res, $Val extends ClientCommonData>
    implements $ClientCommonDataCopyWith<$Res> {
  _$ClientCommonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastServerId = freezed,
    Object? themeName = freezed,
    Object? themeMode = freezed,
    Object? servers = freezed,
  }) {
    return _then(_value.copyWith(
      lastServerId: freezed == lastServerId
          ? _value.lastServerId
          : lastServerId // ignore: cast_nullable_to_non_nullable
              as String?,
      themeName: freezed == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int?,
      servers: freezed == servers
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as Map<String, ServerConfig>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientCommonDataImplCopyWith<$Res>
    implements $ClientCommonDataCopyWith<$Res> {
  factory _$$ClientCommonDataImplCopyWith(_$ClientCommonDataImpl value,
          $Res Function(_$ClientCommonDataImpl) then) =
      __$$ClientCommonDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? lastServerId,
      String? themeName,
      int? themeMode,
      Map<String, ServerConfig>? servers});
}

/// @nodoc
class __$$ClientCommonDataImplCopyWithImpl<$Res>
    extends _$ClientCommonDataCopyWithImpl<$Res, _$ClientCommonDataImpl>
    implements _$$ClientCommonDataImplCopyWith<$Res> {
  __$$ClientCommonDataImplCopyWithImpl(_$ClientCommonDataImpl _value,
      $Res Function(_$ClientCommonDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastServerId = freezed,
    Object? themeName = freezed,
    Object? themeMode = freezed,
    Object? servers = freezed,
  }) {
    return _then(_$ClientCommonDataImpl(
      lastServerId: freezed == lastServerId
          ? _value.lastServerId
          : lastServerId // ignore: cast_nullable_to_non_nullable
              as String?,
      themeName: freezed == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int?,
      servers: freezed == servers
          ? _value._servers
          : servers // ignore: cast_nullable_to_non_nullable
              as Map<String, ServerConfig>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientCommonDataImpl implements _ClientCommonData {
  const _$ClientCommonDataImpl(
      {this.lastServerId,
      this.themeName,
      this.themeMode,
      final Map<String, ServerConfig>? servers})
      : _servers = servers;

  factory _$ClientCommonDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientCommonDataImplFromJson(json);

  @override
  final String? lastServerId;
  @override
  final String? themeName;
  @override
  final int? themeMode;
  final Map<String, ServerConfig>? _servers;
  @override
  Map<String, ServerConfig>? get servers {
    final value = _servers;
    if (value == null) return null;
    if (_servers is EqualUnmodifiableMapView) return _servers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ClientCommonData(lastServerId: $lastServerId, themeName: $themeName, themeMode: $themeMode, servers: $servers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientCommonDataImpl &&
            (identical(other.lastServerId, lastServerId) ||
                other.lastServerId == lastServerId) &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            const DeepCollectionEquality().equals(other._servers, _servers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastServerId, themeName,
      themeMode, const DeepCollectionEquality().hash(_servers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientCommonDataImplCopyWith<_$ClientCommonDataImpl> get copyWith =>
      __$$ClientCommonDataImplCopyWithImpl<_$ClientCommonDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientCommonDataImplToJson(
      this,
    );
  }
}

abstract class _ClientCommonData implements ClientCommonData {
  const factory _ClientCommonData(
      {final String? lastServerId,
      final String? themeName,
      final int? themeMode,
      final Map<String, ServerConfig>? servers}) = _$ClientCommonDataImpl;

  factory _ClientCommonData.fromJson(Map<String, dynamic> json) =
      _$ClientCommonDataImpl.fromJson;

  @override
  String? get lastServerId;
  @override
  String? get themeName;
  @override
  int? get themeMode;
  @override
  Map<String, ServerConfig>? get servers;
  @override
  @JsonKey(ignore: true)
  _$$ClientCommonDataImplCopyWith<_$ClientCommonDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientDeviceInfo _$ClientDeviceInfoFromJson(Map<String, dynamic> json) {
  return _ClientDeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$ClientDeviceInfo {
  String get deviceName => throw _privateConstructorUsedError;
  String get systemVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientDeviceInfoCopyWith<ClientDeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientDeviceInfoCopyWith<$Res> {
  factory $ClientDeviceInfoCopyWith(
          ClientDeviceInfo value, $Res Function(ClientDeviceInfo) then) =
      _$ClientDeviceInfoCopyWithImpl<$Res, ClientDeviceInfo>;
  @useResult
  $Res call({String deviceName, String systemVersion});
}

/// @nodoc
class _$ClientDeviceInfoCopyWithImpl<$Res, $Val extends ClientDeviceInfo>
    implements $ClientDeviceInfoCopyWith<$Res> {
  _$ClientDeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? systemVersion = null,
  }) {
    return _then(_value.copyWith(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      systemVersion: null == systemVersion
          ? _value.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientDeviceInfoImplCopyWith<$Res>
    implements $ClientDeviceInfoCopyWith<$Res> {
  factory _$$ClientDeviceInfoImplCopyWith(_$ClientDeviceInfoImpl value,
          $Res Function(_$ClientDeviceInfoImpl) then) =
      __$$ClientDeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceName, String systemVersion});
}

/// @nodoc
class __$$ClientDeviceInfoImplCopyWithImpl<$Res>
    extends _$ClientDeviceInfoCopyWithImpl<$Res, _$ClientDeviceInfoImpl>
    implements _$$ClientDeviceInfoImplCopyWith<$Res> {
  __$$ClientDeviceInfoImplCopyWithImpl(_$ClientDeviceInfoImpl _value,
      $Res Function(_$ClientDeviceInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? systemVersion = null,
  }) {
    return _then(_$ClientDeviceInfoImpl(
      null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      null == systemVersion
          ? _value.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientDeviceInfoImpl implements _ClientDeviceInfo {
  const _$ClientDeviceInfoImpl(this.deviceName, this.systemVersion);

  factory _$ClientDeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientDeviceInfoImplFromJson(json);

  @override
  final String deviceName;
  @override
  final String systemVersion;

  @override
  String toString() {
    return 'ClientDeviceInfo(deviceName: $deviceName, systemVersion: $systemVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientDeviceInfoImpl &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.systemVersion, systemVersion) ||
                other.systemVersion == systemVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceName, systemVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientDeviceInfoImplCopyWith<_$ClientDeviceInfoImpl> get copyWith =>
      __$$ClientDeviceInfoImplCopyWithImpl<_$ClientDeviceInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientDeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _ClientDeviceInfo implements ClientDeviceInfo {
  const factory _ClientDeviceInfo(
          final String deviceName, final String systemVersion) =
      _$ClientDeviceInfoImpl;

  factory _ClientDeviceInfo.fromJson(Map<String, dynamic> json) =
      _$ClientDeviceInfoImpl.fromJson;

  @override
  String get deviceName;
  @override
  String get systemVersion;
  @override
  @JsonKey(ignore: true)
  _$$ClientDeviceInfoImplCopyWith<_$ClientDeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
