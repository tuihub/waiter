part of 'tiphereth_bloc.dart';

class TipherethState {
  late List<Account>? accounts;
  late List<Porter>? porters;

  late int? selectedPorterEditIndex;

  TipherethState({
    this.accounts,
    this.porters,
    this.selectedPorterEditIndex,
  });

  TipherethState copyWith({
    List<Account>? accounts,
    List<Porter>? porters,
    int? porterEditIndex,
  }) {
    return TipherethState(
      accounts: accounts ?? this.accounts,
      porters: porters ?? this.porters,
      selectedPorterEditIndex: porterEditIndex ?? this.selectedPorterEditIndex,
    );
  }

  void _from(TipherethState other) {
    accounts = other.accounts;
    porters = other.porters;
    selectedPorterEditIndex = other.selectedPorterEditIndex;
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
