part of 'gebura_bloc.dart';

class GeburaState {
  late List<AppInfoMixed>? purchasedAppInfos;
  late int? selectedPurchasedAppInfoIndex;

  late Map<InternalID, List<AppInfo>>? storeAppInfos;
  late Map<InternalID, AppRunState>? runState;

  late String? localLibraryState;
  late SteamScanResult? localSteamScanResult;
  late List<InstalledSteamApps>? localSteamApps;
  late List<ImportedSteamApp>? importedSteamApps;
  late List<String>? localSteamLibraryFolders;

  GeburaState({
    this.purchasedAppInfos,
    this.selectedPurchasedAppInfoIndex,
    this.storeAppInfos,
    this.runState,
    this.localLibraryState,
    this.localSteamScanResult,
    this.localSteamApps,
    this.importedSteamApps,
    this.localSteamLibraryFolders,
  });

  GeburaState copyWith({
    List<AppInfoMixed>? purchasedAppInfos,
    int? selectedPurchasedAppInfoIndex,
    Map<InternalID, List<AppInfo>>? storeAppInfos,
    Map<InternalID, AppRunState>? runState,
    String? localLibraryState,
    SteamScanResult? localSteamScanResult,
    List<InstalledSteamApps>? localSteamApps,
    List<ImportedSteamApp>? importedSteamApps,
    List<String>? localSteamLibraryFolders,
  }) {
    return GeburaState(
      purchasedAppInfos: purchasedAppInfos ?? this.purchasedAppInfos,
      selectedPurchasedAppInfoIndex:
          selectedPurchasedAppInfoIndex ?? this.selectedPurchasedAppInfoIndex,
      storeAppInfos: storeAppInfos ?? this.storeAppInfos,
      runState: runState ?? this.runState,
      localLibraryState: localLibraryState ?? this.localLibraryState,
      localSteamScanResult: localSteamScanResult ?? this.localSteamScanResult,
      localSteamApps: localSteamApps ?? this.localSteamApps,
      importedSteamApps: importedSteamApps ?? this.importedSteamApps,
      localSteamLibraryFolders:
          localSteamLibraryFolders ?? this.localSteamLibraryFolders,
    );
  }

  void _from(GeburaState other) {
    purchasedAppInfos = other.purchasedAppInfos;
    selectedPurchasedAppInfoIndex = other.selectedPurchasedAppInfoIndex;
    storeAppInfos = other.storeAppInfos;
    runState = other.runState;
    localLibraryState = other.localLibraryState;
    localSteamScanResult = other.localSteamScanResult;
    localSteamApps = other.localSteamApps;
    importedSteamApps = other.importedSteamApps;
    localSteamLibraryFolders = other.localSteamLibraryFolders;
  }
}

class GeburaPurchasedAppsLoadState extends GeburaState with EventStatusMixin {
  GeburaPurchasedAppsLoadState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class GeburaSearchAppsState extends GeburaState with EventStatusMixin {
  GeburaSearchAppsState(GeburaState state, this.statusCode,
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

class GeburaSetAppLauncherSettingState extends GeburaState
    with EventStatusMixin {
  GeburaSetAppLauncherSettingState(GeburaState state, this.statusCode,
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

class GeburaRunAppState extends GeburaState with EventStatusMixin {
  GeburaRunAppState(GeburaState state, this.appID, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  final InternalID appID;

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
