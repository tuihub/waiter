// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_common_app_scan_result.dart';

class LocalCommonAppScanResultMapper
    extends ClassMapperBase<LocalCommonAppScanResult> {
  LocalCommonAppScanResultMapper._();

  static LocalCommonAppScanResultMapper? _instance;
  static LocalCommonAppScanResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = LocalCommonAppScanResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalCommonAppScanResult';

  static String _$uuid(LocalCommonAppScanResult v) => v.uuid;
  static const Field<LocalCommonAppScanResult, String> _f$uuid =
      Field('uuid', _$uuid);
  static String _$scanUUID(LocalCommonAppScanResult v) => v.scanUUID;
  static const Field<LocalCommonAppScanResult, String> _f$scanUUID =
      Field('scanUUID', _$scanUUID);
  static String? _$name(LocalCommonAppScanResult v) => v.name;
  static const Field<LocalCommonAppScanResult, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$version(LocalCommonAppScanResult v) => v.version;
  static const Field<LocalCommonAppScanResult, String> _f$version =
      Field('version', _$version, opt: true);
  static String _$installPath(LocalCommonAppScanResult v) => v.installPath;
  static const Field<LocalCommonAppScanResult, String> _f$installPath =
      Field('installPath', _$installPath);
  static List<String> _$launcherPaths(LocalCommonAppScanResult v) =>
      v.launcherPaths;
  static const Field<LocalCommonAppScanResult, List<String>> _f$launcherPaths =
      Field('launcherPaths', _$launcherPaths);

  @override
  final MappableFields<LocalCommonAppScanResult> fields = const {
    #uuid: _f$uuid,
    #scanUUID: _f$scanUUID,
    #name: _f$name,
    #version: _f$version,
    #installPath: _f$installPath,
    #launcherPaths: _f$launcherPaths,
  };

  static LocalCommonAppScanResult _instantiate(DecodingData data) {
    return LocalCommonAppScanResult(
        uuid: data.dec(_f$uuid),
        scanUUID: data.dec(_f$scanUUID),
        name: data.dec(_f$name),
        version: data.dec(_f$version),
        installPath: data.dec(_f$installPath),
        launcherPaths: data.dec(_f$launcherPaths));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalCommonAppScanResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalCommonAppScanResult>(map);
  }

  static LocalCommonAppScanResult fromJson(String json) {
    return ensureInitialized().decodeJson<LocalCommonAppScanResult>(json);
  }
}

mixin LocalCommonAppScanResultMappable {
  String toJson() {
    return LocalCommonAppScanResultMapper.ensureInitialized()
        .encodeJson<LocalCommonAppScanResult>(this as LocalCommonAppScanResult);
  }

  Map<String, dynamic> toMap() {
    return LocalCommonAppScanResultMapper.ensureInitialized()
        .encodeMap<LocalCommonAppScanResult>(this as LocalCommonAppScanResult);
  }

  LocalCommonAppScanResultCopyWith<LocalCommonAppScanResult,
          LocalCommonAppScanResult, LocalCommonAppScanResult>
      get copyWith => _LocalCommonAppScanResultCopyWithImpl(
          this as LocalCommonAppScanResult, $identity, $identity);
  @override
  String toString() {
    return LocalCommonAppScanResultMapper.ensureInitialized()
        .stringifyValue(this as LocalCommonAppScanResult);
  }

  @override
  bool operator ==(Object other) {
    return LocalCommonAppScanResultMapper.ensureInitialized()
        .equalsValue(this as LocalCommonAppScanResult, other);
  }

  @override
  int get hashCode {
    return LocalCommonAppScanResultMapper.ensureInitialized()
        .hashValue(this as LocalCommonAppScanResult);
  }
}

extension LocalCommonAppScanResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalCommonAppScanResult, $Out> {
  LocalCommonAppScanResultCopyWith<$R, LocalCommonAppScanResult, $Out>
      get $asLocalCommonAppScanResult => $base
          .as((v, t, t2) => _LocalCommonAppScanResultCopyWithImpl(v, t, t2));
}

abstract class LocalCommonAppScanResultCopyWith<
    $R,
    $In extends LocalCommonAppScanResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get launcherPaths;
  $R call(
      {String? uuid,
      String? scanUUID,
      String? name,
      String? version,
      String? installPath,
      List<String>? launcherPaths});
  LocalCommonAppScanResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalCommonAppScanResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalCommonAppScanResult, $Out>
    implements
        LocalCommonAppScanResultCopyWith<$R, LocalCommonAppScanResult, $Out> {
  _LocalCommonAppScanResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalCommonAppScanResult> $mapper =
      LocalCommonAppScanResultMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get launcherPaths => ListCopyWith(
          $value.launcherPaths,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(launcherPaths: v));
  @override
  $R call(
          {String? uuid,
          String? scanUUID,
          Object? name = $none,
          Object? version = $none,
          String? installPath,
          List<String>? launcherPaths}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (scanUUID != null) #scanUUID: scanUUID,
        if (name != $none) #name: name,
        if (version != $none) #version: version,
        if (installPath != null) #installPath: installPath,
        if (launcherPaths != null) #launcherPaths: launcherPaths
      }));
  @override
  LocalCommonAppScanResult $make(CopyWithData data) => LocalCommonAppScanResult(
      uuid: data.get(#uuid, or: $value.uuid),
      scanUUID: data.get(#scanUUID, or: $value.scanUUID),
      name: data.get(#name, or: $value.name),
      version: data.get(#version, or: $value.version),
      installPath: data.get(#installPath, or: $value.installPath),
      launcherPaths: data.get(#launcherPaths, or: $value.launcherPaths));

  @override
  LocalCommonAppScanResultCopyWith<$R2, LocalCommonAppScanResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalCommonAppScanResultCopyWithImpl($value, $cast, t);
}
