// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gebura_model.dart';

class LibrarySettingsMapper extends ClassMapperBase<LibrarySettings> {
  LibrarySettingsMapper._();

  static LibrarySettingsMapper? _instance;
  static LibrarySettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LibrarySettingsMapper._());
      LibraryFilterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LibrarySettings';

  static LibraryFilter? _$filter(LibrarySettings v) => v.filter;
  static const Field<LibrarySettings, LibraryFilter> _f$filter =
      Field('filter', _$filter, opt: true);

  @override
  final MappableFields<LibrarySettings> fields = const {
    #filter: _f$filter,
  };

  static LibrarySettings _instantiate(DecodingData data) {
    return LibrarySettings(filter: data.dec(_f$filter));
  }

  @override
  final Function instantiate = _instantiate;

  static LibrarySettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LibrarySettings>(map);
  }

  static LibrarySettings fromJson(String json) {
    return ensureInitialized().decodeJson<LibrarySettings>(json);
  }
}

mixin LibrarySettingsMappable {
  String toJson() {
    return LibrarySettingsMapper.ensureInitialized()
        .encodeJson<LibrarySettings>(this as LibrarySettings);
  }

  Map<String, dynamic> toMap() {
    return LibrarySettingsMapper.ensureInitialized()
        .encodeMap<LibrarySettings>(this as LibrarySettings);
  }

  LibrarySettingsCopyWith<LibrarySettings, LibrarySettings, LibrarySettings>
      get copyWith => _LibrarySettingsCopyWithImpl(
          this as LibrarySettings, $identity, $identity);
  @override
  String toString() {
    return LibrarySettingsMapper.ensureInitialized()
        .stringifyValue(this as LibrarySettings);
  }

  @override
  bool operator ==(Object other) {
    return LibrarySettingsMapper.ensureInitialized()
        .equalsValue(this as LibrarySettings, other);
  }

  @override
  int get hashCode {
    return LibrarySettingsMapper.ensureInitialized()
        .hashValue(this as LibrarySettings);
  }
}

extension LibrarySettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LibrarySettings, $Out> {
  LibrarySettingsCopyWith<$R, LibrarySettings, $Out> get $asLibrarySettings =>
      $base.as((v, t, t2) => _LibrarySettingsCopyWithImpl(v, t, t2));
}

abstract class LibrarySettingsCopyWith<$R, $In extends LibrarySettings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  LibraryFilterCopyWith<$R, LibraryFilter, LibraryFilter>? get filter;
  $R call({LibraryFilter? filter});
  LibrarySettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LibrarySettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LibrarySettings, $Out>
    implements LibrarySettingsCopyWith<$R, LibrarySettings, $Out> {
  _LibrarySettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LibrarySettings> $mapper =
      LibrarySettingsMapper.ensureInitialized();
  @override
  LibraryFilterCopyWith<$R, LibraryFilter, LibraryFilter>? get filter =>
      $value.filter?.copyWith.$chain((v) => call(filter: v));
  @override
  $R call({Object? filter = $none}) =>
      $apply(FieldCopyWithData({if (filter != $none) #filter: filter}));
  @override
  LibrarySettings $make(CopyWithData data) =>
      LibrarySettings(filter: data.get(#filter, or: $value.filter));

  @override
  LibrarySettingsCopyWith<$R2, LibrarySettings, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LibrarySettingsCopyWithImpl($value, $cast, t);
}

class LibraryFilterMapper extends ClassMapperBase<LibraryFilter> {
  LibraryFilterMapper._();

  static LibraryFilterMapper? _instance;
  static LibraryFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LibraryFilterMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LibraryFilter';

  static String? _$query(LibraryFilter v) => v.query;
  static const Field<LibraryFilter, String> _f$query =
      Field('query', _$query, opt: true);

  @override
  final MappableFields<LibraryFilter> fields = const {
    #query: _f$query,
  };

  static LibraryFilter _instantiate(DecodingData data) {
    return LibraryFilter(query: data.dec(_f$query));
  }

  @override
  final Function instantiate = _instantiate;

  static LibraryFilter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LibraryFilter>(map);
  }

  static LibraryFilter fromJson(String json) {
    return ensureInitialized().decodeJson<LibraryFilter>(json);
  }
}

mixin LibraryFilterMappable {
  String toJson() {
    return LibraryFilterMapper.ensureInitialized()
        .encodeJson<LibraryFilter>(this as LibraryFilter);
  }

  Map<String, dynamic> toMap() {
    return LibraryFilterMapper.ensureInitialized()
        .encodeMap<LibraryFilter>(this as LibraryFilter);
  }

  LibraryFilterCopyWith<LibraryFilter, LibraryFilter, LibraryFilter>
      get copyWith => _LibraryFilterCopyWithImpl(
          this as LibraryFilter, $identity, $identity);
  @override
  String toString() {
    return LibraryFilterMapper.ensureInitialized()
        .stringifyValue(this as LibraryFilter);
  }

  @override
  bool operator ==(Object other) {
    return LibraryFilterMapper.ensureInitialized()
        .equalsValue(this as LibraryFilter, other);
  }

  @override
  int get hashCode {
    return LibraryFilterMapper.ensureInitialized()
        .hashValue(this as LibraryFilter);
  }
}

extension LibraryFilterValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LibraryFilter, $Out> {
  LibraryFilterCopyWith<$R, LibraryFilter, $Out> get $asLibraryFilter =>
      $base.as((v, t, t2) => _LibraryFilterCopyWithImpl(v, t, t2));
}

abstract class LibraryFilterCopyWith<$R, $In extends LibraryFilter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? query});
  LibraryFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LibraryFilterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LibraryFilter, $Out>
    implements LibraryFilterCopyWith<$R, LibraryFilter, $Out> {
  _LibraryFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LibraryFilter> $mapper =
      LibraryFilterMapper.ensureInitialized();
  @override
  $R call({Object? query = $none}) =>
      $apply(FieldCopyWithData({if (query != $none) #query: query}));
  @override
  LibraryFilter $make(CopyWithData data) =>
      LibraryFilter(query: data.get(#query, or: $value.query));

  @override
  LibraryFilterCopyWith<$R2, LibraryFilter, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LibraryFilterCopyWithImpl($value, $cast, t);
}

class LibraryListItemMapper extends ClassMapperBase<LibraryListItem> {
  LibraryListItemMapper._();

  static LibraryListItemMapper? _instance;
  static LibraryListItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LibraryListItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LibraryListItem';

  static String _$uuid(LibraryListItem v) => v.uuid;
  static const Field<LibraryListItem, String> _f$uuid = Field('uuid', _$uuid);
  static String _$name(LibraryListItem v) => v.name;
  static const Field<LibraryListItem, String> _f$name = Field('name', _$name);
  static String? _$iconImagePath(LibraryListItem v) => v.iconImagePath;
  static const Field<LibraryListItem, String> _f$iconImagePath =
      Field('iconImagePath', _$iconImagePath, opt: true);
  static String? _$coverImagePath(LibraryListItem v) => v.coverImagePath;
  static const Field<LibraryListItem, String> _f$coverImagePath =
      Field('coverImagePath', _$coverImagePath, opt: true);
  static String? _$backgroundImagePath(LibraryListItem v) =>
      v.backgroundImagePath;
  static const Field<LibraryListItem, String> _f$backgroundImagePath =
      Field('backgroundImagePath', _$backgroundImagePath, opt: true);
  static bool _$filtered(LibraryListItem v) => v.filtered;
  static const Field<LibraryListItem, bool> _f$filtered =
      Field('filtered', _$filtered, opt: true, def: false);

  @override
  final MappableFields<LibraryListItem> fields = const {
    #uuid: _f$uuid,
    #name: _f$name,
    #iconImagePath: _f$iconImagePath,
    #coverImagePath: _f$coverImagePath,
    #backgroundImagePath: _f$backgroundImagePath,
    #filtered: _f$filtered,
  };

  static LibraryListItem _instantiate(DecodingData data) {
    return LibraryListItem(
        uuid: data.dec(_f$uuid),
        name: data.dec(_f$name),
        iconImagePath: data.dec(_f$iconImagePath),
        coverImagePath: data.dec(_f$coverImagePath),
        backgroundImagePath: data.dec(_f$backgroundImagePath),
        filtered: data.dec(_f$filtered));
  }

  @override
  final Function instantiate = _instantiate;

  static LibraryListItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LibraryListItem>(map);
  }

  static LibraryListItem fromJson(String json) {
    return ensureInitialized().decodeJson<LibraryListItem>(json);
  }
}

mixin LibraryListItemMappable {
  String toJson() {
    return LibraryListItemMapper.ensureInitialized()
        .encodeJson<LibraryListItem>(this as LibraryListItem);
  }

  Map<String, dynamic> toMap() {
    return LibraryListItemMapper.ensureInitialized()
        .encodeMap<LibraryListItem>(this as LibraryListItem);
  }

  LibraryListItemCopyWith<LibraryListItem, LibraryListItem, LibraryListItem>
      get copyWith => _LibraryListItemCopyWithImpl(
          this as LibraryListItem, $identity, $identity);
  @override
  String toString() {
    return LibraryListItemMapper.ensureInitialized()
        .stringifyValue(this as LibraryListItem);
  }

  @override
  bool operator ==(Object other) {
    return LibraryListItemMapper.ensureInitialized()
        .equalsValue(this as LibraryListItem, other);
  }

  @override
  int get hashCode {
    return LibraryListItemMapper.ensureInitialized()
        .hashValue(this as LibraryListItem);
  }
}

extension LibraryListItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LibraryListItem, $Out> {
  LibraryListItemCopyWith<$R, LibraryListItem, $Out> get $asLibraryListItem =>
      $base.as((v, t, t2) => _LibraryListItemCopyWithImpl(v, t, t2));
}

abstract class LibraryListItemCopyWith<$R, $In extends LibraryListItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? uuid,
      String? name,
      String? iconImagePath,
      String? coverImagePath,
      String? backgroundImagePath,
      bool? filtered});
  LibraryListItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LibraryListItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LibraryListItem, $Out>
    implements LibraryListItemCopyWith<$R, LibraryListItem, $Out> {
  _LibraryListItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LibraryListItem> $mapper =
      LibraryListItemMapper.ensureInitialized();
  @override
  $R call(
          {String? uuid,
          String? name,
          Object? iconImagePath = $none,
          Object? coverImagePath = $none,
          Object? backgroundImagePath = $none,
          bool? filtered}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (name != null) #name: name,
        if (iconImagePath != $none) #iconImagePath: iconImagePath,
        if (coverImagePath != $none) #coverImagePath: coverImagePath,
        if (backgroundImagePath != $none)
          #backgroundImagePath: backgroundImagePath,
        if (filtered != null) #filtered: filtered
      }));
  @override
  LibraryListItem $make(CopyWithData data) => LibraryListItem(
      uuid: data.get(#uuid, or: $value.uuid),
      name: data.get(#name, or: $value.name),
      iconImagePath: data.get(#iconImagePath, or: $value.iconImagePath),
      coverImagePath: data.get(#coverImagePath, or: $value.coverImagePath),
      backgroundImagePath:
          data.get(#backgroundImagePath, or: $value.backgroundImagePath),
      filtered: data.get(#filtered, or: $value.filtered));

  @override
  LibraryListItemCopyWith<$R2, LibraryListItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LibraryListItemCopyWithImpl($value, $cast, t);
}

class LocalLibraryScanResultMapper
    extends ClassMapperBase<LocalLibraryScanResult> {
  LocalLibraryScanResultMapper._();

  static LocalLibraryScanResultMapper? _instance;
  static LocalLibraryScanResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalLibraryScanResultMapper._());
      LocalLibraryScanResultDetailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LocalLibraryScanResult';

  static String _$uuid(LocalLibraryScanResult v) => v.uuid;
  static const Field<LocalLibraryScanResult, String> _f$uuid =
      Field('uuid', _$uuid);
  static LocalLibraryScanResultType _$type(LocalLibraryScanResult v) => v.type;
  static const Field<LocalLibraryScanResult, LocalLibraryScanResultType>
      _f$type = Field('type', _$type);
  static String _$path(LocalLibraryScanResult v) => v.path;
  static const Field<LocalLibraryScanResult, String> _f$path =
      Field('path', _$path);
  static int? _$trackedCount(LocalLibraryScanResult v) => v.trackedCount;
  static const Field<LocalLibraryScanResult, int> _f$trackedCount =
      Field('trackedCount', _$trackedCount, opt: true);
  static int? _$installedCount(LocalLibraryScanResult v) => v.installedCount;
  static const Field<LocalLibraryScanResult, int> _f$installedCount =
      Field('installedCount', _$installedCount, opt: true);
  static List<LocalLibraryScanResultDetail>? _$details(
          LocalLibraryScanResult v) =>
      v.details;
  static const Field<LocalLibraryScanResult, List<LocalLibraryScanResultDetail>>
      _f$details = Field('details', _$details, opt: true);

  @override
  final MappableFields<LocalLibraryScanResult> fields = const {
    #uuid: _f$uuid,
    #type: _f$type,
    #path: _f$path,
    #trackedCount: _f$trackedCount,
    #installedCount: _f$installedCount,
    #details: _f$details,
  };

  static LocalLibraryScanResult _instantiate(DecodingData data) {
    return LocalLibraryScanResult(
        uuid: data.dec(_f$uuid),
        type: data.dec(_f$type),
        path: data.dec(_f$path),
        trackedCount: data.dec(_f$trackedCount),
        installedCount: data.dec(_f$installedCount),
        details: data.dec(_f$details));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalLibraryScanResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalLibraryScanResult>(map);
  }

  static LocalLibraryScanResult fromJson(String json) {
    return ensureInitialized().decodeJson<LocalLibraryScanResult>(json);
  }
}

mixin LocalLibraryScanResultMappable {
  String toJson() {
    return LocalLibraryScanResultMapper.ensureInitialized()
        .encodeJson<LocalLibraryScanResult>(this as LocalLibraryScanResult);
  }

  Map<String, dynamic> toMap() {
    return LocalLibraryScanResultMapper.ensureInitialized()
        .encodeMap<LocalLibraryScanResult>(this as LocalLibraryScanResult);
  }

  LocalLibraryScanResultCopyWith<LocalLibraryScanResult, LocalLibraryScanResult,
          LocalLibraryScanResult>
      get copyWith => _LocalLibraryScanResultCopyWithImpl(
          this as LocalLibraryScanResult, $identity, $identity);
  @override
  String toString() {
    return LocalLibraryScanResultMapper.ensureInitialized()
        .stringifyValue(this as LocalLibraryScanResult);
  }

  @override
  bool operator ==(Object other) {
    return LocalLibraryScanResultMapper.ensureInitialized()
        .equalsValue(this as LocalLibraryScanResult, other);
  }

  @override
  int get hashCode {
    return LocalLibraryScanResultMapper.ensureInitialized()
        .hashValue(this as LocalLibraryScanResult);
  }
}

extension LocalLibraryScanResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalLibraryScanResult, $Out> {
  LocalLibraryScanResultCopyWith<$R, LocalLibraryScanResult, $Out>
      get $asLocalLibraryScanResult =>
          $base.as((v, t, t2) => _LocalLibraryScanResultCopyWithImpl(v, t, t2));
}

abstract class LocalLibraryScanResultCopyWith<
    $R,
    $In extends LocalLibraryScanResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      LocalLibraryScanResultDetail,
      LocalLibraryScanResultDetailCopyWith<$R, LocalLibraryScanResultDetail,
          LocalLibraryScanResultDetail>>? get details;
  $R call(
      {String? uuid,
      LocalLibraryScanResultType? type,
      String? path,
      int? trackedCount,
      int? installedCount,
      List<LocalLibraryScanResultDetail>? details});
  LocalLibraryScanResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalLibraryScanResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalLibraryScanResult, $Out>
    implements
        LocalLibraryScanResultCopyWith<$R, LocalLibraryScanResult, $Out> {
  _LocalLibraryScanResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalLibraryScanResult> $mapper =
      LocalLibraryScanResultMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      LocalLibraryScanResultDetail,
      LocalLibraryScanResultDetailCopyWith<$R, LocalLibraryScanResultDetail,
          LocalLibraryScanResultDetail>>? get details => $value.details != null
      ? ListCopyWith($value.details!, (v, t) => v.copyWith.$chain(t),
          (v) => call(details: v))
      : null;
  @override
  $R call(
          {String? uuid,
          LocalLibraryScanResultType? type,
          String? path,
          Object? trackedCount = $none,
          Object? installedCount = $none,
          Object? details = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (type != null) #type: type,
        if (path != null) #path: path,
        if (trackedCount != $none) #trackedCount: trackedCount,
        if (installedCount != $none) #installedCount: installedCount,
        if (details != $none) #details: details
      }));
  @override
  LocalLibraryScanResult $make(CopyWithData data) => LocalLibraryScanResult(
      uuid: data.get(#uuid, or: $value.uuid),
      type: data.get(#type, or: $value.type),
      path: data.get(#path, or: $value.path),
      trackedCount: data.get(#trackedCount, or: $value.trackedCount),
      installedCount: data.get(#installedCount, or: $value.installedCount),
      details: data.get(#details, or: $value.details));

  @override
  LocalLibraryScanResultCopyWith<$R2, LocalLibraryScanResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalLibraryScanResultCopyWithImpl($value, $cast, t);
}

class LocalLibraryScanResultDetailMapper
    extends ClassMapperBase<LocalLibraryScanResultDetail> {
  LocalLibraryScanResultDetailMapper._();

  static LocalLibraryScanResultDetailMapper? _instance;
  static LocalLibraryScanResultDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = LocalLibraryScanResultDetailMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalLibraryScanResultDetail';

  static String _$uuid(LocalLibraryScanResultDetail v) => v.uuid;
  static const Field<LocalLibraryScanResultDetail, String> _f$uuid =
      Field('uuid', _$uuid);
  static String _$name(LocalLibraryScanResultDetail v) => v.name;
  static const Field<LocalLibraryScanResultDetail, String> _f$name =
      Field('name', _$name);
  static String _$path(LocalLibraryScanResultDetail v) => v.path;
  static const Field<LocalLibraryScanResultDetail, String> _f$path =
      Field('path', _$path);
  static String? _$iconImagePath(LocalLibraryScanResultDetail v) =>
      v.iconImagePath;
  static const Field<LocalLibraryScanResultDetail, String> _f$iconImagePath =
      Field('iconImagePath', _$iconImagePath, opt: true);
  static bool _$tracked(LocalLibraryScanResultDetail v) => v.tracked;
  static const Field<LocalLibraryScanResultDetail, bool> _f$tracked =
      Field('tracked', _$tracked);

  @override
  final MappableFields<LocalLibraryScanResultDetail> fields = const {
    #uuid: _f$uuid,
    #name: _f$name,
    #path: _f$path,
    #iconImagePath: _f$iconImagePath,
    #tracked: _f$tracked,
  };

  static LocalLibraryScanResultDetail _instantiate(DecodingData data) {
    return LocalLibraryScanResultDetail(
        uuid: data.dec(_f$uuid),
        name: data.dec(_f$name),
        path: data.dec(_f$path),
        iconImagePath: data.dec(_f$iconImagePath),
        tracked: data.dec(_f$tracked));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalLibraryScanResultDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalLibraryScanResultDetail>(map);
  }

  static LocalLibraryScanResultDetail fromJson(String json) {
    return ensureInitialized().decodeJson<LocalLibraryScanResultDetail>(json);
  }
}

mixin LocalLibraryScanResultDetailMappable {
  String toJson() {
    return LocalLibraryScanResultDetailMapper.ensureInitialized()
        .encodeJson<LocalLibraryScanResultDetail>(
            this as LocalLibraryScanResultDetail);
  }

  Map<String, dynamic> toMap() {
    return LocalLibraryScanResultDetailMapper.ensureInitialized()
        .encodeMap<LocalLibraryScanResultDetail>(
            this as LocalLibraryScanResultDetail);
  }

  LocalLibraryScanResultDetailCopyWith<LocalLibraryScanResultDetail,
          LocalLibraryScanResultDetail, LocalLibraryScanResultDetail>
      get copyWith => _LocalLibraryScanResultDetailCopyWithImpl(
          this as LocalLibraryScanResultDetail, $identity, $identity);
  @override
  String toString() {
    return LocalLibraryScanResultDetailMapper.ensureInitialized()
        .stringifyValue(this as LocalLibraryScanResultDetail);
  }

  @override
  bool operator ==(Object other) {
    return LocalLibraryScanResultDetailMapper.ensureInitialized()
        .equalsValue(this as LocalLibraryScanResultDetail, other);
  }

  @override
  int get hashCode {
    return LocalLibraryScanResultDetailMapper.ensureInitialized()
        .hashValue(this as LocalLibraryScanResultDetail);
  }
}

extension LocalLibraryScanResultDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalLibraryScanResultDetail, $Out> {
  LocalLibraryScanResultDetailCopyWith<$R, LocalLibraryScanResultDetail, $Out>
      get $asLocalLibraryScanResultDetail => $base.as(
          (v, t, t2) => _LocalLibraryScanResultDetailCopyWithImpl(v, t, t2));
}

abstract class LocalLibraryScanResultDetailCopyWith<
    $R,
    $In extends LocalLibraryScanResultDetail,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? uuid,
      String? name,
      String? path,
      String? iconImagePath,
      bool? tracked});
  LocalLibraryScanResultDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalLibraryScanResultDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalLibraryScanResultDetail, $Out>
    implements
        LocalLibraryScanResultDetailCopyWith<$R, LocalLibraryScanResultDetail,
            $Out> {
  _LocalLibraryScanResultDetailCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalLibraryScanResultDetail> $mapper =
      LocalLibraryScanResultDetailMapper.ensureInitialized();
  @override
  $R call(
          {String? uuid,
          String? name,
          String? path,
          Object? iconImagePath = $none,
          bool? tracked}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (name != null) #name: name,
        if (path != null) #path: path,
        if (iconImagePath != $none) #iconImagePath: iconImagePath,
        if (tracked != null) #tracked: tracked
      }));
  @override
  LocalLibraryScanResultDetail $make(CopyWithData data) =>
      LocalLibraryScanResultDetail(
          uuid: data.get(#uuid, or: $value.uuid),
          name: data.get(#name, or: $value.name),
          path: data.get(#path, or: $value.path),
          iconImagePath: data.get(#iconImagePath, or: $value.iconImagePath),
          tracked: data.get(#tracked, or: $value.tracked));

  @override
  LocalLibraryScanResultDetailCopyWith<$R2, LocalLibraryScanResultDetail, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalLibraryScanResultDetailCopyWithImpl($value, $cast, t);
}
