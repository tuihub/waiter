// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_common_app_scan.dart';

class LocalCommonAppScanMapper extends ClassMapperBase<LocalCommonAppScan> {
  LocalCommonAppScanMapper._();

  static LocalCommonAppScanMapper? _instance;
  static LocalCommonAppScanMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalCommonAppScanMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalCommonAppScan';

  static String _$uuid(LocalCommonAppScan v) => v.uuid;
  static const Field<LocalCommonAppScan, String> _f$uuid =
      Field('uuid', _$uuid);
  static String _$basePath(LocalCommonAppScan v) => v.basePath;
  static const Field<LocalCommonAppScan, String> _f$basePath =
      Field('basePath', _$basePath);
  static bool _$enableAutoScan(LocalCommonAppScan v) => v.enableAutoScan;
  static const Field<LocalCommonAppScan, bool> _f$enableAutoScan =
      Field('enableAutoScan', _$enableAutoScan);
  static List<String> _$excludeDirectoryMatchers(LocalCommonAppScan v) =>
      v.excludeDirectoryMatchers;
  static const Field<LocalCommonAppScan, List<String>>
      _f$excludeDirectoryMatchers =
      Field('excludeDirectoryMatchers', _$excludeDirectoryMatchers);
  static int _$minInstallDirDepth(LocalCommonAppScan v) => v.minInstallDirDepth;
  static const Field<LocalCommonAppScan, int> _f$minInstallDirDepth =
      Field('minInstallDirDepth', _$minInstallDirDepth);
  static int _$maxInstallDirDepth(LocalCommonAppScan v) => v.maxInstallDirDepth;
  static const Field<LocalCommonAppScan, int> _f$maxInstallDirDepth =
      Field('maxInstallDirDepth', _$maxInstallDirDepth);
  static List<LocalCommonAppScanPathFieldMatcher> _$pathFieldMatcher(
          LocalCommonAppScan v) =>
      v.pathFieldMatcher;
  static const Field<LocalCommonAppScan,
          List<LocalCommonAppScanPathFieldMatcher>> _f$pathFieldMatcher =
      Field('pathFieldMatcher', _$pathFieldMatcher);
  static LocalCommonAppScanPathFieldMatcherAlignment
      _$pathFieldMatcherAlignment(LocalCommonAppScan v) =>
          v.pathFieldMatcherAlignment;
  static const Field<LocalCommonAppScan,
          LocalCommonAppScanPathFieldMatcherAlignment>
      _f$pathFieldMatcherAlignment =
      Field('pathFieldMatcherAlignment', _$pathFieldMatcherAlignment);
  static List<String> _$includeExecutableMatchers(LocalCommonAppScan v) =>
      v.includeExecutableMatchers;
  static const Field<LocalCommonAppScan, List<String>>
      _f$includeExecutableMatchers =
      Field('includeExecutableMatchers', _$includeExecutableMatchers);
  static List<String> _$excludeExecutableMatchers(LocalCommonAppScan v) =>
      v.excludeExecutableMatchers;
  static const Field<LocalCommonAppScan, List<String>>
      _f$excludeExecutableMatchers =
      Field('excludeExecutableMatchers', _$excludeExecutableMatchers);
  static int _$minExecutableDepth(LocalCommonAppScan v) => v.minExecutableDepth;
  static const Field<LocalCommonAppScan, int> _f$minExecutableDepth =
      Field('minExecutableDepth', _$minExecutableDepth);
  static int _$maxExecutableDepth(LocalCommonAppScan v) => v.maxExecutableDepth;
  static const Field<LocalCommonAppScan, int> _f$maxExecutableDepth =
      Field('maxExecutableDepth', _$maxExecutableDepth);

  @override
  final MappableFields<LocalCommonAppScan> fields = const {
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

  static LocalCommonAppScan _instantiate(DecodingData data) {
    return LocalCommonAppScan(
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

  static LocalCommonAppScan fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalCommonAppScan>(map);
  }

  static LocalCommonAppScan fromJson(String json) {
    return ensureInitialized().decodeJson<LocalCommonAppScan>(json);
  }
}

mixin LocalCommonAppScanMappable {
  String toJson() {
    return LocalCommonAppScanMapper.ensureInitialized()
        .encodeJson<LocalCommonAppScan>(this as LocalCommonAppScan);
  }

  Map<String, dynamic> toMap() {
    return LocalCommonAppScanMapper.ensureInitialized()
        .encodeMap<LocalCommonAppScan>(this as LocalCommonAppScan);
  }

  LocalCommonAppScanCopyWith<LocalCommonAppScan, LocalCommonAppScan,
          LocalCommonAppScan>
      get copyWith => _LocalCommonAppScanCopyWithImpl(
          this as LocalCommonAppScan, $identity, $identity);
  @override
  String toString() {
    return LocalCommonAppScanMapper.ensureInitialized()
        .stringifyValue(this as LocalCommonAppScan);
  }

  @override
  bool operator ==(Object other) {
    return LocalCommonAppScanMapper.ensureInitialized()
        .equalsValue(this as LocalCommonAppScan, other);
  }

  @override
  int get hashCode {
    return LocalCommonAppScanMapper.ensureInitialized()
        .hashValue(this as LocalCommonAppScan);
  }
}

extension LocalCommonAppScanValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalCommonAppScan, $Out> {
  LocalCommonAppScanCopyWith<$R, LocalCommonAppScan, $Out>
      get $asLocalCommonAppScan =>
          $base.as((v, t, t2) => _LocalCommonAppScanCopyWithImpl(v, t, t2));
}

abstract class LocalCommonAppScanCopyWith<$R, $In extends LocalCommonAppScan,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get excludeDirectoryMatchers;
  ListCopyWith<
      $R,
      LocalCommonAppScanPathFieldMatcher,
      ObjectCopyWith<$R, LocalCommonAppScanPathFieldMatcher,
          LocalCommonAppScanPathFieldMatcher>> get pathFieldMatcher;
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
      List<LocalCommonAppScanPathFieldMatcher>? pathFieldMatcher,
      LocalCommonAppScanPathFieldMatcherAlignment? pathFieldMatcherAlignment,
      List<String>? includeExecutableMatchers,
      List<String>? excludeExecutableMatchers,
      int? minExecutableDepth,
      int? maxExecutableDepth});
  LocalCommonAppScanCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalCommonAppScanCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalCommonAppScan, $Out>
    implements LocalCommonAppScanCopyWith<$R, LocalCommonAppScan, $Out> {
  _LocalCommonAppScanCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalCommonAppScan> $mapper =
      LocalCommonAppScanMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get excludeDirectoryMatchers => ListCopyWith(
          $value.excludeDirectoryMatchers,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(excludeDirectoryMatchers: v));
  @override
  ListCopyWith<
      $R,
      LocalCommonAppScanPathFieldMatcher,
      ObjectCopyWith<$R, LocalCommonAppScanPathFieldMatcher,
          LocalCommonAppScanPathFieldMatcher>> get pathFieldMatcher =>
      ListCopyWith(
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
          List<LocalCommonAppScanPathFieldMatcher>? pathFieldMatcher,
          LocalCommonAppScanPathFieldMatcherAlignment?
              pathFieldMatcherAlignment,
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
  LocalCommonAppScan $make(CopyWithData data) => LocalCommonAppScan(
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
  LocalCommonAppScanCopyWith<$R2, LocalCommonAppScan, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalCommonAppScanCopyWithImpl($value, $cast, t);
}
