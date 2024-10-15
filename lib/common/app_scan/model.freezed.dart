// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonAppFolderScanSetting _$CommonAppFolderScanSettingFromJson(
    Map<String, dynamic> json) {
  return _CommonAppFolderScanSetting.fromJson(json);
}

/// @nodoc
mixin _$CommonAppFolderScanSetting {
// base path
  String get basePath =>
      throw _privateConstructorUsedError; // install dir matcher
  List<String> get excludeDirectoryMatchers =>
      throw _privateConstructorUsedError; // walk
  int get minInstallDirDepth => throw _privateConstructorUsedError; // build
  int get maxInstallDirDepth => throw _privateConstructorUsedError; // build
  List<CommonAppFolderScanPathFieldMatcher> get pathFieldMatcher =>
      throw _privateConstructorUsedError; // build
  CommonAppFolderScanPathFieldMatcherAlignment get pathFieldMatcherAlignment =>
      throw _privateConstructorUsedError; // build
  List<String> get includeExecutableMatchers =>
      throw _privateConstructorUsedError; // walk
  List<String> get excludeExecutableMatchers =>
      throw _privateConstructorUsedError; // walk
// extra executable file matcher
  int get minExecutableDepth => throw _privateConstructorUsedError; // build
  int get maxExecutableDepth => throw _privateConstructorUsedError;

  /// Serializes this CommonAppFolderScanSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonAppFolderScanSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonAppFolderScanSettingCopyWith<CommonAppFolderScanSetting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonAppFolderScanSettingCopyWith<$Res> {
  factory $CommonAppFolderScanSettingCopyWith(CommonAppFolderScanSetting value,
          $Res Function(CommonAppFolderScanSetting) then) =
      _$CommonAppFolderScanSettingCopyWithImpl<$Res,
          CommonAppFolderScanSetting>;
  @useResult
  $Res call(
      {String basePath,
      List<String> excludeDirectoryMatchers,
      int minInstallDirDepth,
      int maxInstallDirDepth,
      List<CommonAppFolderScanPathFieldMatcher> pathFieldMatcher,
      CommonAppFolderScanPathFieldMatcherAlignment pathFieldMatcherAlignment,
      List<String> includeExecutableMatchers,
      List<String> excludeExecutableMatchers,
      int minExecutableDepth,
      int maxExecutableDepth});
}

/// @nodoc
class _$CommonAppFolderScanSettingCopyWithImpl<$Res,
        $Val extends CommonAppFolderScanSetting>
    implements $CommonAppFolderScanSettingCopyWith<$Res> {
  _$CommonAppFolderScanSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonAppFolderScanSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePath = null,
    Object? excludeDirectoryMatchers = null,
    Object? minInstallDirDepth = null,
    Object? maxInstallDirDepth = null,
    Object? pathFieldMatcher = null,
    Object? pathFieldMatcherAlignment = null,
    Object? includeExecutableMatchers = null,
    Object? excludeExecutableMatchers = null,
    Object? minExecutableDepth = null,
    Object? maxExecutableDepth = null,
  }) {
    return _then(_value.copyWith(
      basePath: null == basePath
          ? _value.basePath
          : basePath // ignore: cast_nullable_to_non_nullable
              as String,
      excludeDirectoryMatchers: null == excludeDirectoryMatchers
          ? _value.excludeDirectoryMatchers
          : excludeDirectoryMatchers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minInstallDirDepth: null == minInstallDirDepth
          ? _value.minInstallDirDepth
          : minInstallDirDepth // ignore: cast_nullable_to_non_nullable
              as int,
      maxInstallDirDepth: null == maxInstallDirDepth
          ? _value.maxInstallDirDepth
          : maxInstallDirDepth // ignore: cast_nullable_to_non_nullable
              as int,
      pathFieldMatcher: null == pathFieldMatcher
          ? _value.pathFieldMatcher
          : pathFieldMatcher // ignore: cast_nullable_to_non_nullable
              as List<CommonAppFolderScanPathFieldMatcher>,
      pathFieldMatcherAlignment: null == pathFieldMatcherAlignment
          ? _value.pathFieldMatcherAlignment
          : pathFieldMatcherAlignment // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanPathFieldMatcherAlignment,
      includeExecutableMatchers: null == includeExecutableMatchers
          ? _value.includeExecutableMatchers
          : includeExecutableMatchers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      excludeExecutableMatchers: null == excludeExecutableMatchers
          ? _value.excludeExecutableMatchers
          : excludeExecutableMatchers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minExecutableDepth: null == minExecutableDepth
          ? _value.minExecutableDepth
          : minExecutableDepth // ignore: cast_nullable_to_non_nullable
              as int,
      maxExecutableDepth: null == maxExecutableDepth
          ? _value.maxExecutableDepth
          : maxExecutableDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonAppFolderScanSettingImplCopyWith<$Res>
    implements $CommonAppFolderScanSettingCopyWith<$Res> {
  factory _$$CommonAppFolderScanSettingImplCopyWith(
          _$CommonAppFolderScanSettingImpl value,
          $Res Function(_$CommonAppFolderScanSettingImpl) then) =
      __$$CommonAppFolderScanSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String basePath,
      List<String> excludeDirectoryMatchers,
      int minInstallDirDepth,
      int maxInstallDirDepth,
      List<CommonAppFolderScanPathFieldMatcher> pathFieldMatcher,
      CommonAppFolderScanPathFieldMatcherAlignment pathFieldMatcherAlignment,
      List<String> includeExecutableMatchers,
      List<String> excludeExecutableMatchers,
      int minExecutableDepth,
      int maxExecutableDepth});
}

/// @nodoc
class __$$CommonAppFolderScanSettingImplCopyWithImpl<$Res>
    extends _$CommonAppFolderScanSettingCopyWithImpl<$Res,
        _$CommonAppFolderScanSettingImpl>
    implements _$$CommonAppFolderScanSettingImplCopyWith<$Res> {
  __$$CommonAppFolderScanSettingImplCopyWithImpl(
      _$CommonAppFolderScanSettingImpl _value,
      $Res Function(_$CommonAppFolderScanSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonAppFolderScanSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePath = null,
    Object? excludeDirectoryMatchers = null,
    Object? minInstallDirDepth = null,
    Object? maxInstallDirDepth = null,
    Object? pathFieldMatcher = null,
    Object? pathFieldMatcherAlignment = null,
    Object? includeExecutableMatchers = null,
    Object? excludeExecutableMatchers = null,
    Object? minExecutableDepth = null,
    Object? maxExecutableDepth = null,
  }) {
    return _then(_$CommonAppFolderScanSettingImpl(
      basePath: null == basePath
          ? _value.basePath
          : basePath // ignore: cast_nullable_to_non_nullable
              as String,
      excludeDirectoryMatchers: null == excludeDirectoryMatchers
          ? _value._excludeDirectoryMatchers
          : excludeDirectoryMatchers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minInstallDirDepth: null == minInstallDirDepth
          ? _value.minInstallDirDepth
          : minInstallDirDepth // ignore: cast_nullable_to_non_nullable
              as int,
      maxInstallDirDepth: null == maxInstallDirDepth
          ? _value.maxInstallDirDepth
          : maxInstallDirDepth // ignore: cast_nullable_to_non_nullable
              as int,
      pathFieldMatcher: null == pathFieldMatcher
          ? _value._pathFieldMatcher
          : pathFieldMatcher // ignore: cast_nullable_to_non_nullable
              as List<CommonAppFolderScanPathFieldMatcher>,
      pathFieldMatcherAlignment: null == pathFieldMatcherAlignment
          ? _value.pathFieldMatcherAlignment
          : pathFieldMatcherAlignment // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanPathFieldMatcherAlignment,
      includeExecutableMatchers: null == includeExecutableMatchers
          ? _value._includeExecutableMatchers
          : includeExecutableMatchers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      excludeExecutableMatchers: null == excludeExecutableMatchers
          ? _value._excludeExecutableMatchers
          : excludeExecutableMatchers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minExecutableDepth: null == minExecutableDepth
          ? _value.minExecutableDepth
          : minExecutableDepth // ignore: cast_nullable_to_non_nullable
              as int,
      maxExecutableDepth: null == maxExecutableDepth
          ? _value.maxExecutableDepth
          : maxExecutableDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonAppFolderScanSettingImpl implements _CommonAppFolderScanSetting {
  const _$CommonAppFolderScanSettingImpl(
      {required this.basePath,
      required final List<String> excludeDirectoryMatchers,
      required this.minInstallDirDepth,
      required this.maxInstallDirDepth,
      required final List<CommonAppFolderScanPathFieldMatcher> pathFieldMatcher,
      required this.pathFieldMatcherAlignment,
      required final List<String> includeExecutableMatchers,
      required final List<String> excludeExecutableMatchers,
      required this.minExecutableDepth,
      required this.maxExecutableDepth})
      : _excludeDirectoryMatchers = excludeDirectoryMatchers,
        _pathFieldMatcher = pathFieldMatcher,
        _includeExecutableMatchers = includeExecutableMatchers,
        _excludeExecutableMatchers = excludeExecutableMatchers;

  factory _$CommonAppFolderScanSettingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CommonAppFolderScanSettingImplFromJson(json);

// base path
  @override
  final String basePath;
// install dir matcher
  final List<String> _excludeDirectoryMatchers;
// install dir matcher
  @override
  List<String> get excludeDirectoryMatchers {
    if (_excludeDirectoryMatchers is EqualUnmodifiableListView)
      return _excludeDirectoryMatchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludeDirectoryMatchers);
  }

// walk
  @override
  final int minInstallDirDepth;
// build
  @override
  final int maxInstallDirDepth;
// build
  final List<CommonAppFolderScanPathFieldMatcher> _pathFieldMatcher;
// build
  @override
  List<CommonAppFolderScanPathFieldMatcher> get pathFieldMatcher {
    if (_pathFieldMatcher is EqualUnmodifiableListView)
      return _pathFieldMatcher;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathFieldMatcher);
  }

// build
  @override
  final CommonAppFolderScanPathFieldMatcherAlignment pathFieldMatcherAlignment;
// build
  final List<String> _includeExecutableMatchers;
// build
  @override
  List<String> get includeExecutableMatchers {
    if (_includeExecutableMatchers is EqualUnmodifiableListView)
      return _includeExecutableMatchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_includeExecutableMatchers);
  }

// walk
  final List<String> _excludeExecutableMatchers;
// walk
  @override
  List<String> get excludeExecutableMatchers {
    if (_excludeExecutableMatchers is EqualUnmodifiableListView)
      return _excludeExecutableMatchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludeExecutableMatchers);
  }

// walk
// extra executable file matcher
  @override
  final int minExecutableDepth;
// build
  @override
  final int maxExecutableDepth;

  @override
  String toString() {
    return 'CommonAppFolderScanSetting(basePath: $basePath, excludeDirectoryMatchers: $excludeDirectoryMatchers, minInstallDirDepth: $minInstallDirDepth, maxInstallDirDepth: $maxInstallDirDepth, pathFieldMatcher: $pathFieldMatcher, pathFieldMatcherAlignment: $pathFieldMatcherAlignment, includeExecutableMatchers: $includeExecutableMatchers, excludeExecutableMatchers: $excludeExecutableMatchers, minExecutableDepth: $minExecutableDepth, maxExecutableDepth: $maxExecutableDepth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonAppFolderScanSettingImpl &&
            (identical(other.basePath, basePath) ||
                other.basePath == basePath) &&
            const DeepCollectionEquality().equals(
                other._excludeDirectoryMatchers, _excludeDirectoryMatchers) &&
            (identical(other.minInstallDirDepth, minInstallDirDepth) ||
                other.minInstallDirDepth == minInstallDirDepth) &&
            (identical(other.maxInstallDirDepth, maxInstallDirDepth) ||
                other.maxInstallDirDepth == maxInstallDirDepth) &&
            const DeepCollectionEquality()
                .equals(other._pathFieldMatcher, _pathFieldMatcher) &&
            (identical(other.pathFieldMatcherAlignment,
                    pathFieldMatcherAlignment) ||
                other.pathFieldMatcherAlignment == pathFieldMatcherAlignment) &&
            const DeepCollectionEquality().equals(
                other._includeExecutableMatchers, _includeExecutableMatchers) &&
            const DeepCollectionEquality().equals(
                other._excludeExecutableMatchers, _excludeExecutableMatchers) &&
            (identical(other.minExecutableDepth, minExecutableDepth) ||
                other.minExecutableDepth == minExecutableDepth) &&
            (identical(other.maxExecutableDepth, maxExecutableDepth) ||
                other.maxExecutableDepth == maxExecutableDepth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      basePath,
      const DeepCollectionEquality().hash(_excludeDirectoryMatchers),
      minInstallDirDepth,
      maxInstallDirDepth,
      const DeepCollectionEquality().hash(_pathFieldMatcher),
      pathFieldMatcherAlignment,
      const DeepCollectionEquality().hash(_includeExecutableMatchers),
      const DeepCollectionEquality().hash(_excludeExecutableMatchers),
      minExecutableDepth,
      maxExecutableDepth);

  /// Create a copy of CommonAppFolderScanSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonAppFolderScanSettingImplCopyWith<_$CommonAppFolderScanSettingImpl>
      get copyWith => __$$CommonAppFolderScanSettingImplCopyWithImpl<
          _$CommonAppFolderScanSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonAppFolderScanSettingImplToJson(
      this,
    );
  }
}

abstract class _CommonAppFolderScanSetting
    implements CommonAppFolderScanSetting {
  const factory _CommonAppFolderScanSetting(
      {required final String basePath,
      required final List<String> excludeDirectoryMatchers,
      required final int minInstallDirDepth,
      required final int maxInstallDirDepth,
      required final List<CommonAppFolderScanPathFieldMatcher> pathFieldMatcher,
      required final CommonAppFolderScanPathFieldMatcherAlignment
          pathFieldMatcherAlignment,
      required final List<String> includeExecutableMatchers,
      required final List<String> excludeExecutableMatchers,
      required final int minExecutableDepth,
      required final int
          maxExecutableDepth}) = _$CommonAppFolderScanSettingImpl;

  factory _CommonAppFolderScanSetting.fromJson(Map<String, dynamic> json) =
      _$CommonAppFolderScanSettingImpl.fromJson;

// base path
  @override
  String get basePath; // install dir matcher
  @override
  List<String> get excludeDirectoryMatchers; // walk
  @override
  int get minInstallDirDepth; // build
  @override
  int get maxInstallDirDepth; // build
  @override
  List<CommonAppFolderScanPathFieldMatcher> get pathFieldMatcher; // build
  @override
  CommonAppFolderScanPathFieldMatcherAlignment
      get pathFieldMatcherAlignment; // build
  @override
  List<String> get includeExecutableMatchers; // walk
  @override
  List<String> get excludeExecutableMatchers; // walk
// extra executable file matcher
  @override
  int get minExecutableDepth; // build
  @override
  int get maxExecutableDepth;

  /// Create a copy of CommonAppFolderScanSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonAppFolderScanSettingImplCopyWith<_$CommonAppFolderScanSettingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommonAppFolderScanResult _$CommonAppFolderScanResultFromJson(
    Map<String, dynamic> json) {
  return _CommonAppFolderScanResult.fromJson(json);
}

/// @nodoc
mixin _$CommonAppFolderScanResult {
  List<InstalledCommonApps> get installedApps =>
      throw _privateConstructorUsedError;
  List<CommonAppFolderScanResultDetail> get details =>
      throw _privateConstructorUsedError;
  CommonAppFolderScanResultCode get code => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  /// Serializes this CommonAppFolderScanResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonAppFolderScanResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonAppFolderScanResultCopyWith<CommonAppFolderScanResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonAppFolderScanResultCopyWith<$Res> {
  factory $CommonAppFolderScanResultCopyWith(CommonAppFolderScanResult value,
          $Res Function(CommonAppFolderScanResult) then) =
      _$CommonAppFolderScanResultCopyWithImpl<$Res, CommonAppFolderScanResult>;
  @useResult
  $Res call(
      {List<InstalledCommonApps> installedApps,
      List<CommonAppFolderScanResultDetail> details,
      CommonAppFolderScanResultCode code,
      String? msg});
}

/// @nodoc
class _$CommonAppFolderScanResultCopyWithImpl<$Res,
        $Val extends CommonAppFolderScanResult>
    implements $CommonAppFolderScanResultCopyWith<$Res> {
  _$CommonAppFolderScanResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonAppFolderScanResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installedApps = null,
    Object? details = null,
    Object? code = null,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      installedApps: null == installedApps
          ? _value.installedApps
          : installedApps // ignore: cast_nullable_to_non_nullable
              as List<InstalledCommonApps>,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<CommonAppFolderScanResultDetail>,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanResultCode,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonAppFolderScanResultImplCopyWith<$Res>
    implements $CommonAppFolderScanResultCopyWith<$Res> {
  factory _$$CommonAppFolderScanResultImplCopyWith(
          _$CommonAppFolderScanResultImpl value,
          $Res Function(_$CommonAppFolderScanResultImpl) then) =
      __$$CommonAppFolderScanResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<InstalledCommonApps> installedApps,
      List<CommonAppFolderScanResultDetail> details,
      CommonAppFolderScanResultCode code,
      String? msg});
}

/// @nodoc
class __$$CommonAppFolderScanResultImplCopyWithImpl<$Res>
    extends _$CommonAppFolderScanResultCopyWithImpl<$Res,
        _$CommonAppFolderScanResultImpl>
    implements _$$CommonAppFolderScanResultImplCopyWith<$Res> {
  __$$CommonAppFolderScanResultImplCopyWithImpl(
      _$CommonAppFolderScanResultImpl _value,
      $Res Function(_$CommonAppFolderScanResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonAppFolderScanResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installedApps = null,
    Object? details = null,
    Object? code = null,
    Object? msg = freezed,
  }) {
    return _then(_$CommonAppFolderScanResultImpl(
      installedApps: null == installedApps
          ? _value._installedApps
          : installedApps // ignore: cast_nullable_to_non_nullable
              as List<InstalledCommonApps>,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<CommonAppFolderScanResultDetail>,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanResultCode,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonAppFolderScanResultImpl implements _CommonAppFolderScanResult {
  const _$CommonAppFolderScanResultImpl(
      {required final List<InstalledCommonApps> installedApps,
      required final List<CommonAppFolderScanResultDetail> details,
      required this.code,
      this.msg})
      : _installedApps = installedApps,
        _details = details;

  factory _$CommonAppFolderScanResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonAppFolderScanResultImplFromJson(json);

  final List<InstalledCommonApps> _installedApps;
  @override
  List<InstalledCommonApps> get installedApps {
    if (_installedApps is EqualUnmodifiableListView) return _installedApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_installedApps);
  }

  final List<CommonAppFolderScanResultDetail> _details;
  @override
  List<CommonAppFolderScanResultDetail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final CommonAppFolderScanResultCode code;
  @override
  final String? msg;

  @override
  String toString() {
    return 'CommonAppFolderScanResult(installedApps: $installedApps, details: $details, code: $code, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonAppFolderScanResultImpl &&
            const DeepCollectionEquality()
                .equals(other._installedApps, _installedApps) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_installedApps),
      const DeepCollectionEquality().hash(_details),
      code,
      msg);

  /// Create a copy of CommonAppFolderScanResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonAppFolderScanResultImplCopyWith<_$CommonAppFolderScanResultImpl>
      get copyWith => __$$CommonAppFolderScanResultImplCopyWithImpl<
          _$CommonAppFolderScanResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonAppFolderScanResultImplToJson(
      this,
    );
  }
}

abstract class _CommonAppFolderScanResult implements CommonAppFolderScanResult {
  const factory _CommonAppFolderScanResult(
      {required final List<InstalledCommonApps> installedApps,
      required final List<CommonAppFolderScanResultDetail> details,
      required final CommonAppFolderScanResultCode code,
      final String? msg}) = _$CommonAppFolderScanResultImpl;

  factory _CommonAppFolderScanResult.fromJson(Map<String, dynamic> json) =
      _$CommonAppFolderScanResultImpl.fromJson;

  @override
  List<InstalledCommonApps> get installedApps;
  @override
  List<CommonAppFolderScanResultDetail> get details;
  @override
  CommonAppFolderScanResultCode get code;
  @override
  String? get msg;

  /// Create a copy of CommonAppFolderScanResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonAppFolderScanResultImplCopyWith<_$CommonAppFolderScanResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommonAppFolderScanResultDetail _$CommonAppFolderScanResultDetailFromJson(
    Map<String, dynamic> json) {
  return _CommonAppFolderScanResultDetail.fromJson(json);
}

/// @nodoc
mixin _$CommonAppFolderScanResultDetail {
  String get path => throw _privateConstructorUsedError;
  CommonAppFolderScanEntryType get type => throw _privateConstructorUsedError;
  CommonAppFolderScanEntryStatus get status =>
      throw _privateConstructorUsedError;
  List<CommonAppFolderScanPathFieldMatcher> get usedMatchers =>
      throw _privateConstructorUsedError;

  /// Serializes this CommonAppFolderScanResultDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonAppFolderScanResultDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonAppFolderScanResultDetailCopyWith<CommonAppFolderScanResultDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonAppFolderScanResultDetailCopyWith<$Res> {
  factory $CommonAppFolderScanResultDetailCopyWith(
          CommonAppFolderScanResultDetail value,
          $Res Function(CommonAppFolderScanResultDetail) then) =
      _$CommonAppFolderScanResultDetailCopyWithImpl<$Res,
          CommonAppFolderScanResultDetail>;
  @useResult
  $Res call(
      {String path,
      CommonAppFolderScanEntryType type,
      CommonAppFolderScanEntryStatus status,
      List<CommonAppFolderScanPathFieldMatcher> usedMatchers});
}

/// @nodoc
class _$CommonAppFolderScanResultDetailCopyWithImpl<$Res,
        $Val extends CommonAppFolderScanResultDetail>
    implements $CommonAppFolderScanResultDetailCopyWith<$Res> {
  _$CommonAppFolderScanResultDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonAppFolderScanResultDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? type = null,
    Object? status = null,
    Object? usedMatchers = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanEntryType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanEntryStatus,
      usedMatchers: null == usedMatchers
          ? _value.usedMatchers
          : usedMatchers // ignore: cast_nullable_to_non_nullable
              as List<CommonAppFolderScanPathFieldMatcher>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonAppFolderScanResultDetailImplCopyWith<$Res>
    implements $CommonAppFolderScanResultDetailCopyWith<$Res> {
  factory _$$CommonAppFolderScanResultDetailImplCopyWith(
          _$CommonAppFolderScanResultDetailImpl value,
          $Res Function(_$CommonAppFolderScanResultDetailImpl) then) =
      __$$CommonAppFolderScanResultDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path,
      CommonAppFolderScanEntryType type,
      CommonAppFolderScanEntryStatus status,
      List<CommonAppFolderScanPathFieldMatcher> usedMatchers});
}

/// @nodoc
class __$$CommonAppFolderScanResultDetailImplCopyWithImpl<$Res>
    extends _$CommonAppFolderScanResultDetailCopyWithImpl<$Res,
        _$CommonAppFolderScanResultDetailImpl>
    implements _$$CommonAppFolderScanResultDetailImplCopyWith<$Res> {
  __$$CommonAppFolderScanResultDetailImplCopyWithImpl(
      _$CommonAppFolderScanResultDetailImpl _value,
      $Res Function(_$CommonAppFolderScanResultDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonAppFolderScanResultDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? type = null,
    Object? status = null,
    Object? usedMatchers = null,
  }) {
    return _then(_$CommonAppFolderScanResultDetailImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanEntryType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonAppFolderScanEntryStatus,
      usedMatchers: null == usedMatchers
          ? _value._usedMatchers
          : usedMatchers // ignore: cast_nullable_to_non_nullable
              as List<CommonAppFolderScanPathFieldMatcher>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonAppFolderScanResultDetailImpl
    implements _CommonAppFolderScanResultDetail {
  const _$CommonAppFolderScanResultDetailImpl(
      {required this.path,
      required this.type,
      required this.status,
      final List<CommonAppFolderScanPathFieldMatcher> usedMatchers = const []})
      : _usedMatchers = usedMatchers;

  factory _$CommonAppFolderScanResultDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CommonAppFolderScanResultDetailImplFromJson(json);

  @override
  final String path;
  @override
  final CommonAppFolderScanEntryType type;
  @override
  final CommonAppFolderScanEntryStatus status;
  final List<CommonAppFolderScanPathFieldMatcher> _usedMatchers;
  @override
  @JsonKey()
  List<CommonAppFolderScanPathFieldMatcher> get usedMatchers {
    if (_usedMatchers is EqualUnmodifiableListView) return _usedMatchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedMatchers);
  }

  @override
  String toString() {
    return 'CommonAppFolderScanResultDetail(path: $path, type: $type, status: $status, usedMatchers: $usedMatchers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonAppFolderScanResultDetailImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._usedMatchers, _usedMatchers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, type, status,
      const DeepCollectionEquality().hash(_usedMatchers));

  /// Create a copy of CommonAppFolderScanResultDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonAppFolderScanResultDetailImplCopyWith<
          _$CommonAppFolderScanResultDetailImpl>
      get copyWith => __$$CommonAppFolderScanResultDetailImplCopyWithImpl<
          _$CommonAppFolderScanResultDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonAppFolderScanResultDetailImplToJson(
      this,
    );
  }
}

abstract class _CommonAppFolderScanResultDetail
    implements CommonAppFolderScanResultDetail {
  const factory _CommonAppFolderScanResultDetail(
          {required final String path,
          required final CommonAppFolderScanEntryType type,
          required final CommonAppFolderScanEntryStatus status,
          final List<CommonAppFolderScanPathFieldMatcher> usedMatchers}) =
      _$CommonAppFolderScanResultDetailImpl;

  factory _CommonAppFolderScanResultDetail.fromJson(Map<String, dynamic> json) =
      _$CommonAppFolderScanResultDetailImpl.fromJson;

  @override
  String get path;
  @override
  CommonAppFolderScanEntryType get type;
  @override
  CommonAppFolderScanEntryStatus get status;
  @override
  List<CommonAppFolderScanPathFieldMatcher> get usedMatchers;

  /// Create a copy of CommonAppFolderScanResultDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonAppFolderScanResultDetailImplCopyWith<
          _$CommonAppFolderScanResultDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InstalledCommonApps _$InstalledCommonAppsFromJson(Map<String, dynamic> json) {
  return _InstalledCommonApps.fromJson(json);
}

/// @nodoc
mixin _$InstalledCommonApps {
  String get name => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get installPath => throw _privateConstructorUsedError;
  List<String> get launcherPaths => throw _privateConstructorUsedError;

  /// Serializes this InstalledCommonApps to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstalledCommonApps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstalledCommonAppsCopyWith<InstalledCommonApps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstalledCommonAppsCopyWith<$Res> {
  factory $InstalledCommonAppsCopyWith(
          InstalledCommonApps value, $Res Function(InstalledCommonApps) then) =
      _$InstalledCommonAppsCopyWithImpl<$Res, InstalledCommonApps>;
  @useResult
  $Res call(
      {String name,
      String version,
      String installPath,
      List<String> launcherPaths});
}

/// @nodoc
class _$InstalledCommonAppsCopyWithImpl<$Res, $Val extends InstalledCommonApps>
    implements $InstalledCommonAppsCopyWith<$Res> {
  _$InstalledCommonAppsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstalledCommonApps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? installPath = null,
    Object? launcherPaths = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      installPath: null == installPath
          ? _value.installPath
          : installPath // ignore: cast_nullable_to_non_nullable
              as String,
      launcherPaths: null == launcherPaths
          ? _value.launcherPaths
          : launcherPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstalledCommonAppsImplCopyWith<$Res>
    implements $InstalledCommonAppsCopyWith<$Res> {
  factory _$$InstalledCommonAppsImplCopyWith(_$InstalledCommonAppsImpl value,
          $Res Function(_$InstalledCommonAppsImpl) then) =
      __$$InstalledCommonAppsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String version,
      String installPath,
      List<String> launcherPaths});
}

/// @nodoc
class __$$InstalledCommonAppsImplCopyWithImpl<$Res>
    extends _$InstalledCommonAppsCopyWithImpl<$Res, _$InstalledCommonAppsImpl>
    implements _$$InstalledCommonAppsImplCopyWith<$Res> {
  __$$InstalledCommonAppsImplCopyWithImpl(_$InstalledCommonAppsImpl _value,
      $Res Function(_$InstalledCommonAppsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstalledCommonApps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? installPath = null,
    Object? launcherPaths = null,
  }) {
    return _then(_$InstalledCommonAppsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      installPath: null == installPath
          ? _value.installPath
          : installPath // ignore: cast_nullable_to_non_nullable
              as String,
      launcherPaths: null == launcherPaths
          ? _value.launcherPaths
          : launcherPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstalledCommonAppsImpl implements _InstalledCommonApps {
  const _$InstalledCommonAppsImpl(
      {required this.name,
      required this.version,
      required this.installPath,
      required this.launcherPaths});

  factory _$InstalledCommonAppsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstalledCommonAppsImplFromJson(json);

  @override
  final String name;
  @override
  final String version;
  @override
  final String installPath;
  @override
  final List<String> launcherPaths;

  @override
  String toString() {
    return 'InstalledCommonApps(name: $name, version: $version, installPath: $installPath, launcherPaths: $launcherPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstalledCommonAppsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.installPath, installPath) ||
                other.installPath == installPath) &&
            const DeepCollectionEquality()
                .equals(other.launcherPaths, launcherPaths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, version, installPath,
      const DeepCollectionEquality().hash(launcherPaths));

  /// Create a copy of InstalledCommonApps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstalledCommonAppsImplCopyWith<_$InstalledCommonAppsImpl> get copyWith =>
      __$$InstalledCommonAppsImplCopyWithImpl<_$InstalledCommonAppsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstalledCommonAppsImplToJson(
      this,
    );
  }
}

abstract class _InstalledCommonApps implements InstalledCommonApps {
  const factory _InstalledCommonApps(
      {required final String name,
      required final String version,
      required final String installPath,
      required final List<String> launcherPaths}) = _$InstalledCommonAppsImpl;

  factory _InstalledCommonApps.fromJson(Map<String, dynamic> json) =
      _$InstalledCommonAppsImpl.fromJson;

  @override
  String get name;
  @override
  String get version;
  @override
  String get installPath;
  @override
  List<String> get launcherPaths;

  /// Create a copy of InstalledCommonApps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstalledCommonAppsImplCopyWith<_$InstalledCommonAppsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
