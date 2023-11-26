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

class GeburaPurchasedAppsLoadState extends GeburaState with GeburaRequest {
  GeburaPurchasedAppsLoadState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final GeburaRequestStatusCode? statusCode;

  @override
  final String? msg;
}

class GeburaSearchAppsState extends GeburaState with GeburaRequest {
  GeburaSearchAppsState(GeburaState state, this.statusCode,
      {this.msg, this.apps})
      : super() {
    _from(state);
  }

  final List<App>? apps;

  @override
  final GeburaRequestStatusCode? statusCode;

  @override
  final String? msg;
}

class GeburaPurchaseState extends GeburaState with GeburaRequest {
  GeburaPurchaseState(GeburaState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final GeburaRequestStatusCode? statusCode;

  @override
  final String? msg;
}

class GeburaSetAppLauncherSettingState extends GeburaState with GeburaRequest {
  GeburaSetAppLauncherSettingState(GeburaState state, this.statusCode,
      {this.msg})
      : super() {
    _from(state);
  }

  @override
  final GeburaRequestStatusCode? statusCode;

  @override
  final String? msg;
}

class GeburaGetAppLauncherSettingState extends GeburaState with GeburaRequest {
  GeburaGetAppLauncherSettingState(GeburaState state, this.statusCode,
      {this.msg, this.setting})
      : super() {
    _from(state);
  }

  final AppLauncherSetting? setting;

  @override
  final GeburaRequestStatusCode? statusCode;

  @override
  final String? msg;
}

mixin GeburaRequest on GeburaState {
  GeburaRequestStatusCode? get statusCode;
  String? get msg;

  bool get processing => statusCode == GeburaRequestStatusCode.processing;
  bool get success => statusCode == GeburaRequestStatusCode.success;
  bool get failed => statusCode == GeburaRequestStatusCode.failed;
}

enum GeburaRequestStatusCode {
  processing,
  success,
  failed,
}
