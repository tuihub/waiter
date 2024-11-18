// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class CommonAppScanMapper extends ClassMapperBase<CommonAppScan> {
  CommonAppScanMapper._();

  static CommonAppScanMapper? _instance;
  static CommonAppScanMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommonAppScanMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommonAppScan';

  static String _$uuid(CommonAppScan v) => v.uuid;
  static const Field<CommonAppScan, String> _f$uuid = Field('uuid', _$uuid);
  static String _$basePath(CommonAppScan v) => v.basePath;
  static const Field<CommonAppScan, String> _f$basePath =
      Field('basePath', _$basePath);
  static bool _$enableAutoScan(CommonAppScan v) => v.enableAutoScan;
  static const Field<CommonAppScan, bool> _f$enableAutoScan =
      Field('enableAutoScan', _$enableAutoScan, opt: true, def: true);
  static List<String> _$excludeDirectoryMatchers(CommonAppScan v) =>
      v.excludeDirectoryMatchers;
  static const Field<CommonAppScan, List<String>> _f$excludeDirectoryMatchers =
      Field('excludeDirectoryMatchers', _$excludeDirectoryMatchers,
          opt: true, def: defaultCommonAppScanExcludeDirectoryMatchers);
  static int _$minInstallDirDepth(CommonAppScan v) => v.minInstallDirDepth;
  static const Field<CommonAppScan, int> _f$minInstallDirDepth =
      Field('minInstallDirDepth', _$minInstallDirDepth, opt: true, def: 1);
  static int _$maxInstallDirDepth(CommonAppScan v) => v.maxInstallDirDepth;
  static const Field<CommonAppScan, int> _f$maxInstallDirDepth =
      Field('maxInstallDirDepth', _$maxInstallDirDepth, opt: true, def: 1);
  static List<CommonAppScanPathFieldMatcher> _$pathFieldMatcher(
          CommonAppScan v) =>
      v.pathFieldMatcher;
  static const Field<CommonAppScan, List<CommonAppScanPathFieldMatcher>>
      _f$pathFieldMatcher = Field('pathFieldMatcher', _$pathFieldMatcher,
          opt: true,
          def: const [
        CommonAppScanPathFieldMatcher.name,
        CommonAppScanPathFieldMatcher.ignore
      ]);
  static CommonAppScanPathFieldMatcherAlignment _$pathFieldMatcherAlignment(
          CommonAppScan v) =>
      v.pathFieldMatcherAlignment;
  static const Field<CommonAppScan, CommonAppScanPathFieldMatcherAlignment>
      _f$pathFieldMatcherAlignment = Field(
          'pathFieldMatcherAlignment', _$pathFieldMatcherAlignment,
          opt: true, def: CommonAppScanPathFieldMatcherAlignment.left);
  static List<String> _$includeExecutableMatchers(CommonAppScan v) =>
      v.includeExecutableMatchers;
  static const Field<CommonAppScan, List<String>> _f$includeExecutableMatchers =
      Field('includeExecutableMatchers', _$includeExecutableMatchers,
          opt: true, def: defaultCommonAppScanTargetFileMatchers);
  static List<String> _$excludeExecutableMatchers(CommonAppScan v) =>
      v.excludeExecutableMatchers;
  static const Field<CommonAppScan, List<String>> _f$excludeExecutableMatchers =
      Field('excludeExecutableMatchers', _$excludeExecutableMatchers,
          opt: true, def: defaultCommonAppScanExcludeFileMatchers);
  static int _$minExecutableDepth(CommonAppScan v) => v.minExecutableDepth;
  static const Field<CommonAppScan, int> _f$minExecutableDepth =
      Field('minExecutableDepth', _$minExecutableDepth, opt: true, def: 1);
  static int _$maxExecutableDepth(CommonAppScan v) => v.maxExecutableDepth;
  static const Field<CommonAppScan, int> _f$maxExecutableDepth =
      Field('maxExecutableDepth', _$maxExecutableDepth, opt: true, def: 2);

  @override
  final MappableFields<CommonAppScan> fields = const {
    #uuid: _f$uuid,
    #basePath: _f$basePath,
    #enableAutoScan: _f$enableAutoScan,
    #excludeDirectoryMatchers: _f$excludeDirectoryMatchers,
    #minInstallDirDepth: _f$minInstallDirDepth,
    #maxInstallDirDepth: _f$maxInstallDirDepth,
    #pathFieldMatcher: _f$pathFieldMatcher,
    #pathFieldMatcherAlignment: _f$pathFieldMatcherAlignment,
    #includeExecutableMatchers: _f$includeExecutableMatchers,
    #excludeExecutableMatchers: _f$excludeExecutableMatchers,
    #minExecutableDepth: _f$minExecutableDepth,
    #maxExecutableDepth: _f$maxExecutableDepth,
  };

  static CommonAppScan _instantiate(DecodingData data) {
    return CommonAppScan(
        uuid: data.dec(_f$uuid),
        basePath: data.dec(_f$basePath),
        enableAutoScan: data.dec(_f$enableAutoScan),
        excludeDirectoryMatchers: data.dec(_f$excludeDirectoryMatchers),
        minInstallDirDepth: data.dec(_f$minInstallDirDepth),
        maxInstallDirDepth: data.dec(_f$maxInstallDirDepth),
        pathFieldMatcher: data.dec(_f$pathFieldMatcher),
        pathFieldMatcherAlignment: data.dec(_f$pathFieldMatcherAlignment),
        includeExecutableMatchers: data.dec(_f$includeExecutableMatchers),
        excludeExecutableMatchers: data.dec(_f$excludeExecutableMatchers),
        minExecutableDepth: data.dec(_f$minExecutableDepth),
        maxExecutableDepth: data.dec(_f$maxExecutableDepth));
  }

  @override
  final Function instantiate = _instantiate;

  static CommonAppScan fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommonAppScan>(map);
  }

  static CommonAppScan fromJson(String json) {
    return ensureInitialized().decodeJson<CommonAppScan>(json);
  }
}

mixin CommonAppScanMappable {
  String toJson() {
    return CommonAppScanMapper.ensureInitialized()
        .encodeJson<CommonAppScan>(this as CommonAppScan);
  }

  Map<String, dynamic> toMap() {
    return CommonAppScanMapper.ensureInitialized()
        .encodeMap<CommonAppScan>(this as CommonAppScan);
  }

  CommonAppScanCopyWith<CommonAppScan, CommonAppScan, CommonAppScan>
      get copyWith => _CommonAppScanCopyWithImpl(
          this as CommonAppScan, $identity, $identity);
  @override
  String toString() {
    return CommonAppScanMapper.ensureInitialized()
        .stringifyValue(this as CommonAppScan);
  }

  @override
  bool operator ==(Object other) {
    return CommonAppScanMapper.ensureInitialized()
        .equalsValue(this as CommonAppScan, other);
  }

  @override
  int get hashCode {
    return CommonAppScanMapper.ensureInitialized()
        .hashValue(this as CommonAppScan);
  }
}

extension CommonAppScanValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommonAppScan, $Out> {
  CommonAppScanCopyWith<$R, CommonAppScan, $Out> get $asCommonAppScan =>
      $base.as((v, t, t2) => _CommonAppScanCopyWithImpl(v, t, t2));
}

abstract class CommonAppScanCopyWith<$R, $In extends CommonAppScan, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get excludeDirectoryMatchers;
  ListCopyWith<
      $R,
      CommonAppScanPathFieldMatcher,
      ObjectCopyWith<$R, CommonAppScanPathFieldMatcher,
          CommonAppScanPathFieldMatcher>> get pathFieldMatcher;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get includeExecutableMatchers;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get excludeExecutableMatchers;
  $R call(
      {String? uuid,
      String? basePath,
      bool? enableAutoScan,
      List<String>? excludeDirectoryMatchers,
      int? minInstallDirDepth,
      int? maxInstallDirDepth,
      List<CommonAppScanPathFieldMatcher>? pathFieldMatcher,
      CommonAppScanPathFieldMatcherAlignment? pathFieldMatcherAlignment,
      List<String>? includeExecutableMatchers,
      List<String>? excludeExecutableMatchers,
      int? minExecutableDepth,
      int? maxExecutableDepth});
  CommonAppScanCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommonAppScanCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommonAppScan, $Out>
    implements CommonAppScanCopyWith<$R, CommonAppScan, $Out> {
  _CommonAppScanCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommonAppScan> $mapper =
      CommonAppScanMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get excludeDirectoryMatchers => ListCopyWith(
          $value.excludeDirectoryMatchers,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(excludeDirectoryMatchers: v));
  @override
  ListCopyWith<
      $R,
      CommonAppScanPathFieldMatcher,
      ObjectCopyWith<$R, CommonAppScanPathFieldMatcher,
          CommonAppScanPathFieldMatcher>> get pathFieldMatcher => ListCopyWith(
      $value.pathFieldMatcher,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(pathFieldMatcher: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get includeExecutableMatchers => ListCopyWith(
          $value.includeExecutableMatchers,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(includeExecutableMatchers: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get excludeExecutableMatchers => ListCopyWith(
          $value.excludeExecutableMatchers,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(excludeExecutableMatchers: v));
  @override
  $R call(
          {String? uuid,
          String? basePath,
          bool? enableAutoScan,
          List<String>? excludeDirectoryMatchers,
          int? minInstallDirDepth,
          int? maxInstallDirDepth,
          List<CommonAppScanPathFieldMatcher>? pathFieldMatcher,
          CommonAppScanPathFieldMatcherAlignment? pathFieldMatcherAlignment,
          List<String>? includeExecutableMatchers,
          List<String>? excludeExecutableMatchers,
          int? minExecutableDepth,
          int? maxExecutableDepth}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (basePath != null) #basePath: basePath,
        if (enableAutoScan != null) #enableAutoScan: enableAutoScan,
        if (excludeDirectoryMatchers != null)
          #excludeDirectoryMatchers: excludeDirectoryMatchers,
        if (minInstallDirDepth != null) #minInstallDirDepth: minInstallDirDepth,
        if (maxInstallDirDepth != null) #maxInstallDirDepth: maxInstallDirDepth,
        if (pathFieldMatcher != null) #pathFieldMatcher: pathFieldMatcher,
        if (pathFieldMatcherAlignment != null)
          #pathFieldMatcherAlignment: pathFieldMatcherAlignment,
        if (includeExecutableMatchers != null)
          #includeExecutableMatchers: includeExecutableMatchers,
        if (excludeExecutableMatchers != null)
          #excludeExecutableMatchers: excludeExecutableMatchers,
        if (minExecutableDepth != null) #minExecutableDepth: minExecutableDepth,
        if (maxExecutableDepth != null) #maxExecutableDepth: maxExecutableDepth
      }));
  @override
  CommonAppScan $make(CopyWithData data) => CommonAppScan(
      uuid: data.get(#uuid, or: $value.uuid),
      basePath: data.get(#basePath, or: $value.basePath),
      enableAutoScan: data.get(#enableAutoScan, or: $value.enableAutoScan),
      excludeDirectoryMatchers: data.get(#excludeDirectoryMatchers,
          or: $value.excludeDirectoryMatchers),
      minInstallDirDepth:
          data.get(#minInstallDirDepth, or: $value.minInstallDirDepth),
      maxInstallDirDepth:
          data.get(#maxInstallDirDepth, or: $value.maxInstallDirDepth),
      pathFieldMatcher:
          data.get(#pathFieldMatcher, or: $value.pathFieldMatcher),
      pathFieldMatcherAlignment: data.get(#pathFieldMatcherAlignment,
          or: $value.pathFieldMatcherAlignment),
      includeExecutableMatchers: data.get(#includeExecutableMatchers,
          or: $value.includeExecutableMatchers),
      excludeExecutableMatchers: data.get(#excludeExecutableMatchers,
          or: $value.excludeExecutableMatchers),
      minExecutableDepth:
          data.get(#minExecutableDepth, or: $value.minExecutableDepth),
      maxExecutableDepth:
          data.get(#maxExecutableDepth, or: $value.maxExecutableDepth));

  @override
  CommonAppScanCopyWith<$R2, CommonAppScan, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommonAppScanCopyWithImpl($value, $cast, t);
}

class CommonAppFolderScanResultMapper
    extends ClassMapperBase<CommonAppFolderScanResult> {
  CommonAppFolderScanResultMapper._();

  static CommonAppFolderScanResultMapper? _instance;
  static CommonAppFolderScanResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CommonAppFolderScanResultMapper._());
      InstalledCommonAppsMapper.ensureInitialized();
      CommonAppFolderScanResultDetailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommonAppFolderScanResult';

  static List<InstalledCommonApps> _$installedApps(
          CommonAppFolderScanResult v) =>
      v.installedApps;
  static const Field<CommonAppFolderScanResult, List<InstalledCommonApps>>
      _f$installedApps = Field('installedApps', _$installedApps);
  static List<CommonAppFolderScanResultDetail> _$details(
          CommonAppFolderScanResult v) =>
      v.details;
  static const Field<CommonAppFolderScanResult,
          List<CommonAppFolderScanResultDetail>> _f$details =
      Field('details', _$details);
  static CommonAppFolderScanResultCode _$code(CommonAppFolderScanResult v) =>
      v.code;
  static const Field<CommonAppFolderScanResult, CommonAppFolderScanResultCode>
      _f$code = Field('code', _$code);
  static String? _$msg(CommonAppFolderScanResult v) => v.msg;
  static const Field<CommonAppFolderScanResult, String> _f$msg =
      Field('msg', _$msg, opt: true);

  @override
  final MappableFields<CommonAppFolderScanResult> fields = const {
    #installedApps: _f$installedApps,
    #details: _f$details,
    #code: _f$code,
    #msg: _f$msg,
  };

  static CommonAppFolderScanResult _instantiate(DecodingData data) {
    return CommonAppFolderScanResult(
        installedApps: data.dec(_f$installedApps),
        details: data.dec(_f$details),
        code: data.dec(_f$code),
        msg: data.dec(_f$msg));
  }

  @override
  final Function instantiate = _instantiate;

  static CommonAppFolderScanResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommonAppFolderScanResult>(map);
  }

  static CommonAppFolderScanResult fromJson(String json) {
    return ensureInitialized().decodeJson<CommonAppFolderScanResult>(json);
  }
}

mixin CommonAppFolderScanResultMappable {
  String toJson() {
    return CommonAppFolderScanResultMapper.ensureInitialized()
        .encodeJson<CommonAppFolderScanResult>(
            this as CommonAppFolderScanResult);
  }

  Map<String, dynamic> toMap() {
    return CommonAppFolderScanResultMapper.ensureInitialized()
        .encodeMap<CommonAppFolderScanResult>(
            this as CommonAppFolderScanResult);
  }

  CommonAppFolderScanResultCopyWith<CommonAppFolderScanResult,
          CommonAppFolderScanResult, CommonAppFolderScanResult>
      get copyWith => _CommonAppFolderScanResultCopyWithImpl(
          this as CommonAppFolderScanResult, $identity, $identity);
  @override
  String toString() {
    return CommonAppFolderScanResultMapper.ensureInitialized()
        .stringifyValue(this as CommonAppFolderScanResult);
  }

  @override
  bool operator ==(Object other) {
    return CommonAppFolderScanResultMapper.ensureInitialized()
        .equalsValue(this as CommonAppFolderScanResult, other);
  }

  @override
  int get hashCode {
    return CommonAppFolderScanResultMapper.ensureInitialized()
        .hashValue(this as CommonAppFolderScanResult);
  }
}

extension CommonAppFolderScanResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommonAppFolderScanResult, $Out> {
  CommonAppFolderScanResultCopyWith<$R, CommonAppFolderScanResult, $Out>
      get $asCommonAppFolderScanResult => $base
          .as((v, t, t2) => _CommonAppFolderScanResultCopyWithImpl(v, t, t2));
}

abstract class CommonAppFolderScanResultCopyWith<
    $R,
    $In extends CommonAppFolderScanResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      InstalledCommonApps,
      InstalledCommonAppsCopyWith<$R, InstalledCommonApps,
          InstalledCommonApps>> get installedApps;
  ListCopyWith<
      $R,
      CommonAppFolderScanResultDetail,
      CommonAppFolderScanResultDetailCopyWith<
          $R,
          CommonAppFolderScanResultDetail,
          CommonAppFolderScanResultDetail>> get details;
  $R call(
      {List<InstalledCommonApps>? installedApps,
      List<CommonAppFolderScanResultDetail>? details,
      CommonAppFolderScanResultCode? code,
      String? msg});
  CommonAppFolderScanResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommonAppFolderScanResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommonAppFolderScanResult, $Out>
    implements
        CommonAppFolderScanResultCopyWith<$R, CommonAppFolderScanResult, $Out> {
  _CommonAppFolderScanResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommonAppFolderScanResult> $mapper =
      CommonAppFolderScanResultMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      InstalledCommonApps,
      InstalledCommonAppsCopyWith<$R, InstalledCommonApps,
          InstalledCommonApps>> get installedApps => ListCopyWith(
      $value.installedApps,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(installedApps: v));
  @override
  ListCopyWith<
      $R,
      CommonAppFolderScanResultDetail,
      CommonAppFolderScanResultDetailCopyWith<
          $R,
          CommonAppFolderScanResultDetail,
          CommonAppFolderScanResultDetail>> get details => ListCopyWith(
      $value.details, (v, t) => v.copyWith.$chain(t), (v) => call(details: v));
  @override
  $R call(
          {List<InstalledCommonApps>? installedApps,
          List<CommonAppFolderScanResultDetail>? details,
          CommonAppFolderScanResultCode? code,
          Object? msg = $none}) =>
      $apply(FieldCopyWithData({
        if (installedApps != null) #installedApps: installedApps,
        if (details != null) #details: details,
        if (code != null) #code: code,
        if (msg != $none) #msg: msg
      }));
  @override
  CommonAppFolderScanResult $make(CopyWithData data) =>
      CommonAppFolderScanResult(
          installedApps: data.get(#installedApps, or: $value.installedApps),
          details: data.get(#details, or: $value.details),
          code: data.get(#code, or: $value.code),
          msg: data.get(#msg, or: $value.msg));

  @override
  CommonAppFolderScanResultCopyWith<$R2, CommonAppFolderScanResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CommonAppFolderScanResultCopyWithImpl($value, $cast, t);
}

class InstalledCommonAppsMapper extends ClassMapperBase<InstalledCommonApps> {
  InstalledCommonAppsMapper._();

  static InstalledCommonAppsMapper? _instance;
  static InstalledCommonAppsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InstalledCommonAppsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'InstalledCommonApps';

  static String _$name(InstalledCommonApps v) => v.name;
  static const Field<InstalledCommonApps, String> _f$name =
      Field('name', _$name);
  static String _$version(InstalledCommonApps v) => v.version;
  static const Field<InstalledCommonApps, String> _f$version =
      Field('version', _$version);
  static String _$installPath(InstalledCommonApps v) => v.installPath;
  static const Field<InstalledCommonApps, String> _f$installPath =
      Field('installPath', _$installPath);
  static List<String> _$launcherPaths(InstalledCommonApps v) => v.launcherPaths;
  static const Field<InstalledCommonApps, List<String>> _f$launcherPaths =
      Field('launcherPaths', _$launcherPaths);

  @override
  final MappableFields<InstalledCommonApps> fields = const {
    #name: _f$name,
    #version: _f$version,
    #installPath: _f$installPath,
    #launcherPaths: _f$launcherPaths,
  };

  static InstalledCommonApps _instantiate(DecodingData data) {
    return InstalledCommonApps(
        name: data.dec(_f$name),
        version: data.dec(_f$version),
        installPath: data.dec(_f$installPath),
        launcherPaths: data.dec(_f$launcherPaths));
  }

  @override
  final Function instantiate = _instantiate;

  static InstalledCommonApps fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InstalledCommonApps>(map);
  }

  static InstalledCommonApps fromJson(String json) {
    return ensureInitialized().decodeJson<InstalledCommonApps>(json);
  }
}

mixin InstalledCommonAppsMappable {
  String toJson() {
    return InstalledCommonAppsMapper.ensureInitialized()
        .encodeJson<InstalledCommonApps>(this as InstalledCommonApps);
  }

  Map<String, dynamic> toMap() {
    return InstalledCommonAppsMapper.ensureInitialized()
        .encodeMap<InstalledCommonApps>(this as InstalledCommonApps);
  }

  InstalledCommonAppsCopyWith<InstalledCommonApps, InstalledCommonApps,
          InstalledCommonApps>
      get copyWith => _InstalledCommonAppsCopyWithImpl(
          this as InstalledCommonApps, $identity, $identity);
  @override
  String toString() {
    return InstalledCommonAppsMapper.ensureInitialized()
        .stringifyValue(this as InstalledCommonApps);
  }

  @override
  bool operator ==(Object other) {
    return InstalledCommonAppsMapper.ensureInitialized()
        .equalsValue(this as InstalledCommonApps, other);
  }

  @override
  int get hashCode {
    return InstalledCommonAppsMapper.ensureInitialized()
        .hashValue(this as InstalledCommonApps);
  }
}

extension InstalledCommonAppsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InstalledCommonApps, $Out> {
  InstalledCommonAppsCopyWith<$R, InstalledCommonApps, $Out>
      get $asInstalledCommonApps =>
          $base.as((v, t, t2) => _InstalledCommonAppsCopyWithImpl(v, t, t2));
}

abstract class InstalledCommonAppsCopyWith<$R, $In extends InstalledCommonApps,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get launcherPaths;
  $R call(
      {String? name,
      String? version,
      String? installPath,
      List<String>? launcherPaths});
  InstalledCommonAppsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InstalledCommonAppsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InstalledCommonApps, $Out>
    implements InstalledCommonAppsCopyWith<$R, InstalledCommonApps, $Out> {
  _InstalledCommonAppsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InstalledCommonApps> $mapper =
      InstalledCommonAppsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get launcherPaths => ListCopyWith(
          $value.launcherPaths,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(launcherPaths: v));
  @override
  $R call(
          {String? name,
          String? version,
          String? installPath,
          List<String>? launcherPaths}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (version != null) #version: version,
        if (installPath != null) #installPath: installPath,
        if (launcherPaths != null) #launcherPaths: launcherPaths
      }));
  @override
  InstalledCommonApps $make(CopyWithData data) => InstalledCommonApps(
      name: data.get(#name, or: $value.name),
      version: data.get(#version, or: $value.version),
      installPath: data.get(#installPath, or: $value.installPath),
      launcherPaths: data.get(#launcherPaths, or: $value.launcherPaths));

  @override
  InstalledCommonAppsCopyWith<$R2, InstalledCommonApps, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _InstalledCommonAppsCopyWithImpl($value, $cast, t);
}

class CommonAppFolderScanResultDetailMapper
    extends ClassMapperBase<CommonAppFolderScanResultDetail> {
  CommonAppFolderScanResultDetailMapper._();

  static CommonAppFolderScanResultDetailMapper? _instance;
  static CommonAppFolderScanResultDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CommonAppFolderScanResultDetailMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommonAppFolderScanResultDetail';

  static String _$path(CommonAppFolderScanResultDetail v) => v.path;
  static const Field<CommonAppFolderScanResultDetail, String> _f$path =
      Field('path', _$path);
  static CommonAppFolderScanEntryType _$type(
          CommonAppFolderScanResultDetail v) =>
      v.type;
  static const Field<CommonAppFolderScanResultDetail,
      CommonAppFolderScanEntryType> _f$type = Field('type', _$type);
  static CommonAppFolderScanEntryStatus _$status(
          CommonAppFolderScanResultDetail v) =>
      v.status;
  static const Field<CommonAppFolderScanResultDetail,
      CommonAppFolderScanEntryStatus> _f$status = Field('status', _$status);
  static List<CommonAppScanPathFieldMatcher> _$usedMatchers(
          CommonAppFolderScanResultDetail v) =>
      v.usedMatchers;
  static const Field<CommonAppFolderScanResultDetail,
          List<CommonAppScanPathFieldMatcher>> _f$usedMatchers =
      Field('usedMatchers', _$usedMatchers, opt: true, def: const []);

  @override
  final MappableFields<CommonAppFolderScanResultDetail> fields = const {
    #path: _f$path,
    #type: _f$type,
    #status: _f$status,
    #usedMatchers: _f$usedMatchers,
  };

  static CommonAppFolderScanResultDetail _instantiate(DecodingData data) {
    return CommonAppFolderScanResultDetail(
        path: data.dec(_f$path),
        type: data.dec(_f$type),
        status: data.dec(_f$status),
        usedMatchers: data.dec(_f$usedMatchers));
  }

  @override
  final Function instantiate = _instantiate;

  static CommonAppFolderScanResultDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommonAppFolderScanResultDetail>(map);
  }

  static CommonAppFolderScanResultDetail fromJson(String json) {
    return ensureInitialized()
        .decodeJson<CommonAppFolderScanResultDetail>(json);
  }
}

mixin CommonAppFolderScanResultDetailMappable {
  String toJson() {
    return CommonAppFolderScanResultDetailMapper.ensureInitialized()
        .encodeJson<CommonAppFolderScanResultDetail>(
            this as CommonAppFolderScanResultDetail);
  }

  Map<String, dynamic> toMap() {
    return CommonAppFolderScanResultDetailMapper.ensureInitialized()
        .encodeMap<CommonAppFolderScanResultDetail>(
            this as CommonAppFolderScanResultDetail);
  }

  CommonAppFolderScanResultDetailCopyWith<CommonAppFolderScanResultDetail,
          CommonAppFolderScanResultDetail, CommonAppFolderScanResultDetail>
      get copyWith => _CommonAppFolderScanResultDetailCopyWithImpl(
          this as CommonAppFolderScanResultDetail, $identity, $identity);
  @override
  String toString() {
    return CommonAppFolderScanResultDetailMapper.ensureInitialized()
        .stringifyValue(this as CommonAppFolderScanResultDetail);
  }

  @override
  bool operator ==(Object other) {
    return CommonAppFolderScanResultDetailMapper.ensureInitialized()
        .equalsValue(this as CommonAppFolderScanResultDetail, other);
  }

  @override
  int get hashCode {
    return CommonAppFolderScanResultDetailMapper.ensureInitialized()
        .hashValue(this as CommonAppFolderScanResultDetail);
  }
}

extension CommonAppFolderScanResultDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommonAppFolderScanResultDetail, $Out> {
  CommonAppFolderScanResultDetailCopyWith<$R, CommonAppFolderScanResultDetail,
          $Out>
      get $asCommonAppFolderScanResultDetail => $base.as(
          (v, t, t2) => _CommonAppFolderScanResultDetailCopyWithImpl(v, t, t2));
}

abstract class CommonAppFolderScanResultDetailCopyWith<
    $R,
    $In extends CommonAppFolderScanResultDetail,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      CommonAppScanPathFieldMatcher,
      ObjectCopyWith<$R, CommonAppScanPathFieldMatcher,
          CommonAppScanPathFieldMatcher>> get usedMatchers;
  $R call(
      {String? path,
      CommonAppFolderScanEntryType? type,
      CommonAppFolderScanEntryStatus? status,
      List<CommonAppScanPathFieldMatcher>? usedMatchers});
  CommonAppFolderScanResultDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommonAppFolderScanResultDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommonAppFolderScanResultDetail, $Out>
    implements
        CommonAppFolderScanResultDetailCopyWith<$R,
            CommonAppFolderScanResultDetail, $Out> {
  _CommonAppFolderScanResultDetailCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommonAppFolderScanResultDetail> $mapper =
      CommonAppFolderScanResultDetailMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      CommonAppScanPathFieldMatcher,
      ObjectCopyWith<$R, CommonAppScanPathFieldMatcher,
          CommonAppScanPathFieldMatcher>> get usedMatchers => ListCopyWith(
      $value.usedMatchers,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(usedMatchers: v));
  @override
  $R call(
          {String? path,
          CommonAppFolderScanEntryType? type,
          CommonAppFolderScanEntryStatus? status,
          List<CommonAppScanPathFieldMatcher>? usedMatchers}) =>
      $apply(FieldCopyWithData({
        if (path != null) #path: path,
        if (type != null) #type: type,
        if (status != null) #status: status,
        if (usedMatchers != null) #usedMatchers: usedMatchers
      }));
  @override
  CommonAppFolderScanResultDetail $make(CopyWithData data) =>
      CommonAppFolderScanResultDetail(
          path: data.get(#path, or: $value.path),
          type: data.get(#type, or: $value.type),
          status: data.get(#status, or: $value.status),
          usedMatchers: data.get(#usedMatchers, or: $value.usedMatchers));

  @override
  CommonAppFolderScanResultDetailCopyWith<$R2, CommonAppFolderScanResultDetail,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommonAppFolderScanResultDetailCopyWithImpl($value, $cast, t);
}
