import 'package:freezed_annotation/freezed_annotation.dart';

part 'gebura_model.freezed.dart';
part 'gebura_model.g.dart';

@freezed
class AppLauncherSetting with _$AppLauncherSetting {
  const factory AppLauncherSetting({
    required int appID,
    required String path,
  }) = _AppLauncherSetting;

  factory AppLauncherSetting.fromJson(Map<String, Object?> json) =>
      _$AppLauncherSettingFromJson(json);
}
