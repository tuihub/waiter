// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_steam_app_scan_result.dart';

class LocalSteamAppScanResultMapper
    extends ClassMapperBase<LocalSteamAppScanResult> {
  LocalSteamAppScanResultMapper._();

  static LocalSteamAppScanResultMapper? _instance;
  static LocalSteamAppScanResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = LocalSteamAppScanResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalSteamAppScanResult';

  static String _$uuid(LocalSteamAppScanResult v) => v.uuid;
  static const Field<LocalSteamAppScanResult, String> _f$uuid =
      Field('uuid', _$uuid);
  static String _$scanUUID(LocalSteamAppScanResult v) => v.scanUUID;
  static const Field<LocalSteamAppScanResult, String> _f$scanUUID =
      Field('scanUUID', _$scanUUID);
  static String _$steamAppID(LocalSteamAppScanResult v) => v.steamAppID;
  static const Field<LocalSteamAppScanResult, String> _f$steamAppID =
      Field('steamAppID', _$steamAppID);
  static String _$name(LocalSteamAppScanResult v) => v.name;
  static const Field<LocalSteamAppScanResult, String> _f$name =
      Field('name', _$name);
  static String _$installPath(LocalSteamAppScanResult v) => v.installPath;
  static const Field<LocalSteamAppScanResult, String> _f$installPath =
      Field('installPath', _$installPath);
  static String _$launcherPath(LocalSteamAppScanResult v) => v.launcherPath;
  static const Field<LocalSteamAppScanResult, String> _f$launcherPath =
      Field('launcherPath', _$launcherPath);
  static String? _$sizeOnDisk(LocalSteamAppScanResult v) => v.sizeOnDisk;
  static const Field<LocalSteamAppScanResult, String> _f$sizeOnDisk =
      Field('sizeOnDisk', _$sizeOnDisk, opt: true);

  @override
  final MappableFields<LocalSteamAppScanResult> fields = const {
    #uuid: _f$uuid,
    #scanUUID: _f$scanUUID,
    #steamAppID: _f$steamAppID,
    #name: _f$name,
    #installPath: _f$installPath,
    #launcherPath: _f$launcherPath,
    #sizeOnDisk: _f$sizeOnDisk,
  };

  static LocalSteamAppScanResult _instantiate(DecodingData data) {
    return LocalSteamAppScanResult(
        uuid: data.dec(_f$uuid),
        scanUUID: data.dec(_f$scanUUID),
        steamAppID: data.dec(_f$steamAppID),
        name: data.dec(_f$name),
        installPath: data.dec(_f$installPath),
        launcherPath: data.dec(_f$launcherPath),
        sizeOnDisk: data.dec(_f$sizeOnDisk));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalSteamAppScanResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalSteamAppScanResult>(map);
  }

  static LocalSteamAppScanResult fromJson(String json) {
    return ensureInitialized().decodeJson<LocalSteamAppScanResult>(json);
  }
}

mixin LocalSteamAppScanResultMappable {
  String toJson() {
    return LocalSteamAppScanResultMapper.ensureInitialized()
        .encodeJson<LocalSteamAppScanResult>(this as LocalSteamAppScanResult);
  }

  Map<String, dynamic> toMap() {
    return LocalSteamAppScanResultMapper.ensureInitialized()
        .encodeMap<LocalSteamAppScanResult>(this as LocalSteamAppScanResult);
  }

  LocalSteamAppScanResultCopyWith<LocalSteamAppScanResult,
          LocalSteamAppScanResult, LocalSteamAppScanResult>
      get copyWith => _LocalSteamAppScanResultCopyWithImpl(
          this as LocalSteamAppScanResult, $identity, $identity);
  @override
  String toString() {
    return LocalSteamAppScanResultMapper.ensureInitialized()
        .stringifyValue(this as LocalSteamAppScanResult);
  }

  @override
  bool operator ==(Object other) {
    return LocalSteamAppScanResultMapper.ensureInitialized()
        .equalsValue(this as LocalSteamAppScanResult, other);
  }

  @override
  int get hashCode {
    return LocalSteamAppScanResultMapper.ensureInitialized()
        .hashValue(this as LocalSteamAppScanResult);
  }
}

extension LocalSteamAppScanResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalSteamAppScanResult, $Out> {
  LocalSteamAppScanResultCopyWith<$R, LocalSteamAppScanResult, $Out>
      get $asLocalSteamAppScanResult => $base
          .as((v, t, t2) => _LocalSteamAppScanResultCopyWithImpl(v, t, t2));
}

abstract class LocalSteamAppScanResultCopyWith<
    $R,
    $In extends LocalSteamAppScanResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? uuid,
      String? scanUUID,
      String? steamAppID,
      String? name,
      String? installPath,
      String? launcherPath,
      String? sizeOnDisk});
  LocalSteamAppScanResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalSteamAppScanResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalSteamAppScanResult, $Out>
    implements
        LocalSteamAppScanResultCopyWith<$R, LocalSteamAppScanResult, $Out> {
  _LocalSteamAppScanResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalSteamAppScanResult> $mapper =
      LocalSteamAppScanResultMapper.ensureInitialized();
  @override
  $R call(
          {String? uuid,
          String? scanUUID,
          String? steamAppID,
          String? name,
          String? installPath,
          String? launcherPath,
          Object? sizeOnDisk = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (scanUUID != null) #scanUUID: scanUUID,
        if (steamAppID != null) #steamAppID: steamAppID,
        if (name != null) #name: name,
        if (installPath != null) #installPath: installPath,
        if (launcherPath != null) #launcherPath: launcherPath,
        if (sizeOnDisk != $none) #sizeOnDisk: sizeOnDisk
      }));
  @override
  LocalSteamAppScanResult $make(CopyWithData data) => LocalSteamAppScanResult(
      uuid: data.get(#uuid, or: $value.uuid),
      scanUUID: data.get(#scanUUID, or: $value.scanUUID),
      steamAppID: data.get(#steamAppID, or: $value.steamAppID),
      name: data.get(#name, or: $value.name),
      installPath: data.get(#installPath, or: $value.installPath),
      launcherPath: data.get(#launcherPath, or: $value.launcherPath),
      sizeOnDisk: data.get(#sizeOnDisk, or: $value.sizeOnDisk));

  @override
  LocalSteamAppScanResultCopyWith<$R2, LocalSteamAppScanResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalSteamAppScanResultCopyWithImpl($value, $cast, t);
}
