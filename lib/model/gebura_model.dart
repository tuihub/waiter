class AppLauncherSetting {
  final int appID;
  final String path;

  AppLauncherSetting({
    required this.appID,
    required this.path,
  });

  AppLauncherSetting.fromJson(Map<String, dynamic> json)
      : appID = json['appID'] as int,
        path = json['path'] as String;

  Map<String, dynamic> toJson() => {
        'appID': appID,
        'path': path,
      };
}
