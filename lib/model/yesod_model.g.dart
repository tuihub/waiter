// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yesod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YesodFeedItemListConfigImpl _$$YesodFeedItemListConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$YesodFeedItemListConfigImpl(
      feedIdFilter:
          (json['feedIdFilter'] as List<dynamic>?)?.map((e) => e as String),
      authorIdFilter:
          (json['authorIdFilter'] as List<dynamic>?)?.map((e) => e as String),
      publishPlatformFilter: (json['publishPlatformFilter'] as List<dynamic>?)
          ?.map((e) => e as String),
      categoryFilter:
          (json['categoryFilter'] as List<dynamic>?)?.map((e) => e as String),
      hideRead: json['hideRead'] as bool?,
      listType:
          $enumDecodeNullable(_$FeedItemListTypeEnumMap, json['listType']),
    );

Map<String, dynamic> _$$YesodFeedItemListConfigImplToJson(
        _$YesodFeedItemListConfigImpl instance) =>
    <String, dynamic>{
      'feedIdFilter': instance.feedIdFilter?.toList(),
      'authorIdFilter': instance.authorIdFilter?.toList(),
      'publishPlatformFilter': instance.publishPlatformFilter?.toList(),
      'categoryFilter': instance.categoryFilter?.toList(),
      'hideRead': instance.hideRead,
      'listType': _$FeedItemListTypeEnumMap[instance.listType],
    };

const _$FeedItemListTypeEnumMap = {
  FeedItemListType.table: 'table',
  FeedItemListType.magazine: 'magazine',
  FeedItemListType.card: 'card',
};
