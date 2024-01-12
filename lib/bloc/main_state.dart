part of 'main_bloc.dart';

class MainState {
  late ServerConfig? serverConfig;
  late String? accessToken;
  late User? currentUser;
  late ServerInformation? serverInfo;
  late ServerFeatureSummary? serverFeatureSummary;
  late InternalID? currentDeviceId;
  late ClientDeviceInfo? deviceInfo;

  MainState({
    this.serverConfig,
    this.accessToken,
    this.currentUser,
    this.serverInfo,
    this.serverFeatureSummary,
    this.currentDeviceId,
    this.deviceInfo,
  });

  MainState copyWith({
    ServerConfig? serverConfig,
    String? accessToken,
    User? currentUser,
    ServerInformation? serverInfo,
    ServerFeatureSummary? serverFeatureSummary,
    InternalID? currentDeviceId,
    ClientDeviceInfo? deviceInfo,
  }) {
    return MainState(
      serverConfig: serverConfig ?? this.serverConfig,
      accessToken: accessToken ?? this.accessToken,
      currentUser: currentUser ?? this.currentUser,
      serverInfo: serverInfo ?? this.serverInfo,
      serverFeatureSummary: serverFeatureSummary ?? this.serverFeatureSummary,
      currentDeviceId: currentDeviceId ?? this.currentDeviceId,
      deviceInfo: deviceInfo ?? this.deviceInfo,
    );
  }

  void _from(MainState other) {
    serverConfig = other.serverConfig;
    accessToken = other.accessToken;
    currentUser = other.currentUser;
    serverInfo = other.serverInfo;
    serverFeatureSummary = other.serverFeatureSummary;
    currentDeviceId = other.currentDeviceId;
    deviceInfo = other.deviceInfo;
  }
}

class MainAutoLoginState extends MainState with EventStatusMixin {
  MainAutoLoginState(MainState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class MainManualLoginState extends MainState with EventStatusMixin {
  MainManualLoginState(MainState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
