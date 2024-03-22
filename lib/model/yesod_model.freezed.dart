// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yesod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YesodFeedItemListConfig _$YesodFeedItemListConfigFromJson(
    Map<String, dynamic> json) {
  return _YesodFeedItemListConfig.fromJson(json);
}

/// @nodoc
mixin _$YesodFeedItemListConfig {
  Iterable<String>? get feedIdFilter => throw _privateConstructorUsedError;
  Iterable<String>? get authorIdFilter => throw _privateConstructorUsedError;
  Iterable<String>? get publishPlatformFilter =>
      throw _privateConstructorUsedError;
  Iterable<String>? get categoryFilter => throw _privateConstructorUsedError;
  bool? get hideRead => throw _privateConstructorUsedError;
  FeedItemListType? get listType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YesodFeedItemListConfigCopyWith<YesodFeedItemListConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YesodFeedItemListConfigCopyWith<$Res> {
  factory $YesodFeedItemListConfigCopyWith(YesodFeedItemListConfig value,
          $Res Function(YesodFeedItemListConfig) then) =
      _$YesodFeedItemListConfigCopyWithImpl<$Res, YesodFeedItemListConfig>;
  @useResult
  $Res call(
      {Iterable<String>? feedIdFilter,
      Iterable<String>? authorIdFilter,
      Iterable<String>? publishPlatformFilter,
      Iterable<String>? categoryFilter,
      bool? hideRead,
      FeedItemListType? listType});
}

/// @nodoc
class _$YesodFeedItemListConfigCopyWithImpl<$Res,
        $Val extends YesodFeedItemListConfig>
    implements $YesodFeedItemListConfigCopyWith<$Res> {
  _$YesodFeedItemListConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedIdFilter = freezed,
    Object? authorIdFilter = freezed,
    Object? publishPlatformFilter = freezed,
    Object? categoryFilter = freezed,
    Object? hideRead = freezed,
    Object? listType = freezed,
  }) {
    return _then(_value.copyWith(
      feedIdFilter: freezed == feedIdFilter
          ? _value.feedIdFilter
          : feedIdFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      authorIdFilter: freezed == authorIdFilter
          ? _value.authorIdFilter
          : authorIdFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      publishPlatformFilter: freezed == publishPlatformFilter
          ? _value.publishPlatformFilter
          : publishPlatformFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      categoryFilter: freezed == categoryFilter
          ? _value.categoryFilter
          : categoryFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      hideRead: freezed == hideRead
          ? _value.hideRead
          : hideRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      listType: freezed == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as FeedItemListType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YesodFeedItemListConfigImplCopyWith<$Res>
    implements $YesodFeedItemListConfigCopyWith<$Res> {
  factory _$$YesodFeedItemListConfigImplCopyWith(
          _$YesodFeedItemListConfigImpl value,
          $Res Function(_$YesodFeedItemListConfigImpl) then) =
      __$$YesodFeedItemListConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Iterable<String>? feedIdFilter,
      Iterable<String>? authorIdFilter,
      Iterable<String>? publishPlatformFilter,
      Iterable<String>? categoryFilter,
      bool? hideRead,
      FeedItemListType? listType});
}

/// @nodoc
class __$$YesodFeedItemListConfigImplCopyWithImpl<$Res>
    extends _$YesodFeedItemListConfigCopyWithImpl<$Res,
        _$YesodFeedItemListConfigImpl>
    implements _$$YesodFeedItemListConfigImplCopyWith<$Res> {
  __$$YesodFeedItemListConfigImplCopyWithImpl(
      _$YesodFeedItemListConfigImpl _value,
      $Res Function(_$YesodFeedItemListConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedIdFilter = freezed,
    Object? authorIdFilter = freezed,
    Object? publishPlatformFilter = freezed,
    Object? categoryFilter = freezed,
    Object? hideRead = freezed,
    Object? listType = freezed,
  }) {
    return _then(_$YesodFeedItemListConfigImpl(
      feedIdFilter: freezed == feedIdFilter
          ? _value.feedIdFilter
          : feedIdFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      authorIdFilter: freezed == authorIdFilter
          ? _value.authorIdFilter
          : authorIdFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      publishPlatformFilter: freezed == publishPlatformFilter
          ? _value.publishPlatformFilter
          : publishPlatformFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      categoryFilter: freezed == categoryFilter
          ? _value.categoryFilter
          : categoryFilter // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      hideRead: freezed == hideRead
          ? _value.hideRead
          : hideRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      listType: freezed == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as FeedItemListType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YesodFeedItemListConfigImpl implements _YesodFeedItemListConfig {
  const _$YesodFeedItemListConfigImpl(
      {this.feedIdFilter,
      this.authorIdFilter,
      this.publishPlatformFilter,
      this.categoryFilter,
      this.hideRead,
      this.listType});

  factory _$YesodFeedItemListConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$YesodFeedItemListConfigImplFromJson(json);

  @override
  final Iterable<String>? feedIdFilter;
  @override
  final Iterable<String>? authorIdFilter;
  @override
  final Iterable<String>? publishPlatformFilter;
  @override
  final Iterable<String>? categoryFilter;
  @override
  final bool? hideRead;
  @override
  final FeedItemListType? listType;

  @override
  String toString() {
    return 'YesodFeedItemListConfig(feedIdFilter: $feedIdFilter, authorIdFilter: $authorIdFilter, publishPlatformFilter: $publishPlatformFilter, categoryFilter: $categoryFilter, hideRead: $hideRead, listType: $listType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YesodFeedItemListConfigImpl &&
            const DeepCollectionEquality()
                .equals(other.feedIdFilter, feedIdFilter) &&
            const DeepCollectionEquality()
                .equals(other.authorIdFilter, authorIdFilter) &&
            const DeepCollectionEquality()
                .equals(other.publishPlatformFilter, publishPlatformFilter) &&
            const DeepCollectionEquality()
                .equals(other.categoryFilter, categoryFilter) &&
            (identical(other.hideRead, hideRead) ||
                other.hideRead == hideRead) &&
            (identical(other.listType, listType) ||
                other.listType == listType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(feedIdFilter),
      const DeepCollectionEquality().hash(authorIdFilter),
      const DeepCollectionEquality().hash(publishPlatformFilter),
      const DeepCollectionEquality().hash(categoryFilter),
      hideRead,
      listType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YesodFeedItemListConfigImplCopyWith<_$YesodFeedItemListConfigImpl>
      get copyWith => __$$YesodFeedItemListConfigImplCopyWithImpl<
          _$YesodFeedItemListConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YesodFeedItemListConfigImplToJson(
      this,
    );
  }
}

abstract class _YesodFeedItemListConfig implements YesodFeedItemListConfig {
  const factory _YesodFeedItemListConfig(
      {final Iterable<String>? feedIdFilter,
      final Iterable<String>? authorIdFilter,
      final Iterable<String>? publishPlatformFilter,
      final Iterable<String>? categoryFilter,
      final bool? hideRead,
      final FeedItemListType? listType}) = _$YesodFeedItemListConfigImpl;

  factory _YesodFeedItemListConfig.fromJson(Map<String, dynamic> json) =
      _$YesodFeedItemListConfigImpl.fromJson;

  @override
  Iterable<String>? get feedIdFilter;
  @override
  Iterable<String>? get authorIdFilter;
  @override
  Iterable<String>? get publishPlatformFilter;
  @override
  Iterable<String>? get categoryFilter;
  @override
  bool? get hideRead;
  @override
  FeedItemListType? get listType;
  @override
  @JsonKey(ignore: true)
  _$$YesodFeedItemListConfigImplCopyWith<_$YesodFeedItemListConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
