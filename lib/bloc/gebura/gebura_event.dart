part of 'gebura_bloc.dart';

@immutable
sealed class GeburaEvent {
  final EventContext context;

  GeburaEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

final class _GeburaSwitchServerEvent extends GeburaEvent {
  _GeburaSwitchServerEvent(ServerID serverID) : super(EventContext(serverID));
}

final class GeburaInitEvent extends GeburaEvent {
  GeburaInitEvent(super.context);
}

final class GeburaRefreshLibraryListEvent extends GeburaEvent {
  GeburaRefreshLibraryListEvent(super.context);
}

final class GeburaApplyLibraryFilterEvent extends GeburaEvent {
  final String? query;
  final bool usePreviousSettings;

  GeburaApplyLibraryFilterEvent(
    super.context, {
    this.query,
    this.usePreviousSettings = false,
  });
}

final class GeburaScanLocalLibraryEvent extends GeburaEvent {
  final bool doAutoRefresh;
  final List<String>? refreshSteam;
  final List<String>? refreshCommon;

  GeburaScanLocalLibraryEvent(
    super.context, {
    this.doAutoRefresh = false,
    this.refreshSteam,
    this.refreshCommon,
  });
}

final class GeburaTrackCommonAppsEvent extends GeburaEvent {
  final List<String> uuids;

  GeburaTrackCommonAppsEvent(super.context, this.uuids);
}

final class GeburaTrackSteamAppsEvent extends GeburaEvent {
  final List<String> uuids;

  GeburaTrackSteamAppsEvent(super.context, this.uuids);
}

final class GeburaRefreshAppInfoEvent extends GeburaEvent {
  final String uuid;

  GeburaRefreshAppInfoEvent(super.context, this.uuid);
}

final class GeburaSaveLocalAppInstLaunchSettingEvent extends GeburaEvent {
  final String launcherUUID;
  final LocalAppInstLaunchCommon? commonSetting;
  final LocalAppInstLaunchSteam? steamSetting;

  GeburaSaveLocalAppInstLaunchSettingEvent(
    super.context,
    this.launcherUUID, {
    this.commonSetting,
    this.steamSetting,
  });
}

final class GeburaSaveLastLaunchAppInstEvent extends GeburaEvent {
  final String launcherUUID;

  GeburaSaveLastLaunchAppInstEvent(super.context, this.launcherUUID);
}

final class GeburaLaunchLocalAppEvent extends GeburaEvent {
  final String? appUUID;
  final String? launcherUUID;

  GeburaLaunchLocalAppEvent(super.context, {this.appUUID, this.launcherUUID});
}

final class GeburaSaveLocalCommonAppFolderSettingEvent extends GeburaEvent {
  final CommonAppScan setting;

  GeburaSaveLocalCommonAppFolderSettingEvent(super.context, this.setting);
}

final class GeburaLoadAppInstsEvent extends GeburaEvent {
  GeburaLoadAppInstsEvent(super.context);
}

final class GeburaLoadAppInstLaunchersEvent extends GeburaEvent {
  GeburaLoadAppInstLaunchersEvent(super.context);
}

// Events handle server data.

// TODO: review

final class GeburaRefreshLibraryEvent extends GeburaEvent {
  GeburaRefreshLibraryEvent(super.context);
}

final class GeburaSearchAppInfosEvent extends GeburaEvent {
  final String query;

  GeburaSearchAppInfosEvent(super.context, this.query);
}

final class GeburaPurchaseEvent extends GeburaEvent {
  final InternalID id;

  GeburaPurchaseEvent(super.context, this.id);
}

final class GeburaAddAppInfoEvent extends GeburaEvent {
  final AppInfo appInfo;

  GeburaAddAppInfoEvent(super.context, this.appInfo);
}

final class GeburaEditAppInfoEvent extends GeburaEvent {
  final AppInfo appInfo;

  GeburaEditAppInfoEvent(super.context, this.appInfo);
}

final class GeburaAddAppEvent extends GeburaEvent {
  final App app;

  GeburaAddAppEvent(super.context, this.app);
}

final class GeburaEditAppEvent extends GeburaEvent {
  final App app;

  GeburaEditAppEvent(super.context, this.app);
}

final class GeburaAssignAppEvent extends GeburaEvent {
  final InternalID appID;
  final InternalID appInfoID;

  GeburaAssignAppEvent(super.context, this.appID, this.appInfoID);
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

  GeburaFetchBoundAppInfosEvent(super.context, this.appID,
      {this.refreshAfterSuccess});
}

final class GeburaAssignAppWithNewInfoEvent extends GeburaEvent {
  final InternalID appID;
  final String appInfoSource;
  final String appInfoSourceID;

  GeburaAssignAppWithNewInfoEvent(
      super.context, this.appID, this.appInfoSource, this.appInfoSourceID);
}

final class GeburaSearchNewAppInfoEvent extends GeburaEvent {
  final String query;

  GeburaSearchNewAppInfoEvent(super.context, this.query);
}

final class GeburaReportAppRunTimeEvent extends GeburaEvent {
  final InternalID appInstID;
  final DateTime startTime;
  final DateTime endTime;

  GeburaReportAppRunTimeEvent(
    super.context,
    this.appInstID,
    this.startTime,
    this.endTime,
  );
}
