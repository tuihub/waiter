part of 'gebura_bloc.dart';

@immutable
sealed class GeburaEvent {}

final class GeburaInitEvent extends GeburaEvent {}

final class GeburaPurchasedAppsLoadEvent extends GeburaEvent {}

final class GeburaSetPurchasedAppIndexEvent extends GeburaEvent {
  final int? index;

  GeburaSetPurchasedAppIndexEvent(this.index);
}

final class GeburaSearchAppsEvent extends GeburaEvent {
  final String query;

  GeburaSearchAppsEvent(this.query);
}

final class GeburaPurchaseEvent extends GeburaEvent {
  final InternalID id;

  GeburaPurchaseEvent(this.id);
}

final class GeburaSetAppLauncherSettingEvent extends GeburaEvent {
  final AppLauncherSetting setting;

  GeburaSetAppLauncherSettingEvent(this.setting);
}

final class GeburaAddAppEvent extends GeburaEvent {
  final App app;

  GeburaAddAppEvent(this.app);
}

final class GeburaEditAppEvent extends GeburaEvent {
  final App app;

  GeburaEditAppEvent(this.app);
}

final class GeburaAddAppPackageEvent extends GeburaEvent {
  final AppPackage appPackage;

  GeburaAddAppPackageEvent(this.appPackage);
}

final class GeburaEditAppPackageEvent extends GeburaEvent {
  final AppPackage appPackage;

  GeburaEditAppPackageEvent(this.appPackage);
}

final class GeburaAssignAppPackageEvent extends GeburaEvent {
  final InternalID appPackageID;
  final InternalID appID;

  GeburaAssignAppPackageEvent(this.appPackageID, this.appID);
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

final class GeburaFetchBoundAppsEvent extends GeburaEvent {
  final InternalID appID;

  GeburaFetchBoundAppsEvent(this.appID);
}