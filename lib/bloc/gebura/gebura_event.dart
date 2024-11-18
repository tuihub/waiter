part of 'gebura_bloc.dart';

@immutable
sealed class GeburaEvent {}

final class GeburaInitEvent extends GeburaEvent {}

final class GeburaRefreshLibraryListEvent extends GeburaEvent {}

final class GeburaApplyLibraryFilterEvent extends GeburaEvent {
  final String? query;
  final bool usePreviousSettings;

  GeburaApplyLibraryFilterEvent({
    this.query,
    this.usePreviousSettings = false,
  });
}

final class GeburaScanLocalLibraryEvent extends GeburaEvent {
  final bool doAutoRefresh;
  final List<String>? refreshSteam;
  final List<String>? refreshCommon;

  GeburaScanLocalLibraryEvent({
    this.doAutoRefresh = false,
    this.refreshSteam,
    this.refreshCommon,
  });
}

final class GeburaTrackCommonAppsEvent extends GeburaEvent {
  final List<String> uuids;

  GeburaTrackCommonAppsEvent(this.uuids);
}

final class GeburaTrackSteamAppsEvent extends GeburaEvent {
  final List<String> uuids;

  GeburaTrackSteamAppsEvent(this.uuids);
}

final class GeburaRefreshAppInfoEvent extends GeburaEvent {
  final String uuid;

  GeburaRefreshAppInfoEvent(this.uuid);
}

final class GeburaSaveLocalAppInstLaunchSettingEvent extends GeburaEvent {
  final String launcherUUID;
  final LocalAppInstLaunchCommon? commonSetting;
  final LocalAppInstLaunchSteam? steamSetting;

  GeburaSaveLocalAppInstLaunchSettingEvent(
    this.launcherUUID, {
    this.commonSetting,
    this.steamSetting,
  });
}

final class GeburaSaveLastLaunchAppInstEvent extends GeburaEvent {
  final String launcherUUID;

  GeburaSaveLastLaunchAppInstEvent(this.launcherUUID);
}

final class GeburaLaunchLocalAppEvent extends GeburaEvent {
  final String? appUUID;
  final String? launcherUUID;

  GeburaLaunchLocalAppEvent({this.appUUID, this.launcherUUID});
}

final class GeburaSaveLocalCommonAppFolderSettingEvent extends GeburaEvent {
  final CommonAppScan setting;

  GeburaSaveLocalCommonAppFolderSettingEvent(this.setting);
}

final class GeburaLoadAppInstsEvent extends GeburaEvent {
  GeburaLoadAppInstsEvent();
}

final class GeburaLoadAppInstLaunchersEvent extends GeburaEvent {
  GeburaLoadAppInstLaunchersEvent();
}

// Events handle server data.

// TODO: review

final class GeburaRefreshLibraryEvent extends GeburaEvent {}

final class GeburaSearchAppInfosEvent extends GeburaEvent {
  final String query;

  GeburaSearchAppInfosEvent(this.query);
}

final class GeburaPurchaseEvent extends GeburaEvent {
  final InternalID id;

  GeburaPurchaseEvent(this.id);
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

// final class GeburaImportSteamAppsEvent extends GeburaEvent {
//   final List<String> steamAppIDs;
//
//   GeburaImportSteamAppsEvent(this.steamAppIDs);
// }

// final class GeburaImportNewAppInstEvent extends GeburaEvent {
//   final String path;
//   final String name;
//   final InternalID? appID;
//   final InternalID? newAppWithInfoID;
//
//   GeburaImportNewAppInstEvent(
//     this.path,
//     this.name, {
//     this.appID,
//     this.newAppWithInfoID,
//   });
// }

final class GeburaFetchBoundAppInfosEvent extends GeburaEvent {
  final InternalID appID;
  final bool? refreshAfterSuccess;

  GeburaFetchBoundAppInfosEvent(this.appID, {this.refreshAfterSuccess});
}

final class GeburaAssignAppWithNewInfoEvent extends GeburaEvent {
  final InternalID appID;
  final String appInfoSource;
  final String appInfoSourceID;

  GeburaAssignAppWithNewInfoEvent(
      this.appID, this.appInfoSource, this.appInfoSourceID);
}

final class GeburaSearchNewAppInfoEvent extends GeburaEvent {
  final String query;

  GeburaSearchNewAppInfoEvent(this.query);
}

final class GeburaReportAppRunTimeEvent extends GeburaEvent {
  final InternalID appInstID;
  final DateTime startTime;
  final DateTime endTime;

  GeburaReportAppRunTimeEvent(
    this.appInstID,
    this.startTime,
    this.endTime,
  );
}
