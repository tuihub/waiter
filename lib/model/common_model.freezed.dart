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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerConfig _$ServerConfigFromJson(Map<String, dynamic> json) {
  return _ServerConfig.fromJson(json);
}

/// @nodoc
mixin _$ServerConfig {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  bool get tls => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

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
      {String host, int port, bool tls, String name, String? refreshToken});
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
    Object? name = null,
    Object? refreshToken = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String host, int port, bool tls, String name, String? refreshToken});
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
    Object? name = null,
    Object? refreshToken = freezed,
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
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerConfigImpl implements _ServerConfig {
  const _$ServerConfigImpl(this.host, this.port, this.tls, this.name,
      {this.refreshToken});

  factory _$ServerConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerConfigImplFromJson(json);

  @override
  final String host;
  @override
  final int port;
  @override
  final bool tls;
  @override
  final String name;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'ServerConfig(host: $host, port: $port, tls: $tls, name: $name, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.tls, tls) || other.tls == tls) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, host, port, tls, name, refreshToken);

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

abstract class _ServerConfig implements ServerConfig {
  const factory _ServerConfig(
      final String host, final int port, final bool tls, final String name,
      {final String? refreshToken}) = _$ServerConfigImpl;

  factory _ServerConfig.fromJson(Map<String, dynamic> json) =
      _$ServerConfigImpl.fromJson;

  @override
  String get host;
  @override
  int get port;
  @override
  bool get tls;
  @override
  String get name;
  @override
  String? get refreshToken;
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
  ServerConfig? get server => throw _privateConstructorUsedError;
  int? get theme => throw _privateConstructorUsedError;
  int? get themeMode => throw _privateConstructorUsedError;

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
  $Res call({ServerConfig? server, int? theme, int? themeMode});

  $ServerConfigCopyWith<$Res>? get server;
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
    Object? server = freezed,
    Object? theme = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_value.copyWith(
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int?,
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServerConfigCopyWith<$Res>? get server {
    if (_value.server == null) {
      return null;
    }

    return $ServerConfigCopyWith<$Res>(_value.server!, (value) {
      return _then(_value.copyWith(server: value) as $Val);
    });
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
  $Res call({ServerConfig? server, int? theme, int? themeMode});

  @override
  $ServerConfigCopyWith<$Res>? get server;
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
    Object? server = freezed,
    Object? theme = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_$ClientCommonDataImpl(
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int?,
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientCommonDataImpl implements _ClientCommonData {
  const _$ClientCommonDataImpl({this.server, this.theme, this.themeMode});

  factory _$ClientCommonDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientCommonDataImplFromJson(json);

  @override
  final ServerConfig? server;
  @override
  final int? theme;
  @override
  final int? themeMode;

  @override
  String toString() {
    return 'ClientCommonData(server: $server, theme: $theme, themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientCommonDataImpl &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, server, theme, themeMode);

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
      {final ServerConfig? server,
      final int? theme,
      final int? themeMode}) = _$ClientCommonDataImpl;

  factory _ClientCommonData.fromJson(Map<String, dynamic> json) =
      _$ClientCommonDataImpl.fromJson;

  @override
  ServerConfig? get server;
  @override
  int? get theme;
  @override
  int? get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$ClientCommonDataImplCopyWith<_$ClientCommonDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
