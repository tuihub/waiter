// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'server_config.dart';

class ServerIDMapper extends ClassMapperBase<ServerID> {
  ServerIDMapper._();

  static ServerIDMapper? _instance;
  static ServerIDMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerIDMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServerID';

  static String _$host(ServerID v) => v.host;
  static const Field<ServerID, String> _f$host = Field('host', _$host);
  static int _$port(ServerID v) => v.port;
  static const Field<ServerID, int> _f$port = Field('port', _$port);
  static String _$username(ServerID v) => v.username;
  static const Field<ServerID, String> _f$username =
      Field('username', _$username);
  static bool _$isLocal(ServerID v) => v.isLocal;
  static const Field<ServerID, bool> _f$isLocal =
      Field('isLocal', _$isLocal, opt: true, def: false);

  @override
  final MappableFields<ServerID> fields = const {
    #host: _f$host,
    #port: _f$port,
    #username: _f$username,
    #isLocal: _f$isLocal,
  };

  static ServerID _instantiate(DecodingData data) {
    return ServerID(data.dec(_f$host), data.dec(_f$port), data.dec(_f$username),
        data.dec(_f$isLocal));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerID fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerID>(map);
  }

  static ServerID fromJson(String json) {
    return ensureInitialized().decodeJson<ServerID>(json);
  }
}

mixin ServerIDMappable {
  String toJson() {
    return ServerIDMapper.ensureInitialized()
        .encodeJson<ServerID>(this as ServerID);
  }

  Map<String, dynamic> toMap() {
    return ServerIDMapper.ensureInitialized()
        .encodeMap<ServerID>(this as ServerID);
  }

  ServerIDCopyWith<ServerID, ServerID, ServerID> get copyWith =>
      _ServerIDCopyWithImpl(this as ServerID, $identity, $identity);
  @override
  String toString() {
    return ServerIDMapper.ensureInitialized().stringifyValue(this as ServerID);
  }

  @override
  bool operator ==(Object other) {
    return ServerIDMapper.ensureInitialized()
        .equalsValue(this as ServerID, other);
  }

  @override
  int get hashCode {
    return ServerIDMapper.ensureInitialized().hashValue(this as ServerID);
  }
}

extension ServerIDValueCopy<$R, $Out> on ObjectCopyWith<$R, ServerID, $Out> {
  ServerIDCopyWith<$R, ServerID, $Out> get $asServerID =>
      $base.as((v, t, t2) => _ServerIDCopyWithImpl(v, t, t2));
}

abstract class ServerIDCopyWith<$R, $In extends ServerID, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? host, int? port, String? username, bool? isLocal});
  ServerIDCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerIDCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerID, $Out>
    implements ServerIDCopyWith<$R, ServerID, $Out> {
  _ServerIDCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerID> $mapper =
      ServerIDMapper.ensureInitialized();
  @override
  $R call({String? host, int? port, String? username, bool? isLocal}) =>
      $apply(FieldCopyWithData({
        if (host != null) #host: host,
        if (port != null) #port: port,
        if (username != null) #username: username,
        if (isLocal != null) #isLocal: isLocal
      }));
  @override
  ServerID $make(CopyWithData data) => ServerID(
      data.get(#host, or: $value.host),
      data.get(#port, or: $value.port),
      data.get(#username, or: $value.username),
      data.get(#isLocal, or: $value.isLocal));

  @override
  ServerIDCopyWith<$R2, ServerID, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerIDCopyWithImpl($value, $cast, t);
}

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
