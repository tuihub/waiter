part of 'gebura_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class GeburaState with GeburaStateMappable {
  ServerID currentServer;
  List<LibraryListItem> libraryListItems;
  LibrarySettings? librarySettings;
  Map<String, LocalApp> libraryApps;
  Map<String, LocalAppInst> localAppInsts;
  Map<String, LocalAppInstLauncher> localAppInstLaunchers;
  Map<String, LocalAppRunRecord> runningInsts;
  Map<String, LocalLibraryScanResult> localLibraryScanResults;

  GeburaState({
    this.currentServer = const ServerID.local(),
    this.libraryListItems = const [],
    this.runningInsts = const {},
    this.localLibraryScanResults = const {},
    this.librarySettings,
    this.libraryApps = const {},
    this.localAppInsts = const {},
    this.localAppInstLaunchers = const {},
  });

  GeburaState.clone(GeburaState other)
      : currentServer = other.currentServer,
        libraryListItems = other.libraryListItems,
        runningInsts = other.runningInsts,
        localLibraryScanResults = other.localLibraryScanResults,
        librarySettings = other.librarySettings,
        libraryApps = other.libraryApps,
        localAppInsts = other.localAppInsts,
        localAppInstLaunchers = other.localAppInstLaunchers;
}

class GeburaEventState extends GeburaState with EventStatusMixin {
  GeburaEventState.clone(super.state, this.statusCode, {this.msg})
      : super.clone();

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaRefreshLibraryState extends GeburaEventState {
  GeburaRefreshLibraryState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaSearchAppInfosState extends GeburaEventState {
  GeburaSearchAppInfosState(super.state, super.statusCode,
      {super.msg, this.apps})
      : super.clone();

  final List<AppInfoMixed>? apps;
}

class GeburaPurchaseState extends GeburaEventState {
  GeburaPurchaseState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaSaveLocalAppInstLaunchSettingState extends GeburaEventState {
  GeburaSaveLocalAppInstLaunchSettingState(super.state, super.statusCode,
      {super.msg})
      : super.clone();
}

class GeburaAddAppState extends GeburaEventState {
  GeburaAddAppState(super.state, super.statusCode, {super.msg}) : super.clone();
}

class GeburaEditAppState extends GeburaEventState {
  GeburaEditAppState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaAddAppPackageState extends GeburaEventState {
  GeburaAddAppPackageState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaEditAppPackageState extends GeburaEventState {
  GeburaEditAppPackageState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaAssignAppPackageState extends GeburaEventState {
  GeburaAssignAppPackageState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaLaunchLocalAppInstState extends GeburaEventState {
  GeburaLaunchLocalAppInstState(super.state, this.uuid, super.statusCode,
      {super.msg})
      : super.clone();

  final String uuid;
}

class GeburaTrackCommonAppsState extends GeburaEventState {
  GeburaTrackCommonAppsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaTrackSteamAppsState extends GeburaEventState {
  GeburaTrackSteamAppsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaImportSteamAppsState extends GeburaEventState {
  GeburaImportSteamAppsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaFetchBoundAppsState extends GeburaEventState {
  GeburaFetchBoundAppsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

// class GeburaImportNewAppInstState extends GeburaState with EventStatusMixin {
//   GeburaImportNewAppInstState(GeburaState state, this.statusCode, {this.msg})
//       : super() {
//     _from(state);
//   }
//
//   @override
//   final EventStatus? statusCode;
//   @override
//   final String? msg;
// }

class GeburaRefreshAppInfoState extends GeburaEventState {
  GeburaRefreshAppInfoState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaAssignAppInfoState extends GeburaEventState {
  GeburaAssignAppInfoState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaSearchNewAppInfoState extends GeburaEventState {
  GeburaSearchNewAppInfoState(super.state, super.statusCode,
      {super.msg, this.infos})
      : super.clone();

  final List<AppInfo>? infos;
}

class GeburaReportAppRunTimeState extends GeburaEventState {
  GeburaReportAppRunTimeState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaSaveLastLaunchAppInstState extends GeburaEventState {
  GeburaSaveLastLaunchAppInstState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaScanLocalLibraryState extends GeburaEventState {
  GeburaScanLocalLibraryState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaLoadAppInstsState extends GeburaEventState {
  GeburaLoadAppInstsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class GeburaLoadAppInstLaunchersState extends GeburaEventState {
  GeburaLoadAppInstLaunchersState(super.state, super.statusCode, {super.msg})
      : super.clone();
}
