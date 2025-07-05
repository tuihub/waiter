// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'yesod_model.dart';

class YesodFeedItemListConfigMapper
    extends ClassMapperBase<YesodFeedItemListConfig> {
  YesodFeedItemListConfigMapper._();

  static YesodFeedItemListConfigMapper? _instance;
  static YesodFeedItemListConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = YesodFeedItemListConfigMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'YesodFeedItemListConfig';

  static Iterable<String>? _$feedIdFilter(YesodFeedItemListConfig v) =>
      v.feedIdFilter;
  static const Field<YesodFeedItemListConfig, Iterable<String>>
      _f$feedIdFilter = Field('feedIdFilter', _$feedIdFilter, opt: true);
  static Iterable<String>? _$authorIdFilter(YesodFeedItemListConfig v) =>
      v.authorIdFilter;
  static const Field<YesodFeedItemListConfig, Iterable<String>>
      _f$authorIdFilter = Field('authorIdFilter', _$authorIdFilter, opt: true);
  static Iterable<String>? _$publishPlatformFilter(YesodFeedItemListConfig v) =>
      v.publishPlatformFilter;
  static const Field<YesodFeedItemListConfig, Iterable<String>>
      _f$publishPlatformFilter =
      Field('publishPlatformFilter', _$publishPlatformFilter, opt: true);
  static Iterable<String>? _$categoryFilter(YesodFeedItemListConfig v) =>
      v.categoryFilter;
  static const Field<YesodFeedItemListConfig, Iterable<String>>
      _f$categoryFilter = Field('categoryFilter', _$categoryFilter, opt: true);
  static bool? _$hideRead(YesodFeedItemListConfig v) => v.hideRead;
  static const Field<YesodFeedItemListConfig, bool> _f$hideRead =
      Field('hideRead', _$hideRead, opt: true);
  static FeedItemListType? _$listType(YesodFeedItemListConfig v) => v.listType;
  static const Field<YesodFeedItemListConfig, FeedItemListType> _f$listType =
      Field('listType', _$listType, opt: true);

  @override
  final MappableFields<YesodFeedItemListConfig> fields = const {
    #feedIdFilter: _f$feedIdFilter,
    #authorIdFilter: _f$authorIdFilter,
    #publishPlatformFilter: _f$publishPlatformFilter,
    #categoryFilter: _f$categoryFilter,
    #hideRead: _f$hideRead,
    #listType: _f$listType,
  };

  static YesodFeedItemListConfig _instantiate(DecodingData data) {
    return YesodFeedItemListConfig(
        feedIdFilter: data.dec(_f$feedIdFilter),
        authorIdFilter: data.dec(_f$authorIdFilter),
        publishPlatformFilter: data.dec(_f$publishPlatformFilter),
        categoryFilter: data.dec(_f$categoryFilter),
        hideRead: data.dec(_f$hideRead),
        listType: data.dec(_f$listType));
  }

  @override
  final Function instantiate = _instantiate;

  static YesodFeedItemListConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YesodFeedItemListConfig>(map);
  }

  static YesodFeedItemListConfig fromJson(String json) {
    return ensureInitialized().decodeJson<YesodFeedItemListConfig>(json);
  }
}

mixin YesodFeedItemListConfigMappable {
  String toJson() {
    return YesodFeedItemListConfigMapper.ensureInitialized()
        .encodeJson<YesodFeedItemListConfig>(this as YesodFeedItemListConfig);
  }

  Map<String, dynamic> toMap() {
    return YesodFeedItemListConfigMapper.ensureInitialized()
        .encodeMap<YesodFeedItemListConfig>(this as YesodFeedItemListConfig);
  }

  YesodFeedItemListConfigCopyWith<YesodFeedItemListConfig,
          YesodFeedItemListConfig, YesodFeedItemListConfig>
      get copyWith => _YesodFeedItemListConfigCopyWithImpl<
              YesodFeedItemListConfig, YesodFeedItemListConfig>(
          this as YesodFeedItemListConfig, $identity, $identity);
  @override
  String toString() {
    return YesodFeedItemListConfigMapper.ensureInitialized()
        .stringifyValue(this as YesodFeedItemListConfig);
  }

  @override
  bool operator ==(Object other) {
    return YesodFeedItemListConfigMapper.ensureInitialized()
        .equalsValue(this as YesodFeedItemListConfig, other);
  }

  @override
  int get hashCode {
    return YesodFeedItemListConfigMapper.ensureInitialized()
        .hashValue(this as YesodFeedItemListConfig);
  }
}

extension YesodFeedItemListConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YesodFeedItemListConfig, $Out> {
  YesodFeedItemListConfigCopyWith<$R, YesodFeedItemListConfig, $Out>
      get $asYesodFeedItemListConfig => $base.as((v, t, t2) =>
          _YesodFeedItemListConfigCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class YesodFeedItemListConfigCopyWith<
    $R,
    $In extends YesodFeedItemListConfig,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {Iterable<String>? feedIdFilter,
      Iterable<String>? authorIdFilter,
      Iterable<String>? publishPlatformFilter,
      Iterable<String>? categoryFilter,
      bool? hideRead,
      FeedItemListType? listType});
  YesodFeedItemListConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YesodFeedItemListConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YesodFeedItemListConfig, $Out>
    implements
        YesodFeedItemListConfigCopyWith<$R, YesodFeedItemListConfig, $Out> {
  _YesodFeedItemListConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YesodFeedItemListConfig> $mapper =
      YesodFeedItemListConfigMapper.ensureInitialized();
  @override
  $R call(
          {Object? feedIdFilter = $none,
          Object? authorIdFilter = $none,
          Object? publishPlatformFilter = $none,
          Object? categoryFilter = $none,
          Object? hideRead = $none,
          Object? listType = $none}) =>
      $apply(FieldCopyWithData({
        if (feedIdFilter != $none) #feedIdFilter: feedIdFilter,
        if (authorIdFilter != $none) #authorIdFilter: authorIdFilter,
        if (publishPlatformFilter != $none)
          #publishPlatformFilter: publishPlatformFilter,
        if (categoryFilter != $none) #categoryFilter: categoryFilter,
        if (hideRead != $none) #hideRead: hideRead,
        if (listType != $none) #listType: listType
      }));
  @override
  YesodFeedItemListConfig $make(CopyWithData data) => YesodFeedItemListConfig(
      feedIdFilter: data.get(#feedIdFilter, or: $value.feedIdFilter),
      authorIdFilter: data.get(#authorIdFilter, or: $value.authorIdFilter),
      publishPlatformFilter:
          data.get(#publishPlatformFilter, or: $value.publishPlatformFilter),
      categoryFilter: data.get(#categoryFilter, or: $value.categoryFilter),
      hideRead: data.get(#hideRead, or: $value.hideRead),
      listType: data.get(#listType, or: $value.listType));

  @override
  YesodFeedItemListConfigCopyWith<$R2, YesodFeedItemListConfig, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _YesodFeedItemListConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
