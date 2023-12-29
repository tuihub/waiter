part of 'main_bloc.dart';

class MainState {
  late ServerConfig? serverConfig;
  late String? accessToken;
  late User? currentUser;
  late ServerInformation? serverInfo;

  MainState({
    this.serverConfig,
    this.accessToken,
    this.currentUser,
    this.serverInfo,
  });

  MainState copyWith({
    ServerConfig? serverConfig,
    String? accessToken,
    User? currentUser,
    ServerInformation? serverInfo,
  }) {
    return MainState(
      serverConfig: serverConfig ?? this.serverConfig,
      accessToken: accessToken ?? this.accessToken,
      currentUser: currentUser ?? this.currentUser,
      serverInfo: serverInfo ?? this.serverInfo,
    );
  }

  void _from(MainState other) {
    serverConfig = other.serverConfig;
    accessToken = other.accessToken;
    currentUser = other.currentUser;
    serverInfo = other.serverInfo;
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
