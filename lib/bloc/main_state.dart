part of 'main_bloc.dart';

class MainState {
  late ServerConfig? currentServer;
  late ServerConfig? nextServer;
  late User? currentUser;
  late ServerInformation? serverInfo;
  late ServerFeatureSummary? serverFeatureSummary;
  late InternalID? currentDeviceId;
  late ClientDeviceInfo? deviceInfo;
  late List<ServerConfig>? knownServers;

  MainState({
    this.currentServer,
    this.nextServer,
    this.currentUser,
    this.serverInfo,
    this.serverFeatureSummary,
    this.currentDeviceId,
    this.deviceInfo,
    this.knownServers,
  });

  MainState copyWith({
    ServerConfig? currentServer,
    ServerConfig? nextServer,
    String? accessToken,
    User? currentUser,
    ServerInformation? serverInfo,
    ServerFeatureSummary? serverFeatureSummary,
    InternalID? currentDeviceId,
    ClientDeviceInfo? deviceInfo,
    List<ServerConfig>? knownServers,
  }) {
    return MainState(
      currentServer: currentServer ?? this.currentServer,
      nextServer: nextServer ?? this.nextServer,
      currentUser: currentUser ?? this.currentUser,
      serverInfo: serverInfo ?? this.serverInfo,
      serverFeatureSummary: serverFeatureSummary ?? this.serverFeatureSummary,
      currentDeviceId: currentDeviceId ?? this.currentDeviceId,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      knownServers: knownServers ?? this.knownServers,
    );
  }

  void _from(MainState other) {
    currentServer = other.currentServer;
    nextServer = other.nextServer;
    currentUser = other.currentUser;
    serverInfo = other.serverInfo;
    serverFeatureSummary = other.serverFeatureSummary;
    currentDeviceId = other.currentDeviceId;
    deviceInfo = other.deviceInfo;
    knownServers = other.knownServers;
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

class MainNewServerSetState extends MainState {
  MainNewServerSetState(MainState state) : super() {
    _from(state);
  }
}
