part of 'gebura_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class GeburaState with GeburaStateMappable {
  bool initialized;
  List<LibraryListItem>? libraryListItems;
  LibrarySettings? librarySettings;
  Map<String, LocalApp> libraryApps;
  Map<String, LocalAppInst> libraryAppInsts;
  Map<String, LocalAppInstLauncher> libraryAppInstLaunchers;
  Map<String, LocalAppRunRecord> runningInsts;
  Map<String, LocalLibraryScanResult> localLibraryScanResults;

  GeburaState({
    this.initialized = false,
    this.libraryListItems,
    this.runningInsts = const {},
    this.localLibraryScanResults = const {},
    this.librarySettings,
    this.libraryApps = const {},
    this.libraryAppInsts = const {},
    this.libraryAppInstLaunchers = const {},
  });

  void _from(GeburaState other) {
    initialized = other.initialized;
    libraryListItems = other.libraryListItems;
    runningInsts = other.runningInsts;
    localLibraryScanResults = other.localLibraryScanResults;
    librarySettings = other.librarySettings;
    libraryApps = other.libraryApps;
    libraryAppInsts = other.libraryAppInsts;
    libraryAppInstLaunchers = other.libraryAppInstLaunchers;
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

class GeburaTrackCommonAppsState extends GeburaState with EventStatusMixin {
  GeburaTrackCommonAppsState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

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

class GeburaScanLocalLibraryState extends GeburaState with EventStatusMixin {
  GeburaScanLocalLibraryState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaLoadAppInstsState extends GeburaState with EventStatusMixin {
  GeburaLoadAppInstsState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaLoadAppInstLaunchersState extends GeburaState
    with EventStatusMixin {
  GeburaLoadAppInstLaunchersState(GeburaState state, this.statusCode,
      {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
