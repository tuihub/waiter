part of 'tiphereth_bloc.dart';

class TipherethState {
  late ServerConfig? serverConfig;
  late String? accessToken;
  late User? currentUser;
  late ServerInformation? serverInfo;
  late List<Account>? accounts;

  TipherethState({
    this.serverConfig,
    this.accessToken,
    this.currentUser,
    this.serverInfo,
    this.accounts,
  });

  TipherethState copyWith({
    ServerConfig? serverConfig,
    String? accessToken,
    User? currentUser,
    ServerInformation? serverInfo,
    List<Account>? accounts,
  }) {
    return TipherethState(
      serverConfig: serverConfig ?? this.serverConfig,
      accessToken: accessToken ?? this.accessToken,
      currentUser: currentUser ?? this.currentUser,
      serverInfo: serverInfo ?? this.serverInfo,
      accounts: accounts ?? this.accounts,
    );
  }

  void _from(TipherethState other) {
    serverConfig = other.serverConfig;
    accessToken = other.accessToken;
    currentUser = other.currentUser;
    serverInfo = other.serverInfo;
    accounts = other.accounts;
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

class TipherethGetAccountsState extends TipherethState with EventStatusMixin {
  TipherethGetAccountsState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethLinkAccountState extends TipherethState with EventStatusMixin {
  TipherethLinkAccountState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethUnLinkAccountState extends TipherethState with EventStatusMixin {
  TipherethUnLinkAccountState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
