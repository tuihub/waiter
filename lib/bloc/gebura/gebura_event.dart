part of 'gebura_bloc.dart';

@immutable
sealed class GeburaEvent {}

final class GeburaInitEvent extends GeburaEvent {}

final class GeburaRefreshLibraryEvent extends GeburaEvent {}

final class GeburaApplyLibrarySettingsEvent extends GeburaEvent {
  final String? query;
  final bool? usePreviousSettings;

  GeburaApplyLibrarySettingsEvent({this.query, this.usePreviousSettings});
}

final class GeburaSetSelectedLibraryItemEvent extends GeburaEvent {
  final InternalID? id;

  GeburaSetSelectedLibraryItemEvent(this.id);
}

final class GeburaSearchAppInfosEvent extends GeburaEvent {
  final String query;

  GeburaSearchAppInfosEvent(this.query);
}

final class GeburaPurchaseEvent extends GeburaEvent {
  final InternalID id;

  GeburaPurchaseEvent(this.id);
}

final class GeburaSetLocalAppInstLauncherSettingEvent extends GeburaEvent {
  final LocalAppInstLauncherSetting setting;

  GeburaSetLocalAppInstLauncherSettingEvent(this.setting);
}

final class GeburaAddAppInfoEvent extends GeburaEvent {
  final AppInfo appInfo;

  GeburaAddAppInfoEvent(this.appInfo);
}

final class GeburaEditAppInfoEvent extends GeburaEvent {
  final AppInfo appInfo;

  GeburaEditAppInfoEvent(this.appInfo);
}

final class GeburaAddAppEvent extends GeburaEvent {
  final App app;

  GeburaAddAppEvent(this.app);
}

final class GeburaEditAppEvent extends GeburaEvent {
  final App app;

  GeburaEditAppEvent(this.app);
}

final class GeburaAssignAppEvent extends GeburaEvent {
  final InternalID appID;
  final InternalID appInfoID;

  GeburaAssignAppEvent(this.appID, this.appInfoID);
}

final class GeburaRunAppEvent extends GeburaEvent {
  final InternalID appID;

  GeburaRunAppEvent(this.appID);
}

final class GeburaScanLocalLibraryEvent extends GeburaEvent {}

final class GeburaImportSteamAppsEvent extends GeburaEvent {
  final List<String> steamAppIDs;

  GeburaImportSteamAppsEvent(this.steamAppIDs);
}

final class GeburaImportNewAppInstEvent extends GeburaEvent {
  final String path;
  final String name;
  final InternalID? appID;
  final InternalID? newAppWithInfoID;

  GeburaImportNewAppInstEvent(
    this.path,
    this.name, {
    this.appID,
    this.newAppWithInfoID,
  });
}

final class GeburaFetchBoundAppInfosEvent extends GeburaEvent {
  final InternalID appID;
  final bool? refreshAfterSuccess;

  GeburaFetchBoundAppInfosEvent(this.appID, {this.refreshAfterSuccess});
}

final class GeburaSetAppLauncherSettingEvent extends GeburaEvent {
  final InternalID appID;
  final AppLauncherSetting setting;

  GeburaSetAppLauncherSettingEvent(this.appID, this.setting);
}

final class GeburaFetchAppLauncherSettingEvent extends GeburaEvent {
  final InternalID appID;

  GeburaFetchAppLauncherSettingEvent(this.appID);
}

final class GeburaClearLocalLibraryStateEvent extends GeburaEvent {}
