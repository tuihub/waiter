// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_app_inst.dart';

class LocalAppInstMapper extends ClassMapperBase<LocalAppInst> {
  LocalAppInstMapper._();

  static LocalAppInstMapper? _instance;
  static LocalAppInstMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalAppInstMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalAppInst';

  static String _$uuid(LocalAppInst v) => v.uuid;
  static const Field<LocalAppInst, String> _f$uuid = Field('uuid', _$uuid);
  static String _$appUUID(LocalAppInst v) => v.appUUID;
  static const Field<LocalAppInst, String> _f$appUUID =
      Field('appUUID', _$appUUID);
  static String? _$name(LocalAppInst v) => v.name;
  static const Field<LocalAppInst, String> _f$name =
      Field('name', _$name, opt: true);
  static String _$path(LocalAppInst v) => v.path;
  static const Field<LocalAppInst, String> _f$path = Field('path', _$path);
  static String _$version(LocalAppInst v) => v.version;
  static const Field<LocalAppInst, String> _f$version =
      Field('version', _$version, opt: true, def: '');
  static String? _$lastLaunchedLauncherUUID(LocalAppInst v) =>
      v.lastLaunchedLauncherUUID;
  static const Field<LocalAppInst, String> _f$lastLaunchedLauncherUUID =
      Field('lastLaunchedLauncherUUID', _$lastLaunchedLauncherUUID, opt: true);

  @override
  final MappableFields<LocalAppInst> fields = const {
    #uuid: _f$uuid,
    #appUUID: _f$appUUID,
    #name: _f$name,
    #path: _f$path,
    #version: _f$version,
    #lastLaunchedLauncherUUID: _f$lastLaunchedLauncherUUID,
  };

  static LocalAppInst _instantiate(DecodingData data) {
    return LocalAppInst(
        uuid: data.dec(_f$uuid),
        appUUID: data.dec(_f$appUUID),
        name: data.dec(_f$name),
        path: data.dec(_f$path),
        version: data.dec(_f$version),
        lastLaunchedLauncherUUID: data.dec(_f$lastLaunchedLauncherUUID));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalAppInst fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalAppInst>(map);
  }

  static LocalAppInst fromJson(String json) {
    return ensureInitialized().decodeJson<LocalAppInst>(json);
  }
}

mixin LocalAppInstMappable {
  String toJson() {
    return LocalAppInstMapper.ensureInitialized()
        .encodeJson<LocalAppInst>(this as LocalAppInst);
  }

  Map<String, dynamic> toMap() {
    return LocalAppInstMapper.ensureInitialized()
        .encodeMap<LocalAppInst>(this as LocalAppInst);
  }

  LocalAppInstCopyWith<LocalAppInst, LocalAppInst, LocalAppInst> get copyWith =>
      _LocalAppInstCopyWithImpl(this as LocalAppInst, $identity, $identity);
  @override
  String toString() {
    return LocalAppInstMapper.ensureInitialized()
        .stringifyValue(this as LocalAppInst);
  }

  @override
  bool operator ==(Object other) {
    return LocalAppInstMapper.ensureInitialized()
        .equalsValue(this as LocalAppInst, other);
  }

  @override
  int get hashCode {
    return LocalAppInstMapper.ensureInitialized()
        .hashValue(this as LocalAppInst);
  }
}

extension LocalAppInstValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalAppInst, $Out> {
  LocalAppInstCopyWith<$R, LocalAppInst, $Out> get $asLocalAppInst =>
      $base.as((v, t, t2) => _LocalAppInstCopyWithImpl(v, t, t2));
}

abstract class LocalAppInstCopyWith<$R, $In extends LocalAppInst, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? uuid,
      String? appUUID,
      String? name,
      String? path,
      String? version,
      String? lastLaunchedLauncherUUID});
  LocalAppInstCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocalAppInstCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalAppInst, $Out>
    implements LocalAppInstCopyWith<$R, LocalAppInst, $Out> {
  _LocalAppInstCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalAppInst> $mapper =
      LocalAppInstMapper.ensureInitialized();
  @override
  $R call(
          {String? uuid,
          String? appUUID,
          Object? name = $none,
          String? path,
          String? version,
          Object? lastLaunchedLauncherUUID = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (appUUID != null) #appUUID: appUUID,
        if (name != $none) #name: name,
        if (path != null) #path: path,
        if (version != null) #version: version,
        if (lastLaunchedLauncherUUID != $none)
          #lastLaunchedLauncherUUID: lastLaunchedLauncherUUID
      }));
  @override
  LocalAppInst $make(CopyWithData data) => LocalAppInst(
      uuid: data.get(#uuid, or: $value.uuid),
      appUUID: data.get(#appUUID, or: $value.appUUID),
      name: data.get(#name, or: $value.name),
      path: data.get(#path, or: $value.path),
      version: data.get(#version, or: $value.version),
      lastLaunchedLauncherUUID: data.get(#lastLaunchedLauncherUUID,
          or: $value.lastLaunchedLauncherUUID));

  @override
  LocalAppInstCopyWith<$R2, LocalAppInst, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalAppInstCopyWithImpl($value, $cast, t);
}
