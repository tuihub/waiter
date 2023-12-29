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
  bool get advancedTracing => throw _privateConstructorUsedError;
  String get processName => throw _privateConstructorUsedError;
  String get realPath => throw _privateConstructorUsedError;
  int get sleepTime => throw _privateConstructorUsedError;

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
  $Res call(
      {int appID,
      String path,
      bool advancedTracing,
      String processName,
      String realPath,
      int sleepTime});
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
    Object? advancedTracing = null,
    Object? processName = null,
    Object? realPath = null,
    Object? sleepTime = null,
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
abstract class _$$AppLauncherSettingImplCopyWith<$Res>
    implements $AppLauncherSettingCopyWith<$Res> {
  factory _$$AppLauncherSettingImplCopyWith(_$AppLauncherSettingImpl value,
          $Res Function(_$AppLauncherSettingImpl) then) =
      __$$AppLauncherSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int appID,
      String path,
      bool advancedTracing,
      String processName,
      String realPath,
      int sleepTime});
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
    Object? advancedTracing = null,
    Object? processName = null,
    Object? realPath = null,
    Object? sleepTime = null,
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
class _$AppLauncherSettingImpl implements _AppLauncherSetting {
  const _$AppLauncherSettingImpl(
      {required this.appID,
      required this.path,
      required this.advancedTracing,
      required this.processName,
      required this.realPath,
      required this.sleepTime});

  factory _$AppLauncherSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLauncherSettingImplFromJson(json);

  @override
  final int appID;
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
    return 'AppLauncherSetting(appID: $appID, path: $path, advancedTracing: $advancedTracing, processName: $processName, realPath: $realPath, sleepTime: $sleepTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLauncherSettingImpl &&
            (identical(other.appID, appID) || other.appID == appID) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appID, path, advancedTracing,
      processName, realPath, sleepTime);

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
      required final String path,
      required final bool advancedTracing,
      required final String processName,
      required final String realPath,
      required final int sleepTime}) = _$AppLauncherSettingImpl;

  factory _AppLauncherSetting.fromJson(Map<String, dynamic> json) =
      _$AppLauncherSettingImpl.fromJson;

  @override
  int get appID;
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
  @override
  @JsonKey(ignore: true)
  _$$AppLauncherSettingImplCopyWith<_$AppLauncherSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppRunState _$AppRunStateFromJson(Map<String, dynamic> json) {
  return _AppRunState.fromJson(json);
}

/// @nodoc
mixin _$AppRunState {
  bool get running => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppRunStateCopyWith<AppRunState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRunStateCopyWith<$Res> {
  factory $AppRunStateCopyWith(
          AppRunState value, $Res Function(AppRunState) then) =
      _$AppRunStateCopyWithImpl<$Res, AppRunState>;
  @useResult
  $Res call({bool running, DateTime? startTime, DateTime? endTime});
}

/// @nodoc
class _$AppRunStateCopyWithImpl<$Res, $Val extends AppRunState>
    implements $AppRunStateCopyWith<$Res> {
  _$AppRunStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? running = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$AppRunStateImplCopyWith<$Res>
    implements $AppRunStateCopyWith<$Res> {
  factory _$$AppRunStateImplCopyWith(
          _$AppRunStateImpl value, $Res Function(_$AppRunStateImpl) then) =
      __$$AppRunStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool running, DateTime? startTime, DateTime? endTime});
}

/// @nodoc
class __$$AppRunStateImplCopyWithImpl<$Res>
    extends _$AppRunStateCopyWithImpl<$Res, _$AppRunStateImpl>
    implements _$$AppRunStateImplCopyWith<$Res> {
  __$$AppRunStateImplCopyWithImpl(
      _$AppRunStateImpl _value, $Res Function(_$AppRunStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? running = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$AppRunStateImpl(
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$AppRunStateImpl implements _AppRunState {
  const _$AppRunStateImpl(
      {required this.running, required this.startTime, required this.endTime});

  factory _$AppRunStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppRunStateImplFromJson(json);

  @override
  final bool running;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;

  @override
  String toString() {
    return 'AppRunState(running: $running, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppRunStateImpl &&
            (identical(other.running, running) || other.running == running) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, running, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppRunStateImplCopyWith<_$AppRunStateImpl> get copyWith =>
      __$$AppRunStateImplCopyWithImpl<_$AppRunStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppRunStateImplToJson(
      this,
    );
  }
}

abstract class _AppRunState implements AppRunState {
  const factory _AppRunState(
      {required final bool running,
      required final DateTime? startTime,
      required final DateTime? endTime}) = _$AppRunStateImpl;

  factory _AppRunState.fromJson(Map<String, dynamic> json) =
      _$AppRunStateImpl.fromJson;

  @override
  bool get running;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  @JsonKey(ignore: true)
  _$$AppRunStateImplCopyWith<_$AppRunStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
