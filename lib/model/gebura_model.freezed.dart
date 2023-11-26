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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppLauncherSetting _$AppLauncherSettingFromJson(Map<String, dynamic> json) {
  return _AppLauncherSetting.fromJson(json);
}

/// @nodoc
mixin _$AppLauncherSetting {
  int get appID => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLauncherSettingCopyWith<AppLauncherSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLauncherSettingCopyWith<$Res> {
  factory $AppLauncherSettingCopyWith(
          AppLauncherSetting value, $Res Function(AppLauncherSetting) then) =
      _$AppLauncherSettingCopyWithImpl<$Res, AppLauncherSetting>;
  @useResult
  $Res call({int appID, String path});
}

/// @nodoc
class _$AppLauncherSettingCopyWithImpl<$Res, $Val extends AppLauncherSetting>
    implements $AppLauncherSettingCopyWith<$Res> {
  _$AppLauncherSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appID = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      appID: null == appID
          ? _value.appID
          : appID // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLauncherSettingImplCopyWith<$Res>
    implements $AppLauncherSettingCopyWith<$Res> {
  factory _$$AppLauncherSettingImplCopyWith(_$AppLauncherSettingImpl value,
          $Res Function(_$AppLauncherSettingImpl) then) =
      __$$AppLauncherSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int appID, String path});
}

/// @nodoc
class __$$AppLauncherSettingImplCopyWithImpl<$Res>
    extends _$AppLauncherSettingCopyWithImpl<$Res, _$AppLauncherSettingImpl>
    implements _$$AppLauncherSettingImplCopyWith<$Res> {
  __$$AppLauncherSettingImplCopyWithImpl(_$AppLauncherSettingImpl _value,
      $Res Function(_$AppLauncherSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appID = null,
    Object? path = null,
  }) {
    return _then(_$AppLauncherSettingImpl(
      appID: null == appID
          ? _value.appID
          : appID // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppLauncherSettingImpl implements _AppLauncherSetting {
  const _$AppLauncherSettingImpl({required this.appID, required this.path});

  factory _$AppLauncherSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLauncherSettingImplFromJson(json);

  @override
  final int appID;
  @override
  final String path;

  @override
  String toString() {
    return 'AppLauncherSetting(appID: $appID, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLauncherSettingImpl &&
            (identical(other.appID, appID) || other.appID == appID) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appID, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLauncherSettingImplCopyWith<_$AppLauncherSettingImpl> get copyWith =>
      __$$AppLauncherSettingImplCopyWithImpl<_$AppLauncherSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLauncherSettingImplToJson(
      this,
    );
  }
}

abstract class _AppLauncherSetting implements AppLauncherSetting {
  const factory _AppLauncherSetting(
      {required final int appID,
      required final String path}) = _$AppLauncherSettingImpl;

  factory _AppLauncherSetting.fromJson(Map<String, dynamic> json) =
      _$AppLauncherSettingImpl.fromJson;

  @override
  int get appID;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$AppLauncherSettingImplCopyWith<_$AppLauncherSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
