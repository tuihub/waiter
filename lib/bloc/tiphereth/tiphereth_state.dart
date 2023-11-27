part of 'tiphereth_bloc.dart';

class TipherethState {
  late ServerConfig? serverConfig;
  late String? accessToken;
  late User? currentUser;
  late ServerInformation? serverInfo;

  TipherethState({
    this.serverConfig,
    this.accessToken,
    this.currentUser,
    this.serverInfo,
  });

  TipherethState copyWith({
    ServerConfig? serverConfig,
    String? accessToken,
    User? currentUser,
    ServerInformation? serverInfo,
  }) {
    return TipherethState(
      serverConfig: serverConfig ?? this.serverConfig,
      accessToken: accessToken ?? this.accessToken,
      currentUser: currentUser ?? this.currentUser,
      serverInfo: serverInfo ?? this.serverInfo,
    );
  }

  void _from(TipherethState other) {
    serverConfig = other.serverConfig;
    accessToken = other.accessToken;
    currentUser = other.currentUser;
    serverInfo = other.serverInfo;
  }
}

class TipherethAutoLoginState extends TipherethState with EventStatusMixin {
  TipherethAutoLoginState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethManualLoginState extends TipherethState with EventStatusMixin {
  TipherethManualLoginState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethAddUserState extends TipherethState with EventStatusMixin {
  TipherethAddUserState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethEditUserState extends TipherethState with EventStatusMixin {
  TipherethEditUserState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
