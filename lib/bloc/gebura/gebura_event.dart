part of 'gebura_bloc.dart';

@immutable
sealed class GeburaEvent {}

final class GeburaInitEvent extends GeburaEvent {}

final class GeburaPurchasedAppInfosLoadEvent extends GeburaEvent {}

final class GeburaSetPurchasedAppInfoIndexEvent extends GeburaEvent {
  final int? index;

  GeburaSetPurchasedAppInfoIndexEvent(this.index);
}

final class GeburaSearchAppInfosEvent extends GeburaEvent {
  final String query;

  GeburaSearchAppInfosEvent(this.query);
}

final class GeburaPurchaseEvent extends GeburaEvent {
  final InternalID id;

  GeburaPurchaseEvent(this.id);
}

final class GeburaSetAppLauncherSettingEvent extends GeburaEvent {
  final AppLauncherSetting setting;

  GeburaSetAppLauncherSettingEvent(this.setting);
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
  final List<String> appIDs;

  GeburaImportSteamAppsEvent(this.appIDs);
}

final class GeburaFetchBoundAppInfosEvent extends GeburaEvent {
  final InternalID appID;

  GeburaFetchBoundAppInfosEvent(this.appID);
}
