part of 'tiphereth_bloc.dart';

class TipherethState {
  late List<Account>? accounts;

  TipherethState({
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
      accounts: accounts ?? this.accounts,
    );
  }

  void _from(TipherethState other) {
    accounts = other.accounts;
  }
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
