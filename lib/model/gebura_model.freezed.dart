// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gebura_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LibrarySettings _$LibrarySettingsFromJson(Map<String, dynamic> json) {
  return _LibrarySettings.fromJson(json);
}

/// @nodoc
mixin _$LibrarySettings {
  LibraryFilter? get filter => throw _privateConstructorUsedError;
  LocalLibrarySettings? get local => throw _privateConstructorUsedError;

  /// Serializes this LibrarySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibrarySettingsCopyWith<LibrarySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrarySettingsCopyWith<$Res> {
  factory $LibrarySettingsCopyWith(
          LibrarySettings value, $Res Function(LibrarySettings) then) =
      _$LibrarySettingsCopyWithImpl<$Res, LibrarySettings>;
  @useResult
  $Res call({LibraryFilter? filter, LocalLibrarySettings? local});

  $LibraryFilterCopyWith<$Res>? get filter;
  $LocalLibrarySettingsCopyWith<$Res>? get local;
}

/// @nodoc
class _$LibrarySettingsCopyWithImpl<$Res, $Val extends LibrarySettings>
    implements $LibrarySettingsCopyWith<$Res> {
  _$LibrarySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? local = freezed,
  }) {
    return _then(_value.copyWith(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as LibraryFilter?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as LocalLibrarySettings?,
    ) as $Val);
  }

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LibraryFilterCopyWith<$Res>? get filter {
    if (_value.filter == null) {
      return null;
    }

    return $LibraryFilterCopyWith<$Res>(_value.filter!, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalLibrarySettingsCopyWith<$Res>? get local {
    if (_value.local == null) {
      return null;
    }

    return $LocalLibrarySettingsCopyWith<$Res>(_value.local!, (value) {
      return _then(_value.copyWith(local: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LibrarySettingsImplCopyWith<$Res>
    implements $LibrarySettingsCopyWith<$Res> {
  factory _$$LibrarySettingsImplCopyWith(_$LibrarySettingsImpl value,
          $Res Function(_$LibrarySettingsImpl) then) =
      __$$LibrarySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LibraryFilter? filter, LocalLibrarySettings? local});

  @override
  $LibraryFilterCopyWith<$Res>? get filter;
  @override
  $LocalLibrarySettingsCopyWith<$Res>? get local;
}

/// @nodoc
class __$$LibrarySettingsImplCopyWithImpl<$Res>
    extends _$LibrarySettingsCopyWithImpl<$Res, _$LibrarySettingsImpl>
    implements _$$LibrarySettingsImplCopyWith<$Res> {
  __$$LibrarySettingsImplCopyWithImpl(
      _$LibrarySettingsImpl _value, $Res Function(_$LibrarySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? local = freezed,
  }) {
    return _then(_$LibrarySettingsImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as LibraryFilter?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as LocalLibrarySettings?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LibrarySettingsImpl implements _LibrarySettings {
  const _$LibrarySettingsImpl({this.filter, this.local});

  factory _$LibrarySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibrarySettingsImplFromJson(json);

  @override
  final LibraryFilter? filter;
  @override
  final LocalLibrarySettings? local;

  @override
  String toString() {
    return 'LibrarySettings(filter: $filter, local: $local)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrarySettingsImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.local, local) || other.local == local));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, filter, local);

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrarySettingsImplCopyWith<_$LibrarySettingsImpl> get copyWith =>
      __$$LibrarySettingsImplCopyWithImpl<_$LibrarySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LibrarySettingsImplToJson(
      this,
    );
  }
}

abstract class _LibrarySettings implements LibrarySettings {
  const factory _LibrarySettings(
      {final LibraryFilter? filter,
      final LocalLibrarySettings? local}) = _$LibrarySettingsImpl;

  factory _LibrarySettings.fromJson(Map<String, dynamic> json) =
      _$LibrarySettingsImpl.fromJson;

  @override
  LibraryFilter? get filter;
  @override
  LocalLibrarySettings? get local;

  /// Create a copy of LibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibrarySettingsImplCopyWith<_$LibrarySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LibraryFilter _$LibraryFilterFromJson(Map<String, dynamic> json) {
  return _LibraryFilter.fromJson(json);
}

/// @nodoc
mixin _$LibraryFilter {
  String? get query => throw _privateConstructorUsedError;

  /// Serializes this LibraryFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LibraryFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryFilterCopyWith<LibraryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryFilterCopyWith<$Res> {
  factory $LibraryFilterCopyWith(
          LibraryFilter value, $Res Function(LibraryFilter) then) =
      _$LibraryFilterCopyWithImpl<$Res, LibraryFilter>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$LibraryFilterCopyWithImpl<$Res, $Val extends LibraryFilter>
    implements $LibraryFilterCopyWith<$Res> {
  _$LibraryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryFilterImplCopyWith<$Res>
    implements $LibraryFilterCopyWith<$Res> {
  factory _$$LibraryFilterImplCopyWith(
          _$LibraryFilterImpl value, $Res Function(_$LibraryFilterImpl) then) =
      __$$LibraryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$LibraryFilterImplCopyWithImpl<$Res>
    extends _$LibraryFilterCopyWithImpl<$Res, _$LibraryFilterImpl>
    implements _$$LibraryFilterImplCopyWith<$Res> {
  __$$LibraryFilterImplCopyWithImpl(
      _$LibraryFilterImpl _value, $Res Function(_$LibraryFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$LibraryFilterImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LibraryFilterImpl implements _LibraryFilter {
  const _$LibraryFilterImpl({this.query});

  factory _$LibraryFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibraryFilterImplFromJson(json);

  @override
  final String? query;

  @override
  String toString() {
    return 'LibraryFilter(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryFilterImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of LibraryFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryFilterImplCopyWith<_$LibraryFilterImpl> get copyWith =>
      __$$LibraryFilterImplCopyWithImpl<_$LibraryFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LibraryFilterImplToJson(
      this,
    );
  }
}

abstract class _LibraryFilter implements LibraryFilter {
  const factory _LibraryFilter({final String? query}) = _$LibraryFilterImpl;

  factory _LibraryFilter.fromJson(Map<String, dynamic> json) =
      _$LibraryFilterImpl.fromJson;

  @override
  String? get query;

  /// Create a copy of LibraryFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryFilterImplCopyWith<_$LibraryFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LibraryListItem _$LibraryListItemFromJson(Map<String, dynamic> json) {
  return _LibraryListItem.fromJson(json);
}

/// @nodoc
mixin _$LibraryListItem {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconImageUrl => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  String get backgroundImageUrl => throw _privateConstructorUsedError;
  bool get filtered => throw _privateConstructorUsedError;
  int? get appID => throw _privateConstructorUsedError;
  String? get localAppUUID => throw _privateConstructorUsedError;

  /// Serializes this LibraryListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LibraryListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryListItemCopyWith<LibraryListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryListItemCopyWith<$Res> {
  factory $LibraryListItemCopyWith(
          LibraryListItem value, $Res Function(LibraryListItem) then) =
      _$LibraryListItemCopyWithImpl<$Res, LibraryListItem>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String iconImageUrl,
      String coverImageUrl,
      String backgroundImageUrl,
      bool filtered,
      int? appID,
      String? localAppUUID});
}

/// @nodoc
class _$LibraryListItemCopyWithImpl<$Res, $Val extends LibraryListItem>
    implements $LibraryListItemCopyWith<$Res> {
  _$LibraryListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? iconImageUrl = null,
    Object? coverImageUrl = null,
    Object? backgroundImageUrl = null,
    Object? filtered = null,
    Object? appID = freezed,
    Object? localAppUUID = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconImageUrl: null == iconImageUrl
          ? _value.iconImageUrl
          : iconImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImageUrl: null == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      filtered: null == filtered
          ? _value.filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as bool,
      appID: freezed == appID
          ? _value.appID
          : appID // ignore: cast_nullable_to_non_nullable
              as int?,
      localAppUUID: freezed == localAppUUID
          ? _value.localAppUUID
          : localAppUUID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryListItemImplCopyWith<$Res>
    implements $LibraryListItemCopyWith<$Res> {
  factory _$$LibraryListItemImplCopyWith(_$LibraryListItemImpl value,
          $Res Function(_$LibraryListItemImpl) then) =
      __$$LibraryListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String iconImageUrl,
      String coverImageUrl,
      String backgroundImageUrl,
      bool filtered,
      int? appID,
      String? localAppUUID});
}

/// @nodoc
class __$$LibraryListItemImplCopyWithImpl<$Res>
    extends _$LibraryListItemCopyWithImpl<$Res, _$LibraryListItemImpl>
    implements _$$LibraryListItemImplCopyWith<$Res> {
  __$$LibraryListItemImplCopyWithImpl(
      _$LibraryListItemImpl _value, $Res Function(_$LibraryListItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? iconImageUrl = null,
    Object? coverImageUrl = null,
    Object? backgroundImageUrl = null,
    Object? filtered = null,
    Object? appID = freezed,
    Object? localAppUUID = freezed,
  }) {
    return _then(_$LibraryListItemImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconImageUrl: null == iconImageUrl
          ? _value.iconImageUrl
          : iconImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImageUrl: null == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      filtered: null == filtered
          ? _value.filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as bool,
      appID: freezed == appID
          ? _value.appID
          : appID // ignore: cast_nullable_to_non_nullable
              as int?,
      localAppUUID: freezed == localAppUUID
          ? _value.localAppUUID
          : localAppUUID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LibraryListItemImpl implements _LibraryListItem {
  const _$LibraryListItemImpl(
      {required this.uuid,
      required this.name,
      required this.iconImageUrl,
      required this.coverImageUrl,
      required this.backgroundImageUrl,
      this.filtered = false,
      this.appID,
      this.localAppUUID});

  factory _$LibraryListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibraryListItemImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String iconImageUrl;
  @override
  final String coverImageUrl;
  @override
  final String backgroundImageUrl;
  @override
  @JsonKey()
  final bool filtered;
  @override
  final int? appID;
  @override
  final String? localAppUUID;

  @override
  String toString() {
    return 'LibraryListItem(uuid: $uuid, name: $name, iconImageUrl: $iconImageUrl, coverImageUrl: $coverImageUrl, backgroundImageUrl: $backgroundImageUrl, filtered: $filtered, appID: $appID, localAppUUID: $localAppUUID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryListItemImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconImageUrl, iconImageUrl) ||
                other.iconImageUrl == iconImageUrl) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.backgroundImageUrl, backgroundImageUrl) ||
                other.backgroundImageUrl == backgroundImageUrl) &&
            (identical(other.filtered, filtered) ||
                other.filtered == filtered) &&
            (identical(other.appID, appID) || other.appID == appID) &&
            (identical(other.localAppUUID, localAppUUID) ||
                other.localAppUUID == localAppUUID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, iconImageUrl,
      coverImageUrl, backgroundImageUrl, filtered, appID, localAppUUID);

  /// Create a copy of LibraryListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryListItemImplCopyWith<_$LibraryListItemImpl> get copyWith =>
      __$$LibraryListItemImplCopyWithImpl<_$LibraryListItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LibraryListItemImplToJson(
      this,
    );
  }
}

abstract class _LibraryListItem implements LibraryListItem {
  const factory _LibraryListItem(
      {required final String uuid,
      required final String name,
      required final String iconImageUrl,
      required final String coverImageUrl,
      required final String backgroundImageUrl,
      final bool filtered,
      final int? appID,
      final String? localAppUUID}) = _$LibraryListItemImpl;

  factory _LibraryListItem.fromJson(Map<String, dynamic> json) =
      _$LibraryListItemImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get iconImageUrl;
  @override
  String get coverImageUrl;
  @override
  String get backgroundImageUrl;
  @override
  bool get filtered;
  @override
  int? get appID;
  @override
  String? get localAppUUID;

  /// Create a copy of LibraryListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryListItemImplCopyWith<_$LibraryListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalLibrarySettings _$LocalLibrarySettingsFromJson(Map<String, dynamic> json) {
  return _LocalLibrarySettings.fromJson(json);
}

/// @nodoc
mixin _$LocalLibrarySettings {
  bool? get autoTrackSteamApps => throw _privateConstructorUsedError;

  /// Serializes this LocalLibrarySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalLibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalLibrarySettingsCopyWith<LocalLibrarySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalLibrarySettingsCopyWith<$Res> {
  factory $LocalLibrarySettingsCopyWith(LocalLibrarySettings value,
          $Res Function(LocalLibrarySettings) then) =
      _$LocalLibrarySettingsCopyWithImpl<$Res, LocalLibrarySettings>;
  @useResult
  $Res call({bool? autoTrackSteamApps});
}

/// @nodoc
class _$LocalLibrarySettingsCopyWithImpl<$Res,
        $Val extends LocalLibrarySettings>
    implements $LocalLibrarySettingsCopyWith<$Res> {
  _$LocalLibrarySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalLibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoTrackSteamApps = freezed,
  }) {
    return _then(_value.copyWith(
      autoTrackSteamApps: freezed == autoTrackSteamApps
          ? _value.autoTrackSteamApps
          : autoTrackSteamApps // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalLibrarySettingsImplCopyWith<$Res>
    implements $LocalLibrarySettingsCopyWith<$Res> {
  factory _$$LocalLibrarySettingsImplCopyWith(_$LocalLibrarySettingsImpl value,
          $Res Function(_$LocalLibrarySettingsImpl) then) =
      __$$LocalLibrarySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? autoTrackSteamApps});
}

/// @nodoc
class __$$LocalLibrarySettingsImplCopyWithImpl<$Res>
    extends _$LocalLibrarySettingsCopyWithImpl<$Res, _$LocalLibrarySettingsImpl>
    implements _$$LocalLibrarySettingsImplCopyWith<$Res> {
  __$$LocalLibrarySettingsImplCopyWithImpl(_$LocalLibrarySettingsImpl _value,
      $Res Function(_$LocalLibrarySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalLibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoTrackSteamApps = freezed,
  }) {
    return _then(_$LocalLibrarySettingsImpl(
      autoTrackSteamApps: freezed == autoTrackSteamApps
          ? _value.autoTrackSteamApps
          : autoTrackSteamApps // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalLibrarySettingsImpl implements _LocalLibrarySettings {
  const _$LocalLibrarySettingsImpl({required this.autoTrackSteamApps});

  factory _$LocalLibrarySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalLibrarySettingsImplFromJson(json);

  @override
  final bool? autoTrackSteamApps;

  @override
  String toString() {
    return 'LocalLibrarySettings(autoTrackSteamApps: $autoTrackSteamApps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalLibrarySettingsImpl &&
            (identical(other.autoTrackSteamApps, autoTrackSteamApps) ||
                other.autoTrackSteamApps == autoTrackSteamApps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, autoTrackSteamApps);

  /// Create a copy of LocalLibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalLibrarySettingsImplCopyWith<_$LocalLibrarySettingsImpl>
      get copyWith =>
          __$$LocalLibrarySettingsImplCopyWithImpl<_$LocalLibrarySettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalLibrarySettingsImplToJson(
      this,
    );
  }
}

abstract class _LocalLibrarySettings implements LocalLibrarySettings {
  const factory _LocalLibrarySettings(
      {required final bool? autoTrackSteamApps}) = _$LocalLibrarySettingsImpl;

  factory _LocalLibrarySettings.fromJson(Map<String, dynamic> json) =
      _$LocalLibrarySettingsImpl.fromJson;

  @override
  bool? get autoTrackSteamApps;

  /// Create a copy of LocalLibrarySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalLibrarySettingsImplCopyWith<_$LocalLibrarySettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocalTrackedApp _$LocalTrackedAppFromJson(Map<String, dynamic> json) {
  return _LocalTrackedApp.fromJson(json);
}

/// @nodoc
mixin _$LocalTrackedApp {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get lastLaunchedInstUUID => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  String? get iconImageUrl => throw _privateConstructorUsedError;
  String? get backgroundImageUrl => throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get developer => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;

  /// Serializes this LocalTrackedApp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalTrackedApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalTrackedAppCopyWith<LocalTrackedApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalTrackedAppCopyWith<$Res> {
  factory $LocalTrackedAppCopyWith(
          LocalTrackedApp value, $Res Function(LocalTrackedApp) then) =
      _$LocalTrackedAppCopyWithImpl<$Res, LocalTrackedApp>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? lastLaunchedInstUUID,
      String? shortDescription,
      String? iconImageUrl,
      String? backgroundImageUrl,
      String? coverImageUrl,
      String? description,
      String? releaseDate,
      String? developer,
      String? publisher,
      List<String>? imageUrls});
}

/// @nodoc
class _$LocalTrackedAppCopyWithImpl<$Res, $Val extends LocalTrackedApp>
    implements $LocalTrackedAppCopyWith<$Res> {
  _$LocalTrackedAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalTrackedApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? lastLaunchedInstUUID = freezed,
    Object? shortDescription = freezed,
    Object? iconImageUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? coverImageUrl = freezed,
    Object? description = freezed,
    Object? releaseDate = freezed,
    Object? developer = freezed,
    Object? publisher = freezed,
    Object? imageUrls = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastLaunchedInstUUID: freezed == lastLaunchedInstUUID
          ? _value.lastLaunchedInstUUID
          : lastLaunchedInstUUID // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      iconImageUrl: freezed == iconImageUrl
          ? _value.iconImageUrl
          : iconImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageUrl: freezed == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalTrackedAppImplCopyWith<$Res>
    implements $LocalTrackedAppCopyWith<$Res> {
  factory _$$LocalTrackedAppImplCopyWith(_$LocalTrackedAppImpl value,
          $Res Function(_$LocalTrackedAppImpl) then) =
      __$$LocalTrackedAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? lastLaunchedInstUUID,
      String? shortDescription,
      String? iconImageUrl,
      String? backgroundImageUrl,
      String? coverImageUrl,
      String? description,
      String? releaseDate,
      String? developer,
      String? publisher,
      List<String>? imageUrls});
}

/// @nodoc
class __$$LocalTrackedAppImplCopyWithImpl<$Res>
    extends _$LocalTrackedAppCopyWithImpl<$Res, _$LocalTrackedAppImpl>
    implements _$$LocalTrackedAppImplCopyWith<$Res> {
  __$$LocalTrackedAppImplCopyWithImpl(
      _$LocalTrackedAppImpl _value, $Res Function(_$LocalTrackedAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalTrackedApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? lastLaunchedInstUUID = freezed,
    Object? shortDescription = freezed,
    Object? iconImageUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? coverImageUrl = freezed,
    Object? description = freezed,
    Object? releaseDate = freezed,
    Object? developer = freezed,
    Object? publisher = freezed,
    Object? imageUrls = freezed,
  }) {
    return _then(_$LocalTrackedAppImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastLaunchedInstUUID: freezed == lastLaunchedInstUUID
          ? _value.lastLaunchedInstUUID
          : lastLaunchedInstUUID // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      iconImageUrl: freezed == iconImageUrl
          ? _value.iconImageUrl
          : iconImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageUrl: freezed == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalTrackedAppImpl implements _LocalTrackedApp {
  const _$LocalTrackedAppImpl(
      {required this.uuid,
      required this.name,
      this.lastLaunchedInstUUID,
      this.shortDescription,
      this.iconImageUrl,
      this.backgroundImageUrl,
      this.coverImageUrl,
      this.description,
      this.releaseDate,
      this.developer,
      this.publisher,
      final List<String>? imageUrls})
      : _imageUrls = imageUrls;

  factory _$LocalTrackedAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalTrackedAppImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String? lastLaunchedInstUUID;
  @override
  final String? shortDescription;
  @override
  final String? iconImageUrl;
  @override
  final String? backgroundImageUrl;
  @override
  final String? coverImageUrl;
  @override
  final String? description;
  @override
  final String? releaseDate;
  @override
  final String? developer;
  @override
  final String? publisher;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocalTrackedApp(uuid: $uuid, name: $name, lastLaunchedInstUUID: $lastLaunchedInstUUID, shortDescription: $shortDescription, iconImageUrl: $iconImageUrl, backgroundImageUrl: $backgroundImageUrl, coverImageUrl: $coverImageUrl, description: $description, releaseDate: $releaseDate, developer: $developer, publisher: $publisher, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalTrackedAppImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastLaunchedInstUUID, lastLaunchedInstUUID) ||
                other.lastLaunchedInstUUID == lastLaunchedInstUUID) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.iconImageUrl, iconImageUrl) ||
                other.iconImageUrl == iconImageUrl) &&
            (identical(other.backgroundImageUrl, backgroundImageUrl) ||
                other.backgroundImageUrl == backgroundImageUrl) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      lastLaunchedInstUUID,
      shortDescription,
      iconImageUrl,
      backgroundImageUrl,
      coverImageUrl,
      description,
      releaseDate,
      developer,
      publisher,
      const DeepCollectionEquality().hash(_imageUrls));

  /// Create a copy of LocalTrackedApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalTrackedAppImplCopyWith<_$LocalTrackedAppImpl> get copyWith =>
      __$$LocalTrackedAppImplCopyWithImpl<_$LocalTrackedAppImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalTrackedAppImplToJson(
      this,
    );
  }
}

abstract class _LocalTrackedApp implements LocalTrackedApp {
  const factory _LocalTrackedApp(
      {required final String uuid,
      required final String name,
      final String? lastLaunchedInstUUID,
      final String? shortDescription,
      final String? iconImageUrl,
      final String? backgroundImageUrl,
      final String? coverImageUrl,
      final String? description,
      final String? releaseDate,
      final String? developer,
      final String? publisher,
      final List<String>? imageUrls}) = _$LocalTrackedAppImpl;

  factory _LocalTrackedApp.fromJson(Map<String, dynamic> json) =
      _$LocalTrackedAppImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String? get lastLaunchedInstUUID;
  @override
  String? get shortDescription;
  @override
  String? get iconImageUrl;
  @override
  String? get backgroundImageUrl;
  @override
  String? get coverImageUrl;
  @override
  String? get description;
  @override
  String? get releaseDate;
  @override
  String? get developer;
  @override
  String? get publisher;
  @override
  List<String>? get imageUrls;

  /// Create a copy of LocalTrackedApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalTrackedAppImplCopyWith<_$LocalTrackedAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalTrackedAppInst _$LocalTrackedAppInstFromJson(Map<String, dynamic> json) {
  return _LocalTrackedAppInst.fromJson(json);
}

/// @nodoc
mixin _$LocalTrackedAppInst {
  String get uuid => throw _privateConstructorUsedError;
  String get appUUID => throw _privateConstructorUsedError;
  LocalAppInstType get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError; // launcher settings
  LocalCommonAppInstLaunchSetting? get commonLaunchSetting =>
      throw _privateConstructorUsedError;
  LocalSteamAppInstLaunchSetting? get steamLaunchSetting =>
      throw _privateConstructorUsedError; // launch record
  List<LocalAppInstRunRecord>? get runRecord =>
      throw _privateConstructorUsedError;

  /// Serializes this LocalTrackedAppInst to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalTrackedAppInstCopyWith<LocalTrackedAppInst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalTrackedAppInstCopyWith<$Res> {
  factory $LocalTrackedAppInstCopyWith(
          LocalTrackedAppInst value, $Res Function(LocalTrackedAppInst) then) =
      _$LocalTrackedAppInstCopyWithImpl<$Res, LocalTrackedAppInst>;
  @useResult
  $Res call(
      {String uuid,
      String appUUID,
      LocalAppInstType type,
      String? name,
      String path,
      String version,
      LocalCommonAppInstLaunchSetting? commonLaunchSetting,
      LocalSteamAppInstLaunchSetting? steamLaunchSetting,
      List<LocalAppInstRunRecord>? runRecord});

  $LocalCommonAppInstLaunchSettingCopyWith<$Res>? get commonLaunchSetting;
  $LocalSteamAppInstLaunchSettingCopyWith<$Res>? get steamLaunchSetting;
}

/// @nodoc
class _$LocalTrackedAppInstCopyWithImpl<$Res, $Val extends LocalTrackedAppInst>
    implements $LocalTrackedAppInstCopyWith<$Res> {
  _$LocalTrackedAppInstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? appUUID = null,
    Object? type = null,
    Object? name = freezed,
    Object? path = null,
    Object? version = null,
    Object? commonLaunchSetting = freezed,
    Object? steamLaunchSetting = freezed,
    Object? runRecord = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      appUUID: null == appUUID
          ? _value.appUUID
          : appUUID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LocalAppInstType,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      commonLaunchSetting: freezed == commonLaunchSetting
          ? _value.commonLaunchSetting
          : commonLaunchSetting // ignore: cast_nullable_to_non_nullable
              as LocalCommonAppInstLaunchSetting?,
      steamLaunchSetting: freezed == steamLaunchSetting
          ? _value.steamLaunchSetting
          : steamLaunchSetting // ignore: cast_nullable_to_non_nullable
              as LocalSteamAppInstLaunchSetting?,
      runRecord: freezed == runRecord
          ? _value.runRecord
          : runRecord // ignore: cast_nullable_to_non_nullable
              as List<LocalAppInstRunRecord>?,
    ) as $Val);
  }

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalCommonAppInstLaunchSettingCopyWith<$Res>? get commonLaunchSetting {
    if (_value.commonLaunchSetting == null) {
      return null;
    }

    return $LocalCommonAppInstLaunchSettingCopyWith<$Res>(
        _value.commonLaunchSetting!, (value) {
      return _then(_value.copyWith(commonLaunchSetting: value) as $Val);
    });
  }

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalSteamAppInstLaunchSettingCopyWith<$Res>? get steamLaunchSetting {
    if (_value.steamLaunchSetting == null) {
      return null;
    }

    return $LocalSteamAppInstLaunchSettingCopyWith<$Res>(
        _value.steamLaunchSetting!, (value) {
      return _then(_value.copyWith(steamLaunchSetting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalTrackedAppInstImplCopyWith<$Res>
    implements $LocalTrackedAppInstCopyWith<$Res> {
  factory _$$LocalTrackedAppInstImplCopyWith(_$LocalTrackedAppInstImpl value,
          $Res Function(_$LocalTrackedAppInstImpl) then) =
      __$$LocalTrackedAppInstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String appUUID,
      LocalAppInstType type,
      String? name,
      String path,
      String version,
      LocalCommonAppInstLaunchSetting? commonLaunchSetting,
      LocalSteamAppInstLaunchSetting? steamLaunchSetting,
      List<LocalAppInstRunRecord>? runRecord});

  @override
  $LocalCommonAppInstLaunchSettingCopyWith<$Res>? get commonLaunchSetting;
  @override
  $LocalSteamAppInstLaunchSettingCopyWith<$Res>? get steamLaunchSetting;
}

/// @nodoc
class __$$LocalTrackedAppInstImplCopyWithImpl<$Res>
    extends _$LocalTrackedAppInstCopyWithImpl<$Res, _$LocalTrackedAppInstImpl>
    implements _$$LocalTrackedAppInstImplCopyWith<$Res> {
  __$$LocalTrackedAppInstImplCopyWithImpl(_$LocalTrackedAppInstImpl _value,
      $Res Function(_$LocalTrackedAppInstImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? appUUID = null,
    Object? type = null,
    Object? name = freezed,
    Object? path = null,
    Object? version = null,
    Object? commonLaunchSetting = freezed,
    Object? steamLaunchSetting = freezed,
    Object? runRecord = freezed,
  }) {
    return _then(_$LocalTrackedAppInstImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      appUUID: null == appUUID
          ? _value.appUUID
          : appUUID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LocalAppInstType,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      commonLaunchSetting: freezed == commonLaunchSetting
          ? _value.commonLaunchSetting
          : commonLaunchSetting // ignore: cast_nullable_to_non_nullable
              as LocalCommonAppInstLaunchSetting?,
      steamLaunchSetting: freezed == steamLaunchSetting
          ? _value.steamLaunchSetting
          : steamLaunchSetting // ignore: cast_nullable_to_non_nullable
              as LocalSteamAppInstLaunchSetting?,
      runRecord: freezed == runRecord
          ? _value._runRecord
          : runRecord // ignore: cast_nullable_to_non_nullable
              as List<LocalAppInstRunRecord>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalTrackedAppInstImpl implements _LocalTrackedAppInst {
  const _$LocalTrackedAppInstImpl(
      {required this.uuid,
      required this.appUUID,
      required this.type,
      this.name,
      required this.path,
      this.version = '',
      this.commonLaunchSetting,
      this.steamLaunchSetting,
      final List<LocalAppInstRunRecord>? runRecord})
      : _runRecord = runRecord;

  factory _$LocalTrackedAppInstImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalTrackedAppInstImplFromJson(json);

  @override
  final String uuid;
  @override
  final String appUUID;
  @override
  final LocalAppInstType type;
  @override
  final String? name;
  @override
  final String path;
  @override
  @JsonKey()
  final String version;
// launcher settings
  @override
  final LocalCommonAppInstLaunchSetting? commonLaunchSetting;
  @override
  final LocalSteamAppInstLaunchSetting? steamLaunchSetting;
// launch record
  final List<LocalAppInstRunRecord>? _runRecord;
// launch record
  @override
  List<LocalAppInstRunRecord>? get runRecord {
    final value = _runRecord;
    if (value == null) return null;
    if (_runRecord is EqualUnmodifiableListView) return _runRecord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocalTrackedAppInst(uuid: $uuid, appUUID: $appUUID, type: $type, name: $name, path: $path, version: $version, commonLaunchSetting: $commonLaunchSetting, steamLaunchSetting: $steamLaunchSetting, runRecord: $runRecord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalTrackedAppInstImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.appUUID, appUUID) || other.appUUID == appUUID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.commonLaunchSetting, commonLaunchSetting) ||
                other.commonLaunchSetting == commonLaunchSetting) &&
            (identical(other.steamLaunchSetting, steamLaunchSetting) ||
                other.steamLaunchSetting == steamLaunchSetting) &&
            const DeepCollectionEquality()
                .equals(other._runRecord, _runRecord));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      appUUID,
      type,
      name,
      path,
      version,
      commonLaunchSetting,
      steamLaunchSetting,
      const DeepCollectionEquality().hash(_runRecord));

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalTrackedAppInstImplCopyWith<_$LocalTrackedAppInstImpl> get copyWith =>
      __$$LocalTrackedAppInstImplCopyWithImpl<_$LocalTrackedAppInstImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalTrackedAppInstImplToJson(
      this,
    );
  }
}

abstract class _LocalTrackedAppInst implements LocalTrackedAppInst {
  const factory _LocalTrackedAppInst(
          {required final String uuid,
          required final String appUUID,
          required final LocalAppInstType type,
          final String? name,
          required final String path,
          final String version,
          final LocalCommonAppInstLaunchSetting? commonLaunchSetting,
          final LocalSteamAppInstLaunchSetting? steamLaunchSetting,
          final List<LocalAppInstRunRecord>? runRecord}) =
      _$LocalTrackedAppInstImpl;

  factory _LocalTrackedAppInst.fromJson(Map<String, dynamic> json) =
      _$LocalTrackedAppInstImpl.fromJson;

  @override
  String get uuid;
  @override
  String get appUUID;
  @override
  LocalAppInstType get type;
  @override
  String? get name;
  @override
  String get path;
  @override
  String get version; // launcher settings
  @override
  LocalCommonAppInstLaunchSetting? get commonLaunchSetting;
  @override
  LocalSteamAppInstLaunchSetting? get steamLaunchSetting; // launch record
  @override
  List<LocalAppInstRunRecord>? get runRecord;

  /// Create a copy of LocalTrackedAppInst
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalTrackedAppInstImplCopyWith<_$LocalTrackedAppInstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalCommonAppInstLaunchSetting _$LocalCommonAppInstLaunchSettingFromJson(
    Map<String, dynamic> json) {
  return _LocalCommonAppInstLaunchSetting.fromJson(json);
}

/// @nodoc
mixin _$LocalCommonAppInstLaunchSetting {
  String get installPath => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  bool get advancedTracing => throw _privateConstructorUsedError;
  String get processName => throw _privateConstructorUsedError;
  String get realPath => throw _privateConstructorUsedError;
  int get sleepTime => throw _privateConstructorUsedError;

  /// Serializes this LocalCommonAppInstLaunchSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalCommonAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalCommonAppInstLaunchSettingCopyWith<LocalCommonAppInstLaunchSetting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCommonAppInstLaunchSettingCopyWith<$Res> {
  factory $LocalCommonAppInstLaunchSettingCopyWith(
          LocalCommonAppInstLaunchSetting value,
          $Res Function(LocalCommonAppInstLaunchSetting) then) =
      _$LocalCommonAppInstLaunchSettingCopyWithImpl<$Res,
          LocalCommonAppInstLaunchSetting>;
  @useResult
  $Res call(
      {String installPath,
      String path,
      bool advancedTracing,
      String processName,
      String realPath,
      int sleepTime});
}

/// @nodoc
class _$LocalCommonAppInstLaunchSettingCopyWithImpl<$Res,
        $Val extends LocalCommonAppInstLaunchSetting>
    implements $LocalCommonAppInstLaunchSettingCopyWith<$Res> {
  _$LocalCommonAppInstLaunchSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalCommonAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installPath = null,
    Object? path = null,
    Object? advancedTracing = null,
    Object? processName = null,
    Object? realPath = null,
    Object? sleepTime = null,
  }) {
    return _then(_value.copyWith(
      installPath: null == installPath
          ? _value.installPath
          : installPath // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      advancedTracing: null == advancedTracing
          ? _value.advancedTracing
          : advancedTracing // ignore: cast_nullable_to_non_nullable
              as bool,
      processName: null == processName
          ? _value.processName
          : processName // ignore: cast_nullable_to_non_nullable
              as String,
      realPath: null == realPath
          ? _value.realPath
          : realPath // ignore: cast_nullable_to_non_nullable
              as String,
      sleepTime: null == sleepTime
          ? _value.sleepTime
          : sleepTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalCommonAppInstLaunchSettingImplCopyWith<$Res>
    implements $LocalCommonAppInstLaunchSettingCopyWith<$Res> {
  factory _$$LocalCommonAppInstLaunchSettingImplCopyWith(
          _$LocalCommonAppInstLaunchSettingImpl value,
          $Res Function(_$LocalCommonAppInstLaunchSettingImpl) then) =
      __$$LocalCommonAppInstLaunchSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String installPath,
      String path,
      bool advancedTracing,
      String processName,
      String realPath,
      int sleepTime});
}

/// @nodoc
class __$$LocalCommonAppInstLaunchSettingImplCopyWithImpl<$Res>
    extends _$LocalCommonAppInstLaunchSettingCopyWithImpl<$Res,
        _$LocalCommonAppInstLaunchSettingImpl>
    implements _$$LocalCommonAppInstLaunchSettingImplCopyWith<$Res> {
  __$$LocalCommonAppInstLaunchSettingImplCopyWithImpl(
      _$LocalCommonAppInstLaunchSettingImpl _value,
      $Res Function(_$LocalCommonAppInstLaunchSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalCommonAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installPath = null,
    Object? path = null,
    Object? advancedTracing = null,
    Object? processName = null,
    Object? realPath = null,
    Object? sleepTime = null,
  }) {
    return _then(_$LocalCommonAppInstLaunchSettingImpl(
      installPath: null == installPath
          ? _value.installPath
          : installPath // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      advancedTracing: null == advancedTracing
          ? _value.advancedTracing
          : advancedTracing // ignore: cast_nullable_to_non_nullable
              as bool,
      processName: null == processName
          ? _value.processName
          : processName // ignore: cast_nullable_to_non_nullable
              as String,
      realPath: null == realPath
          ? _value.realPath
          : realPath // ignore: cast_nullable_to_non_nullable
              as String,
      sleepTime: null == sleepTime
          ? _value.sleepTime
          : sleepTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalCommonAppInstLaunchSettingImpl
    implements _LocalCommonAppInstLaunchSetting {
  const _$LocalCommonAppInstLaunchSettingImpl(
      {required this.installPath,
      required this.path,
      required this.advancedTracing,
      required this.processName,
      required this.realPath,
      required this.sleepTime});

  factory _$LocalCommonAppInstLaunchSettingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LocalCommonAppInstLaunchSettingImplFromJson(json);

  @override
  final String installPath;
  @override
  final String path;
  @override
  final bool advancedTracing;
  @override
  final String processName;
  @override
  final String realPath;
  @override
  final int sleepTime;

  @override
  String toString() {
    return 'LocalCommonAppInstLaunchSetting(installPath: $installPath, path: $path, advancedTracing: $advancedTracing, processName: $processName, realPath: $realPath, sleepTime: $sleepTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalCommonAppInstLaunchSettingImpl &&
            (identical(other.installPath, installPath) ||
                other.installPath == installPath) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.advancedTracing, advancedTracing) ||
                other.advancedTracing == advancedTracing) &&
            (identical(other.processName, processName) ||
                other.processName == processName) &&
            (identical(other.realPath, realPath) ||
                other.realPath == realPath) &&
            (identical(other.sleepTime, sleepTime) ||
                other.sleepTime == sleepTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, installPath, path,
      advancedTracing, processName, realPath, sleepTime);

  /// Create a copy of LocalCommonAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalCommonAppInstLaunchSettingImplCopyWith<
          _$LocalCommonAppInstLaunchSettingImpl>
      get copyWith => __$$LocalCommonAppInstLaunchSettingImplCopyWithImpl<
          _$LocalCommonAppInstLaunchSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalCommonAppInstLaunchSettingImplToJson(
      this,
    );
  }
}

abstract class _LocalCommonAppInstLaunchSetting
    implements LocalCommonAppInstLaunchSetting {
  const factory _LocalCommonAppInstLaunchSetting(
      {required final String installPath,
      required final String path,
      required final bool advancedTracing,
      required final String processName,
      required final String realPath,
      required final int sleepTime}) = _$LocalCommonAppInstLaunchSettingImpl;

  factory _LocalCommonAppInstLaunchSetting.fromJson(Map<String, dynamic> json) =
      _$LocalCommonAppInstLaunchSettingImpl.fromJson;

  @override
  String get installPath;
  @override
  String get path;
  @override
  bool get advancedTracing;
  @override
  String get processName;
  @override
  String get realPath;
  @override
  int get sleepTime;

  /// Create a copy of LocalCommonAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalCommonAppInstLaunchSettingImplCopyWith<
          _$LocalCommonAppInstLaunchSettingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocalSteamAppInstLaunchSetting _$LocalSteamAppInstLaunchSettingFromJson(
    Map<String, dynamic> json) {
  return _LocalSteamAppInstLaunchSetting.fromJson(json);
}

/// @nodoc
mixin _$LocalSteamAppInstLaunchSetting {
  String get steamAppID => throw _privateConstructorUsedError;
  String get launchOptions => throw _privateConstructorUsedError;

  /// Serializes this LocalSteamAppInstLaunchSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalSteamAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalSteamAppInstLaunchSettingCopyWith<LocalSteamAppInstLaunchSetting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalSteamAppInstLaunchSettingCopyWith<$Res> {
  factory $LocalSteamAppInstLaunchSettingCopyWith(
          LocalSteamAppInstLaunchSetting value,
          $Res Function(LocalSteamAppInstLaunchSetting) then) =
      _$LocalSteamAppInstLaunchSettingCopyWithImpl<$Res,
          LocalSteamAppInstLaunchSetting>;
  @useResult
  $Res call({String steamAppID, String launchOptions});
}

/// @nodoc
class _$LocalSteamAppInstLaunchSettingCopyWithImpl<$Res,
        $Val extends LocalSteamAppInstLaunchSetting>
    implements $LocalSteamAppInstLaunchSettingCopyWith<$Res> {
  _$LocalSteamAppInstLaunchSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalSteamAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steamAppID = null,
    Object? launchOptions = null,
  }) {
    return _then(_value.copyWith(
      steamAppID: null == steamAppID
          ? _value.steamAppID
          : steamAppID // ignore: cast_nullable_to_non_nullable
              as String,
      launchOptions: null == launchOptions
          ? _value.launchOptions
          : launchOptions // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalSteamAppInstLaunchSettingImplCopyWith<$Res>
    implements $LocalSteamAppInstLaunchSettingCopyWith<$Res> {
  factory _$$LocalSteamAppInstLaunchSettingImplCopyWith(
          _$LocalSteamAppInstLaunchSettingImpl value,
          $Res Function(_$LocalSteamAppInstLaunchSettingImpl) then) =
      __$$LocalSteamAppInstLaunchSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String steamAppID, String launchOptions});
}

/// @nodoc
class __$$LocalSteamAppInstLaunchSettingImplCopyWithImpl<$Res>
    extends _$LocalSteamAppInstLaunchSettingCopyWithImpl<$Res,
        _$LocalSteamAppInstLaunchSettingImpl>
    implements _$$LocalSteamAppInstLaunchSettingImplCopyWith<$Res> {
  __$$LocalSteamAppInstLaunchSettingImplCopyWithImpl(
      _$LocalSteamAppInstLaunchSettingImpl _value,
      $Res Function(_$LocalSteamAppInstLaunchSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalSteamAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steamAppID = null,
    Object? launchOptions = null,
  }) {
    return _then(_$LocalSteamAppInstLaunchSettingImpl(
      steamAppID: null == steamAppID
          ? _value.steamAppID
          : steamAppID // ignore: cast_nullable_to_non_nullable
              as String,
      launchOptions: null == launchOptions
          ? _value.launchOptions
          : launchOptions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalSteamAppInstLaunchSettingImpl
    implements _LocalSteamAppInstLaunchSetting {
  const _$LocalSteamAppInstLaunchSettingImpl(
      {required this.steamAppID, required this.launchOptions});

  factory _$LocalSteamAppInstLaunchSettingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LocalSteamAppInstLaunchSettingImplFromJson(json);

  @override
  final String steamAppID;
  @override
  final String launchOptions;

  @override
  String toString() {
    return 'LocalSteamAppInstLaunchSetting(steamAppID: $steamAppID, launchOptions: $launchOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalSteamAppInstLaunchSettingImpl &&
            (identical(other.steamAppID, steamAppID) ||
                other.steamAppID == steamAppID) &&
            (identical(other.launchOptions, launchOptions) ||
                other.launchOptions == launchOptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, steamAppID, launchOptions);

  /// Create a copy of LocalSteamAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalSteamAppInstLaunchSettingImplCopyWith<
          _$LocalSteamAppInstLaunchSettingImpl>
      get copyWith => __$$LocalSteamAppInstLaunchSettingImplCopyWithImpl<
          _$LocalSteamAppInstLaunchSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalSteamAppInstLaunchSettingImplToJson(
      this,
    );
  }
}

abstract class _LocalSteamAppInstLaunchSetting
    implements LocalSteamAppInstLaunchSetting {
  const factory _LocalSteamAppInstLaunchSetting(
          {required final String steamAppID,
          required final String launchOptions}) =
      _$LocalSteamAppInstLaunchSettingImpl;

  factory _LocalSteamAppInstLaunchSetting.fromJson(Map<String, dynamic> json) =
      _$LocalSteamAppInstLaunchSettingImpl.fromJson;

  @override
  String get steamAppID;
  @override
  String get launchOptions;

  /// Create a copy of LocalSteamAppInstLaunchSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalSteamAppInstLaunchSettingImplCopyWith<
          _$LocalSteamAppInstLaunchSettingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocalAppInstRunRecord _$LocalAppInstRunRecordFromJson(
    Map<String, dynamic> json) {
  return _LocalAppInstRunRecord.fromJson(json);
}

/// @nodoc
mixin _$LocalAppInstRunRecord {
  String get uuid => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Serializes this LocalAppInstRunRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalAppInstRunRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalAppInstRunRecordCopyWith<LocalAppInstRunRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAppInstRunRecordCopyWith<$Res> {
  factory $LocalAppInstRunRecordCopyWith(LocalAppInstRunRecord value,
          $Res Function(LocalAppInstRunRecord) then) =
      _$LocalAppInstRunRecordCopyWithImpl<$Res, LocalAppInstRunRecord>;
  @useResult
  $Res call({String uuid, DateTime? startTime, DateTime? endTime});
}

/// @nodoc
class _$LocalAppInstRunRecordCopyWithImpl<$Res,
        $Val extends LocalAppInstRunRecord>
    implements $LocalAppInstRunRecordCopyWith<$Res> {
  _$LocalAppInstRunRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalAppInstRunRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalAppInstRunRecordImplCopyWith<$Res>
    implements $LocalAppInstRunRecordCopyWith<$Res> {
  factory _$$LocalAppInstRunRecordImplCopyWith(
          _$LocalAppInstRunRecordImpl value,
          $Res Function(_$LocalAppInstRunRecordImpl) then) =
      __$$LocalAppInstRunRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, DateTime? startTime, DateTime? endTime});
}

/// @nodoc
class __$$LocalAppInstRunRecordImplCopyWithImpl<$Res>
    extends _$LocalAppInstRunRecordCopyWithImpl<$Res,
        _$LocalAppInstRunRecordImpl>
    implements _$$LocalAppInstRunRecordImplCopyWith<$Res> {
  __$$LocalAppInstRunRecordImplCopyWithImpl(_$LocalAppInstRunRecordImpl _value,
      $Res Function(_$LocalAppInstRunRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAppInstRunRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$LocalAppInstRunRecordImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalAppInstRunRecordImpl implements _LocalAppInstRunRecord {
  const _$LocalAppInstRunRecordImpl(
      {required this.uuid, required this.startTime, required this.endTime});

  factory _$LocalAppInstRunRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalAppInstRunRecordImplFromJson(json);

  @override
  final String uuid;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;

  @override
  String toString() {
    return 'LocalAppInstRunRecord(uuid: $uuid, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAppInstRunRecordImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, startTime, endTime);

  /// Create a copy of LocalAppInstRunRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAppInstRunRecordImplCopyWith<_$LocalAppInstRunRecordImpl>
      get copyWith => __$$LocalAppInstRunRecordImplCopyWithImpl<
          _$LocalAppInstRunRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalAppInstRunRecordImplToJson(
      this,
    );
  }
}

abstract class _LocalAppInstRunRecord implements LocalAppInstRunRecord {
  const factory _LocalAppInstRunRecord(
      {required final String uuid,
      required final DateTime? startTime,
      required final DateTime? endTime}) = _$LocalAppInstRunRecordImpl;

  factory _LocalAppInstRunRecord.fromJson(Map<String, dynamic> json) =
      _$LocalAppInstRunRecordImpl.fromJson;

  @override
  String get uuid;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;

  /// Create a copy of LocalAppInstRunRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalAppInstRunRecordImplCopyWith<_$LocalAppInstRunRecordImpl>
      get copyWith => throw _privateConstructorUsedError;
}
