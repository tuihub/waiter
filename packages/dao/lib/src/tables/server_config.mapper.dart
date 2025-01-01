// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'server_config.dart';

class ServerConfigMapper extends ClassMapperBase<ServerConfig> {
  ServerConfigMapper._();

  static ServerConfigMapper? _instance;
  static ServerConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerConfigMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServerConfig';

  static int _$id(ServerConfig v) => v.id;
  static const Field<ServerConfig, int> _f$id =
      Field('id', _$id, opt: true, def: 0);
  static String _$host(ServerConfig v) => v.host;
  static const Field<ServerConfig, String> _f$host = Field('host', _$host);
  static int _$port(ServerConfig v) => v.port;
  static const Field<ServerConfig, int> _f$port = Field('port', _$port);
  static bool _$enableTLS(ServerConfig v) => v.enableTLS;
  static const Field<ServerConfig, bool> _f$enableTLS =
      Field('enableTLS', _$enableTLS);
  static String _$username(ServerConfig v) => v.username;
  static const Field<ServerConfig, String> _f$username =
      Field('username', _$username, opt: true, def: '');
  static String? _$refreshToken(ServerConfig v) => v.refreshToken;
  static const Field<ServerConfig, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken, opt: true);
  static int? _$deviceId(ServerConfig v) => v.deviceId;
  static const Field<ServerConfig, int> _f$deviceId =
      Field('deviceId', _$deviceId, opt: true);

  @override
  final MappableFields<ServerConfig> fields = const {
    #id: _f$id,
    #host: _f$host,
    #port: _f$port,
    #enableTLS: _f$enableTLS,
    #username: _f$username,
    #refreshToken: _f$refreshToken,
    #deviceId: _f$deviceId,
  };

  static ServerConfig _instantiate(DecodingData data) {
    return ServerConfig(
        id: data.dec(_f$id),
        host: data.dec(_f$host),
        port: data.dec(_f$port),
        enableTLS: data.dec(_f$enableTLS),
        username: data.dec(_f$username),
        refreshToken: data.dec(_f$refreshToken),
        deviceId: data.dec(_f$deviceId));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerConfig>(map);
  }

  static ServerConfig fromJson(String json) {
    return ensureInitialized().decodeJson<ServerConfig>(json);
  }
}

mixin ServerConfigMappable {
  String toJson() {
    return ServerConfigMapper.ensureInitialized()
        .encodeJson<ServerConfig>(this as ServerConfig);
  }

  Map<String, dynamic> toMap() {
    return ServerConfigMapper.ensureInitialized()
        .encodeMap<ServerConfig>(this as ServerConfig);
  }

  ServerConfigCopyWith<ServerConfig, ServerConfig, ServerConfig> get copyWith =>
      _ServerConfigCopyWithImpl(this as ServerConfig, $identity, $identity);
  @override
  String toString() {
    return ServerConfigMapper.ensureInitialized()
        .stringifyValue(this as ServerConfig);
  }

  @override
  bool operator ==(Object other) {
    return ServerConfigMapper.ensureInitialized()
        .equalsValue(this as ServerConfig, other);
  }

  @override
  int get hashCode {
    return ServerConfigMapper.ensureInitialized()
        .hashValue(this as ServerConfig);
  }
}

extension ServerConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerConfig, $Out> {
  ServerConfigCopyWith<$R, ServerConfig, $Out> get $asServerConfig =>
      $base.as((v, t, t2) => _ServerConfigCopyWithImpl(v, t, t2));
}

abstract class ServerConfigCopyWith<$R, $In extends ServerConfig, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? host,
      int? port,
      bool? enableTLS,
      String? username,
      String? refreshToken,
      int? deviceId});
  ServerConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerConfig, $Out>
    implements ServerConfigCopyWith<$R, ServerConfig, $Out> {
  _ServerConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerConfig> $mapper =
      ServerConfigMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? host,
          int? port,
          bool? enableTLS,
          String? username,
          Object? refreshToken = $none,
          Object? deviceId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (host != null) #host: host,
        if (port != null) #port: port,
        if (enableTLS != null) #enableTLS: enableTLS,
        if (username != null) #username: username,
        if (refreshToken != $none) #refreshToken: refreshToken,
        if (deviceId != $none) #deviceId: deviceId
      }));
  @override
  ServerConfig $make(CopyWithData data) => ServerConfig(
      id: data.get(#id, or: $value.id),
      host: data.get(#host, or: $value.host),
      port: data.get(#port, or: $value.port),
      enableTLS: data.get(#enableTLS, or: $value.enableTLS),
      username: data.get(#username, or: $value.username),
      refreshToken: data.get(#refreshToken, or: $value.refreshToken),
      deviceId: data.get(#deviceId, or: $value.deviceId));

  @override
  ServerConfigCopyWith<$R2, ServerConfig, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerConfigCopyWithImpl($value, $cast, t);
}
