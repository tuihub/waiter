part of 'tiphereth_bloc.dart';

class TipherethState {
  late List<Account>? accounts;
  late List<Porter>? porters;
  late List<UserSession>? sessions;

  late int? selectedPorterEditIndex;
  late int? selectedSessionEditIndex;

  TipherethState({
    this.accounts,
    this.porters,
    this.sessions,
    this.selectedPorterEditIndex,
    this.selectedSessionEditIndex,
  });

  TipherethState copyWith({
    List<Account>? accounts,
    List<Porter>? porters,
    List<UserSession>? sessions,
    int? selectedPorterEditIndex,
    int? selectedSessionDeleteIndex,
  }) {
    return TipherethState(
      accounts: accounts ?? this.accounts,
      porters: porters ?? this.porters,
      sessions: sessions ?? this.sessions,
      selectedPorterEditIndex:
          selectedPorterEditIndex ?? this.selectedPorterEditIndex,
      selectedSessionEditIndex:
          selectedSessionDeleteIndex ?? this.selectedSessionEditIndex,
    );
  }

  void _from(TipherethState other) {
    accounts = other.accounts;
    porters = other.porters;
    sessions = other.sessions;
    selectedPorterEditIndex = other.selectedPorterEditIndex;
    selectedSessionEditIndex = other.selectedSessionEditIndex;
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

class TipherethLoadPortersState extends TipherethState with EventStatusMixin {
  TipherethLoadPortersState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethEditPorterState extends TipherethState with EventStatusMixin {
  TipherethEditPorterState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethLoadSessionsState extends TipherethState with EventStatusMixin {
  TipherethLoadSessionsState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethEditSessionState extends TipherethState with EventStatusMixin {
  TipherethEditSessionState(TipherethState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
