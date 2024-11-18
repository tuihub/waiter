// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_steam_app_scan.dart';

class LocalSteamAppScanMapper extends ClassMapperBase<LocalSteamAppScan> {
  LocalSteamAppScanMapper._();

  static LocalSteamAppScanMapper? _instance;
  static LocalSteamAppScanMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalSteamAppScanMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalSteamAppScan';

  static String _$uuid(LocalSteamAppScan v) => v.uuid;
  static const Field<LocalSteamAppScan, String> _f$uuid = Field('uuid', _$uuid);
  static String _$libraryPath(LocalSteamAppScan v) => v.libraryPath;
  static const Field<LocalSteamAppScan, String> _f$libraryPath =
      Field('libraryPath', _$libraryPath);
  static bool _$enableAutoScan(LocalSteamAppScan v) => v.enableAutoScan;
  static const Field<LocalSteamAppScan, bool> _f$enableAutoScan =
      Field('enableAutoScan', _$enableAutoScan);

  @override
  final MappableFields<LocalSteamAppScan> fields = const {
    #uuid: _f$uuid,
    #libraryPath: _f$libraryPath,
    #enableAutoScan: _f$enableAutoScan,
  };

  static LocalSteamAppScan _instantiate(DecodingData data) {
    return LocalSteamAppScan(
        uuid: data.dec(_f$uuid),
        libraryPath: data.dec(_f$libraryPath),
        enableAutoScan: data.dec(_f$enableAutoScan));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalSteamAppScan fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalSteamAppScan>(map);
  }

  static LocalSteamAppScan fromJson(String json) {
    return ensureInitialized().decodeJson<LocalSteamAppScan>(json);
  }
}

mixin LocalSteamAppScanMappable {
  String toJson() {
    return LocalSteamAppScanMapper.ensureInitialized()
        .encodeJson<LocalSteamAppScan>(this as LocalSteamAppScan);
  }

  Map<String, dynamic> toMap() {
    return LocalSteamAppScanMapper.ensureInitialized()
        .encodeMap<LocalSteamAppScan>(this as LocalSteamAppScan);
  }

  LocalSteamAppScanCopyWith<LocalSteamAppScan, LocalSteamAppScan,
          LocalSteamAppScan>
      get copyWith => _LocalSteamAppScanCopyWithImpl(
          this as LocalSteamAppScan, $identity, $identity);
  @override
  String toString() {
    return LocalSteamAppScanMapper.ensureInitialized()
        .stringifyValue(this as LocalSteamAppScan);
  }

  @override
  bool operator ==(Object other) {
    return LocalSteamAppScanMapper.ensureInitialized()
        .equalsValue(this as LocalSteamAppScan, other);
  }

  @override
  int get hashCode {
    return LocalSteamAppScanMapper.ensureInitialized()
        .hashValue(this as LocalSteamAppScan);
  }
}

extension LocalSteamAppScanValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalSteamAppScan, $Out> {
  LocalSteamAppScanCopyWith<$R, LocalSteamAppScan, $Out>
      get $asLocalSteamAppScan =>
          $base.as((v, t, t2) => _LocalSteamAppScanCopyWithImpl(v, t, t2));
}

abstract class LocalSteamAppScanCopyWith<$R, $In extends LocalSteamAppScan,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? uuid, String? libraryPath, bool? enableAutoScan});
  LocalSteamAppScanCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalSteamAppScanCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalSteamAppScan, $Out>
    implements LocalSteamAppScanCopyWith<$R, LocalSteamAppScan, $Out> {
  _LocalSteamAppScanCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalSteamAppScan> $mapper =
      LocalSteamAppScanMapper.ensureInitialized();
  @override
  $R call({String? uuid, String? libraryPath, bool? enableAutoScan}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (libraryPath != null) #libraryPath: libraryPath,
        if (enableAutoScan != null) #enableAutoScan: enableAutoScan
      }));
  @override
  LocalSteamAppScan $make(CopyWithData data) => LocalSteamAppScan(
      uuid: data.get(#uuid, or: $value.uuid),
      libraryPath: data.get(#libraryPath, or: $value.libraryPath),
      enableAutoScan: data.get(#enableAutoScan, or: $value.enableAutoScan));

  @override
  LocalSteamAppScanCopyWith<$R2, LocalSteamAppScan, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalSteamAppScanCopyWithImpl($value, $cast, t);
}
