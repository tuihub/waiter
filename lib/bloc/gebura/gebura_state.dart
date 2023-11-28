part of 'gebura_bloc.dart';

class GeburaState {
  late List<App>? purchasedApps;
  late int? selectedPurchasedAppIndex;

  late Map<InternalID, App>? storeApps;

  GeburaState({
    this.purchasedApps,
    this.selectedPurchasedAppIndex,
    this.storeApps,
  });

  GeburaState copyWith({
    List<App>? purchasedApps,
    int? selectedPurchasedAppIndex,
    Map<InternalID, App>? storeApps,
  }) {
    return GeburaState(
      purchasedApps: purchasedApps ?? this.purchasedApps,
      selectedPurchasedAppIndex:
          selectedPurchasedAppIndex ?? this.selectedPurchasedAppIndex,
      storeApps: storeApps ?? this.storeApps,
    );
  }

  void _from(GeburaState other) {
    purchasedApps = other.purchasedApps;
    selectedPurchasedAppIndex = other.selectedPurchasedAppIndex;
    storeApps = other.storeApps;
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

  final List<App>? apps;

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
