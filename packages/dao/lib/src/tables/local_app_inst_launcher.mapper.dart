// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_app_inst_launcher.dart';

class LocalAppInstLauncherMapper extends ClassMapperBase<LocalAppInstLauncher> {
  LocalAppInstLauncherMapper._();

  static LocalAppInstLauncherMapper? _instance;
  static LocalAppInstLauncherMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalAppInstLauncherMapper._());
      LocalAppInstLaunchCommonMapper.ensureInitialized();
      LocalAppInstLaunchSteamMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LocalAppInstLauncher';

  static String _$uuid(LocalAppInstLauncher v) => v.uuid;
  static const Field<LocalAppInstLauncher, String> _f$uuid =
      Field('uuid', _$uuid);
  static String _$appInstUUID(LocalAppInstLauncher v) => v.appInstUUID;
  static const Field<LocalAppInstLauncher, String> _f$appInstUUID =
      Field('appInstUUID', _$appInstUUID);
  static LocalAppInstLauncherType _$launcherType(LocalAppInstLauncher v) =>
      v.launcherType;
  static const Field<LocalAppInstLauncher, LocalAppInstLauncherType>
      _f$launcherType = Field('launcherType', _$launcherType);
  static LocalAppInstLaunchCommon? _$common(LocalAppInstLauncher v) => v.common;
  static const Field<LocalAppInstLauncher, LocalAppInstLaunchCommon> _f$common =
      Field('common', _$common, opt: true);
  static LocalAppInstLaunchSteam? _$steam(LocalAppInstLauncher v) => v.steam;
  static const Field<LocalAppInstLauncher, LocalAppInstLaunchSteam> _f$steam =
      Field('steam', _$steam, opt: true);

  @override
  final MappableFields<LocalAppInstLauncher> fields = const {
    #uuid: _f$uuid,
    #appInstUUID: _f$appInstUUID,
    #launcherType: _f$launcherType,
    #common: _f$common,
    #steam: _f$steam,
  };

  static LocalAppInstLauncher _instantiate(DecodingData data) {
    return LocalAppInstLauncher(
        uuid: data.dec(_f$uuid),
        appInstUUID: data.dec(_f$appInstUUID),
        launcherType: data.dec(_f$launcherType),
        common: data.dec(_f$common),
        steam: data.dec(_f$steam));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalAppInstLauncher fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalAppInstLauncher>(map);
  }

  static LocalAppInstLauncher fromJson(String json) {
    return ensureInitialized().decodeJson<LocalAppInstLauncher>(json);
  }
}

mixin LocalAppInstLauncherMappable {
  String toJson() {
    return LocalAppInstLauncherMapper.ensureInitialized()
        .encodeJson<LocalAppInstLauncher>(this as LocalAppInstLauncher);
  }

  Map<String, dynamic> toMap() {
    return LocalAppInstLauncherMapper.ensureInitialized()
        .encodeMap<LocalAppInstLauncher>(this as LocalAppInstLauncher);
  }

  LocalAppInstLauncherCopyWith<LocalAppInstLauncher, LocalAppInstLauncher,
          LocalAppInstLauncher>
      get copyWith => _LocalAppInstLauncherCopyWithImpl(
          this as LocalAppInstLauncher, $identity, $identity);
  @override
  String toString() {
    return LocalAppInstLauncherMapper.ensureInitialized()
        .stringifyValue(this as LocalAppInstLauncher);
  }

  @override
  bool operator ==(Object other) {
    return LocalAppInstLauncherMapper.ensureInitialized()
        .equalsValue(this as LocalAppInstLauncher, other);
  }

  @override
  int get hashCode {
    return LocalAppInstLauncherMapper.ensureInitialized()
        .hashValue(this as LocalAppInstLauncher);
  }
}

extension LocalAppInstLauncherValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalAppInstLauncher, $Out> {
  LocalAppInstLauncherCopyWith<$R, LocalAppInstLauncher, $Out>
      get $asLocalAppInstLauncher =>
          $base.as((v, t, t2) => _LocalAppInstLauncherCopyWithImpl(v, t, t2));
}

abstract class LocalAppInstLauncherCopyWith<
    $R,
    $In extends LocalAppInstLauncher,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  LocalAppInstLaunchCommonCopyWith<$R, LocalAppInstLaunchCommon,
      LocalAppInstLaunchCommon>? get common;
  LocalAppInstLaunchSteamCopyWith<$R, LocalAppInstLaunchSteam,
      LocalAppInstLaunchSteam>? get steam;
  $R call(
      {String? uuid,
      String? appInstUUID,
      LocalAppInstLauncherType? launcherType,
      LocalAppInstLaunchCommon? common,
      LocalAppInstLaunchSteam? steam});
  LocalAppInstLauncherCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalAppInstLauncherCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalAppInstLauncher, $Out>
    implements LocalAppInstLauncherCopyWith<$R, LocalAppInstLauncher, $Out> {
  _LocalAppInstLauncherCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalAppInstLauncher> $mapper =
      LocalAppInstLauncherMapper.ensureInitialized();
  @override
  LocalAppInstLaunchCommonCopyWith<$R, LocalAppInstLaunchCommon,
          LocalAppInstLaunchCommon>?
      get common => $value.common?.copyWith.$chain((v) => call(common: v));
  @override
  LocalAppInstLaunchSteamCopyWith<$R, LocalAppInstLaunchSteam,
          LocalAppInstLaunchSteam>?
      get steam => $value.steam?.copyWith.$chain((v) => call(steam: v));
  @override
  $R call(
          {String? uuid,
          String? appInstUUID,
          LocalAppInstLauncherType? launcherType,
          Object? common = $none,
          Object? steam = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (appInstUUID != null) #appInstUUID: appInstUUID,
        if (launcherType != null) #launcherType: launcherType,
        if (common != $none) #common: common,
        if (steam != $none) #steam: steam
      }));
  @override
  LocalAppInstLauncher $make(CopyWithData data) => LocalAppInstLauncher(
      uuid: data.get(#uuid, or: $value.uuid),
      appInstUUID: data.get(#appInstUUID, or: $value.appInstUUID),
      launcherType: data.get(#launcherType, or: $value.launcherType),
      common: data.get(#common, or: $value.common),
      steam: data.get(#steam, or: $value.steam));

  @override
  LocalAppInstLauncherCopyWith<$R2, LocalAppInstLauncher, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalAppInstLauncherCopyWithImpl($value, $cast, t);
}

class LocalAppInstLaunchCommonMapper
    extends ClassMapperBase<LocalAppInstLaunchCommon> {
  LocalAppInstLaunchCommonMapper._();

  static LocalAppInstLaunchCommonMapper? _instance;
  static LocalAppInstLaunchCommonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = LocalAppInstLaunchCommonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalAppInstLaunchCommon';

  static String _$launcherPath(LocalAppInstLaunchCommon v) => v.launcherPath;
  static const Field<LocalAppInstLaunchCommon, String> _f$launcherPath =
      Field('launcherPath', _$launcherPath);
  static String? _$workingDir(LocalAppInstLaunchCommon v) => v.workingDir;
  static const Field<LocalAppInstLaunchCommon, String> _f$workingDir =
      Field('workingDir', _$workingDir, opt: true);
  static bool _$advancedTracing(LocalAppInstLaunchCommon v) =>
      v.advancedTracing;
  static const Field<LocalAppInstLaunchCommon, bool> _f$advancedTracing =
      Field('advancedTracing', _$advancedTracing, opt: true, def: false);
  static String? _$processName(LocalAppInstLaunchCommon v) => v.processName;
  static const Field<LocalAppInstLaunchCommon, String> _f$processName =
      Field('processName', _$processName, opt: true);
  static String? _$processPath(LocalAppInstLaunchCommon v) => v.processPath;
  static const Field<LocalAppInstLaunchCommon, String> _f$processPath =
      Field('processPath', _$processPath, opt: true);
  static int? _$sleepCount(LocalAppInstLaunchCommon v) => v.sleepCount;
  static const Field<LocalAppInstLaunchCommon, int> _f$sleepCount =
      Field('sleepCount', _$sleepCount, opt: true);
  static int? _$sleepDuration(LocalAppInstLaunchCommon v) => v.sleepDuration;
  static const Field<LocalAppInstLaunchCommon, int> _f$sleepDuration =
      Field('sleepDuration', _$sleepDuration, opt: true);

  @override
  final MappableFields<LocalAppInstLaunchCommon> fields = const {
    #launcherPath: _f$launcherPath,
    #workingDir: _f$workingDir,
    #advancedTracing: _f$advancedTracing,
    #processName: _f$processName,
    #processPath: _f$processPath,
    #sleepCount: _f$sleepCount,
    #sleepDuration: _f$sleepDuration,
  };

  static LocalAppInstLaunchCommon _instantiate(DecodingData data) {
    return LocalAppInstLaunchCommon(
        launcherPath: data.dec(_f$launcherPath),
        workingDir: data.dec(_f$workingDir),
        advancedTracing: data.dec(_f$advancedTracing),
        processName: data.dec(_f$processName),
        processPath: data.dec(_f$processPath),
        sleepCount: data.dec(_f$sleepCount),
        sleepDuration: data.dec(_f$sleepDuration));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalAppInstLaunchCommon fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalAppInstLaunchCommon>(map);
  }

  static LocalAppInstLaunchCommon fromJson(String json) {
    return ensureInitialized().decodeJson<LocalAppInstLaunchCommon>(json);
  }
}

mixin LocalAppInstLaunchCommonMappable {
  String toJson() {
    return LocalAppInstLaunchCommonMapper.ensureInitialized()
        .encodeJson<LocalAppInstLaunchCommon>(this as LocalAppInstLaunchCommon);
  }

  Map<String, dynamic> toMap() {
    return LocalAppInstLaunchCommonMapper.ensureInitialized()
        .encodeMap<LocalAppInstLaunchCommon>(this as LocalAppInstLaunchCommon);
  }

  LocalAppInstLaunchCommonCopyWith<LocalAppInstLaunchCommon,
          LocalAppInstLaunchCommon, LocalAppInstLaunchCommon>
      get copyWith => _LocalAppInstLaunchCommonCopyWithImpl(
          this as LocalAppInstLaunchCommon, $identity, $identity);
  @override
  String toString() {
    return LocalAppInstLaunchCommonMapper.ensureInitialized()
        .stringifyValue(this as LocalAppInstLaunchCommon);
  }

  @override
  bool operator ==(Object other) {
    return LocalAppInstLaunchCommonMapper.ensureInitialized()
        .equalsValue(this as LocalAppInstLaunchCommon, other);
  }

  @override
  int get hashCode {
    return LocalAppInstLaunchCommonMapper.ensureInitialized()
        .hashValue(this as LocalAppInstLaunchCommon);
  }
}

extension LocalAppInstLaunchCommonValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalAppInstLaunchCommon, $Out> {
  LocalAppInstLaunchCommonCopyWith<$R, LocalAppInstLaunchCommon, $Out>
      get $asLocalAppInstLaunchCommon => $base
          .as((v, t, t2) => _LocalAppInstLaunchCommonCopyWithImpl(v, t, t2));
}

abstract class LocalAppInstLaunchCommonCopyWith<
    $R,
    $In extends LocalAppInstLaunchCommon,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? launcherPath,
      String? workingDir,
      bool? advancedTracing,
      String? processName,
      String? processPath,
      int? sleepCount,
      int? sleepDuration});
  LocalAppInstLaunchCommonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalAppInstLaunchCommonCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalAppInstLaunchCommon, $Out>
    implements
        LocalAppInstLaunchCommonCopyWith<$R, LocalAppInstLaunchCommon, $Out> {
  _LocalAppInstLaunchCommonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalAppInstLaunchCommon> $mapper =
      LocalAppInstLaunchCommonMapper.ensureInitialized();
  @override
  $R call(
          {String? launcherPath,
          Object? workingDir = $none,
          bool? advancedTracing,
          Object? processName = $none,
          Object? processPath = $none,
          Object? sleepCount = $none,
          Object? sleepDuration = $none}) =>
      $apply(FieldCopyWithData({
        if (launcherPath != null) #launcherPath: launcherPath,
        if (workingDir != $none) #workingDir: workingDir,
        if (advancedTracing != null) #advancedTracing: advancedTracing,
        if (processName != $none) #processName: processName,
        if (processPath != $none) #processPath: processPath,
        if (sleepCount != $none) #sleepCount: sleepCount,
        if (sleepDuration != $none) #sleepDuration: sleepDuration
      }));
  @override
  LocalAppInstLaunchCommon $make(CopyWithData data) => LocalAppInstLaunchCommon(
      launcherPath: data.get(#launcherPath, or: $value.launcherPath),
      workingDir: data.get(#workingDir, or: $value.workingDir),
      advancedTracing: data.get(#advancedTracing, or: $value.advancedTracing),
      processName: data.get(#processName, or: $value.processName),
      processPath: data.get(#processPath, or: $value.processPath),
      sleepCount: data.get(#sleepCount, or: $value.sleepCount),
      sleepDuration: data.get(#sleepDuration, or: $value.sleepDuration));

  @override
  LocalAppInstLaunchCommonCopyWith<$R2, LocalAppInstLaunchCommon, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalAppInstLaunchCommonCopyWithImpl($value, $cast, t);
}

class LocalAppInstLaunchSteamMapper
    extends ClassMapperBase<LocalAppInstLaunchSteam> {
  LocalAppInstLaunchSteamMapper._();

  static LocalAppInstLaunchSteamMapper? _instance;
  static LocalAppInstLaunchSteamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = LocalAppInstLaunchSteamMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalAppInstLaunchSteam';

  static String _$steamAppID(LocalAppInstLaunchSteam v) => v.steamAppID;
  static const Field<LocalAppInstLaunchSteam, String> _f$steamAppID =
      Field('steamAppID', _$steamAppID);
  static String? _$launchOptions(LocalAppInstLaunchSteam v) => v.launchOptions;
  static const Field<LocalAppInstLaunchSteam, String> _f$launchOptions =
      Field('launchOptions', _$launchOptions, opt: true);

  @override
  final MappableFields<LocalAppInstLaunchSteam> fields = const {
    #steamAppID: _f$steamAppID,
    #launchOptions: _f$launchOptions,
  };

  static LocalAppInstLaunchSteam _instantiate(DecodingData data) {
    return LocalAppInstLaunchSteam(
        steamAppID: data.dec(_f$steamAppID),
        launchOptions: data.dec(_f$launchOptions));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalAppInstLaunchSteam fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalAppInstLaunchSteam>(map);
  }

  static LocalAppInstLaunchSteam fromJson(String json) {
    return ensureInitialized().decodeJson<LocalAppInstLaunchSteam>(json);
  }
}

mixin LocalAppInstLaunchSteamMappable {
  String toJson() {
    return LocalAppInstLaunchSteamMapper.ensureInitialized()
        .encodeJson<LocalAppInstLaunchSteam>(this as LocalAppInstLaunchSteam);
  }

  Map<String, dynamic> toMap() {
    return LocalAppInstLaunchSteamMapper.ensureInitialized()
        .encodeMap<LocalAppInstLaunchSteam>(this as LocalAppInstLaunchSteam);
  }

  LocalAppInstLaunchSteamCopyWith<LocalAppInstLaunchSteam,
          LocalAppInstLaunchSteam, LocalAppInstLaunchSteam>
      get copyWith => _LocalAppInstLaunchSteamCopyWithImpl(
          this as LocalAppInstLaunchSteam, $identity, $identity);
  @override
  String toString() {
    return LocalAppInstLaunchSteamMapper.ensureInitialized()
        .stringifyValue(this as LocalAppInstLaunchSteam);
  }

  @override
  bool operator ==(Object other) {
    return LocalAppInstLaunchSteamMapper.ensureInitialized()
        .equalsValue(this as LocalAppInstLaunchSteam, other);
  }

  @override
  int get hashCode {
    return LocalAppInstLaunchSteamMapper.ensureInitialized()
        .hashValue(this as LocalAppInstLaunchSteam);
  }
}

extension LocalAppInstLaunchSteamValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalAppInstLaunchSteam, $Out> {
  LocalAppInstLaunchSteamCopyWith<$R, LocalAppInstLaunchSteam, $Out>
      get $asLocalAppInstLaunchSteam => $base
          .as((v, t, t2) => _LocalAppInstLaunchSteamCopyWithImpl(v, t, t2));
}

abstract class LocalAppInstLaunchSteamCopyWith<
    $R,
    $In extends LocalAppInstLaunchSteam,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? steamAppID, String? launchOptions});
  LocalAppInstLaunchSteamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalAppInstLaunchSteamCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalAppInstLaunchSteam, $Out>
    implements
        LocalAppInstLaunchSteamCopyWith<$R, LocalAppInstLaunchSteam, $Out> {
  _LocalAppInstLaunchSteamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalAppInstLaunchSteam> $mapper =
      LocalAppInstLaunchSteamMapper.ensureInitialized();
  @override
  $R call({String? steamAppID, Object? launchOptions = $none}) =>
      $apply(FieldCopyWithData({
        if (steamAppID != null) #steamAppID: steamAppID,
        if (launchOptions != $none) #launchOptions: launchOptions
      }));
  @override
  LocalAppInstLaunchSteam $make(CopyWithData data) => LocalAppInstLaunchSteam(
      steamAppID: data.get(#steamAppID, or: $value.steamAppID),
      launchOptions: data.get(#launchOptions, or: $value.launchOptions));

  @override
  LocalAppInstLaunchSteamCopyWith<$R2, LocalAppInstLaunchSteam, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalAppInstLaunchSteamCopyWithImpl($value, $cast, t);
}
