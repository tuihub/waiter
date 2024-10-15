part of 'gebura_bloc.dart';

class GeburaState {
  // server data
  late Map<Int64, List<AppInfo>>? appInfoMap;
  late List<AppInfoMixed>? purchasedAppInfos;
  late List<App>? ownedApps;
  late List<AppInst>? ownedAppInsts;
  late Map<InternalID, Duration>? appInstRunTimes;

  // ui data
  late List<LibraryListItem>? libraryListItems;
  late Map<String, LocalAppInstRunRecord>? runningInsts;
  late SteamScanResult? localSteamScanResult;
  late String? localLibraryStateMessage;

  // local data
  late LibrarySettings? librarySettings;
  late Map<String, LocalTrackedApp>? localTrackedApps;
  late Map<String, LocalTrackedAppInst>? localTrackedAppInsts;
  late Map<String, InstalledSteamApps>? localInstalledSteamAppInsts;
  late List<String>? localSteamLibraryFolders;

  Map<App, List<AppInst>> getAppInsts(Int64 id) {
    if (ownedAppInsts == null || ownedApps == null) {
      return {};
    }
    final result = <App, List<AppInst>>{};
    if (ownedApps!.any((element) => element.id.id == id)) {
      final app = ownedApps!.firstWhere(
        (element) => element.id.id == id,
        orElse: App.new,
      );
      result[app] = ownedAppInsts!.where((inst) {
        return inst.appId.id == id || app.assignedAppInfoId.id == id;
      }).toList();
    } else if (ownedApps!
        .any((element) => element.assignedAppInfoId.id == id)) {
      final apps = ownedApps!.where((element) {
        return element.assignedAppInfoId.id == id;
      }).toList();
      for (final app in apps) {
        result[app] = ownedAppInsts!.where((inst) {
          return inst.appId.id == app.id.id;
        }).toList();
      }
    }
    return result;
  }

  Duration? getRunTime(Int64 id) {
    if (appInstRunTimes == null) {
      return null;
    }
    final insts = getAppInsts(id);
    if (insts.isEmpty) {
      return null;
    }
    return insts.values.fold<Duration>(
      Duration.zero,
      (previousValue, element) {
        return previousValue +
            element.fold<Duration>(
              Duration.zero,
              (previousValue, element) {
                return previousValue +
                    (appInstRunTimes![element.id] ?? Duration.zero);
              },
            );
      },
    );
  }

  GeburaState({
    this.appInfoMap,
    this.purchasedAppInfos,
    this.ownedApps,
    this.ownedAppInsts,
    this.appInstRunTimes,
    this.libraryListItems,
    this.runningInsts,
    this.localSteamScanResult,
    this.localLibraryStateMessage,
    this.librarySettings,
    this.localTrackedApps,
    this.localTrackedAppInsts,
    this.localInstalledSteamAppInsts,
    this.localSteamLibraryFolders,
  });

  GeburaState copyWith({
    Map<Int64, List<AppInfo>>? appInfoMap,
    List<AppInfoMixed>? purchasedAppInfos,
    List<App>? ownedApps,
    List<AppInst>? ownedAppInsts,
    Map<InternalID, Duration>? appInstRunTimes,
    List<LibraryListItem>? libraryListItems,
    Map<String, LocalAppInstRunRecord>? runningInsts,
    SteamScanResult? localSteamScanResult,
    String? localLibraryStateMessage,
    LibrarySettings? librarySettings,
    Map<String, LocalTrackedApp>? localTrackedApps,
    Map<String, LocalTrackedAppInst>? localTrackedAppInsts,
    Map<String, InstalledSteamApps>? localInstalledSteamAppInsts,
    List<String>? localSteamLibraryFolders,
  }) {
    return GeburaState(
      appInfoMap: appInfoMap ?? this.appInfoMap,
      purchasedAppInfos: purchasedAppInfos ?? this.purchasedAppInfos,
      ownedApps: ownedApps ?? this.ownedApps,
      ownedAppInsts: ownedAppInsts ?? this.ownedAppInsts,
      appInstRunTimes: appInstRunTimes ?? this.appInstRunTimes,
      libraryListItems: libraryListItems ?? this.libraryListItems,
      runningInsts: runningInsts ?? this.runningInsts,
      localSteamScanResult: localSteamScanResult ?? this.localSteamScanResult,
      localLibraryStateMessage:
          localLibraryStateMessage ?? this.localLibraryStateMessage,
      librarySettings: librarySettings ?? this.librarySettings,
      localTrackedApps: localTrackedApps ?? this.localTrackedApps,
      localTrackedAppInsts: localTrackedAppInsts ?? this.localTrackedAppInsts,
      localInstalledSteamAppInsts:
          localInstalledSteamAppInsts ?? this.localInstalledSteamAppInsts,
      localSteamLibraryFolders:
          localSteamLibraryFolders ?? this.localSteamLibraryFolders,
    );
  }

  void _from(GeburaState other) {
    appInfoMap = other.appInfoMap;
    purchasedAppInfos = other.purchasedAppInfos;
    ownedApps = other.ownedApps;
    ownedAppInsts = other.ownedAppInsts;
    appInstRunTimes = other.appInstRunTimes;

    libraryListItems = other.libraryListItems;
    runningInsts = other.runningInsts;
    localSteamScanResult = other.localSteamScanResult;
    localLibraryStateMessage = other.localLibraryStateMessage;

    librarySettings = other.librarySettings;
    localTrackedApps = other.localTrackedApps;
    localTrackedAppInsts = other.localTrackedAppInsts;
    localInstalledSteamAppInsts = other.localInstalledSteamAppInsts;
    localSteamLibraryFolders = other.localSteamLibraryFolders;
  }
}

class GeburaRefreshLibraryState extends GeburaState with EventStatusMixin {
  GeburaRefreshLibraryState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaSearchAppInfosState extends GeburaState with EventStatusMixin {
  GeburaSearchAppInfosState(GeburaState state, this.statusCode,
      {this.msg, this.apps})
      : super() {
    _from(state);
  }

  final List<AppInfoMixed>? apps;

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaPurchaseState extends GeburaState with EventStatusMixin {
  GeburaPurchaseState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaSaveLocalAppInstLaunchSettingState extends GeburaState
    with EventStatusMixin {
  GeburaSaveLocalAppInstLaunchSettingState(GeburaState state, this.statusCode,
      {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaAddAppState extends GeburaState with EventStatusMixin {
  GeburaAddAppState(GeburaState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaEditAppState extends GeburaState with EventStatusMixin {
  GeburaEditAppState(GeburaState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaAddAppPackageState extends GeburaState with EventStatusMixin {
  GeburaAddAppPackageState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaEditAppPackageState extends GeburaState with EventStatusMixin {
  GeburaEditAppPackageState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaAssignAppPackageState extends GeburaState with EventStatusMixin {
  GeburaAssignAppPackageState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaLaunchLocalAppInstState extends GeburaState with EventStatusMixin {
  GeburaLaunchLocalAppInstState(GeburaState state, this.uuid, this.statusCode,
      {this.msg})
      : super() {
    _from(state);
  }

  final String uuid;

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaTrackSteamAppsState extends GeburaState with EventStatusMixin {
  GeburaTrackSteamAppsState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaImportSteamAppsState extends GeburaState with EventStatusMixin {
  GeburaImportSteamAppsState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaFetchBoundAppsState extends GeburaState with EventStatusMixin {
  GeburaFetchBoundAppsState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
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

class GeburaRefreshAppInfoState extends GeburaState with EventStatusMixin {
  GeburaRefreshAppInfoState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaAssignAppInfoState extends GeburaState with EventStatusMixin {
  GeburaAssignAppInfoState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaSearchNewAppInfoState extends GeburaState with EventStatusMixin {
  GeburaSearchNewAppInfoState(GeburaState state, this.statusCode,
      {this.infos, this.msg})
      : super() {
    _from(state);
  }

  final List<AppInfo>? infos;

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaReportAppRunTimeState extends GeburaState with EventStatusMixin {
  GeburaReportAppRunTimeState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaSaveLastLaunchAppInstState extends GeburaState
    with EventStatusMixin {
  GeburaSaveLastLaunchAppInstState(GeburaState state, this.statusCode,
      {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
