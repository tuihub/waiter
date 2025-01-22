// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'yesod_bloc.dart';

class YesodStateMapper extends ClassMapperBase<YesodState> {
  YesodStateMapper._();

  static YesodStateMapper? _instance;
  static YesodStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YesodStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'YesodState';

  static List<ListFeedConfigsResponse_FeedWithConfig>? _$feedConfigs(
          YesodState v) =>
      v.feedConfigs;
  static const Field<YesodState, List<ListFeedConfigsResponse_FeedWithConfig>>
      _f$feedConfigs = Field('feedConfigs', _$feedConfigs, opt: true);
  static List<FeedActionSet>? _$feedActionSets(YesodState v) =>
      v.feedActionSets;
  static const Field<YesodState, List<FeedActionSet>> _f$feedActionSets =
      Field('feedActionSets', _$feedActionSets, opt: true);
  static List<FeedItemDigest>? _$feedItemDigests(YesodState v) =>
      v.feedItemDigests;
  static const Field<YesodState, List<FeedItemDigest>> _f$feedItemDigests =
      Field('feedItemDigests', _$feedItemDigests, opt: true);
  static List<String>? _$feedCategories(YesodState v) => v.feedCategories;
  static const Field<YesodState, List<String>> _f$feedCategories =
      Field('feedCategories', _$feedCategories, opt: true);
  static YesodFeedItemListConfig? _$listConfig(YesodState v) => v.listConfig;
  static const Field<YesodState, YesodFeedItemListConfig> _f$listConfig =
      Field('listConfig', _$listConfig, opt: true);

  @override
  final MappableFields<YesodState> fields = const {
    #feedConfigs: _f$feedConfigs,
    #feedActionSets: _f$feedActionSets,
    #feedItemDigests: _f$feedItemDigests,
    #feedCategories: _f$feedCategories,
    #listConfig: _f$listConfig,
  };

  static YesodState _instantiate(DecodingData data) {
    return YesodState(
        feedConfigs: data.dec(_f$feedConfigs),
        feedActionSets: data.dec(_f$feedActionSets),
        feedItemDigests: data.dec(_f$feedItemDigests),
        feedCategories: data.dec(_f$feedCategories),
        listConfig: data.dec(_f$listConfig));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin YesodStateMappable {
  YesodStateCopyWith<YesodState, YesodState, YesodState> get copyWith =>
      _YesodStateCopyWithImpl(this as YesodState, $identity, $identity);
}

extension YesodStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YesodState, $Out> {
  YesodStateCopyWith<$R, YesodState, $Out> get $asYesodState =>
      $base.as((v, t, t2) => _YesodStateCopyWithImpl(v, t, t2));
}

abstract class YesodStateCopyWith<$R, $In extends YesodState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ListFeedConfigsResponse_FeedWithConfig,
      ObjectCopyWith<$R, ListFeedConfigsResponse_FeedWithConfig,
          ListFeedConfigsResponse_FeedWithConfig>>? get feedConfigs;
  ListCopyWith<$R, FeedActionSet,
      ObjectCopyWith<$R, FeedActionSet, FeedActionSet>>? get feedActionSets;
  ListCopyWith<$R, FeedItemDigest,
      ObjectCopyWith<$R, FeedItemDigest, FeedItemDigest>>? get feedItemDigests;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get feedCategories;
  $R call(
      {List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs,
      List<FeedActionSet>? feedActionSets,
      List<FeedItemDigest>? feedItemDigests,
      List<String>? feedCategories,
      YesodFeedItemListConfig? listConfig});
  YesodStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _YesodStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YesodState, $Out>
    implements YesodStateCopyWith<$R, YesodState, $Out> {
  _YesodStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YesodState> $mapper =
      YesodStateMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ListFeedConfigsResponse_FeedWithConfig,
      ObjectCopyWith<$R, ListFeedConfigsResponse_FeedWithConfig,
          ListFeedConfigsResponse_FeedWithConfig>>? get feedConfigs =>
      $value.feedConfigs != null
          ? ListCopyWith(
              $value.feedConfigs!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(feedConfigs: v))
          : null;
  @override
  ListCopyWith<$R, FeedActionSet,
          ObjectCopyWith<$R, FeedActionSet, FeedActionSet>>?
      get feedActionSets => $value.feedActionSets != null
          ? ListCopyWith(
              $value.feedActionSets!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(feedActionSets: v))
          : null;
  @override
  ListCopyWith<$R, FeedItemDigest,
          ObjectCopyWith<$R, FeedItemDigest, FeedItemDigest>>?
      get feedItemDigests => $value.feedItemDigests != null
          ? ListCopyWith(
              $value.feedItemDigests!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(feedItemDigests: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get feedCategories => $value.feedCategories != null
          ? ListCopyWith(
              $value.feedCategories!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(feedCategories: v))
          : null;
  @override
  $R call(
          {Object? feedConfigs = $none,
          Object? feedActionSets = $none,
          Object? feedItemDigests = $none,
          Object? feedCategories = $none,
          Object? listConfig = $none}) =>
      $apply(FieldCopyWithData({
        if (feedConfigs != $none) #feedConfigs: feedConfigs,
        if (feedActionSets != $none) #feedActionSets: feedActionSets,
        if (feedItemDigests != $none) #feedItemDigests: feedItemDigests,
        if (feedCategories != $none) #feedCategories: feedCategories,
        if (listConfig != $none) #listConfig: listConfig
      }));
  @override
  YesodState $make(CopyWithData data) => YesodState(
      feedConfigs: data.get(#feedConfigs, or: $value.feedConfigs),
      feedActionSets: data.get(#feedActionSets, or: $value.feedActionSets),
      feedItemDigests: data.get(#feedItemDigests, or: $value.feedItemDigests),
      feedCategories: data.get(#feedCategories, or: $value.feedCategories),
      listConfig: data.get(#listConfig, or: $value.listConfig));

  @override
  YesodStateCopyWith<$R2, YesodState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YesodStateCopyWithImpl($value, $cast, t);
}
