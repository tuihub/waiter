part of 'tiphereth_bloc.dart';

@immutable
sealed class TipherethEvent {}

class TipherethAutoLoginEvent extends TipherethEvent {}

class TipherethSetServerConfigEvent extends TipherethEvent {
  final ServerConfig config;

  TipherethSetServerConfigEvent(this.config);
}

class TipherethManualLoginEvent extends TipherethEvent {
  final String username;
  final String password;

  TipherethManualLoginEvent(this.username, this.password);
}

class TipherethLogoutEvent extends TipherethEvent {}

class TipherethAddUserEvent extends TipherethEvent {
  final User user;

  TipherethAddUserEvent(this.user);
}

class TipherethEditUserEvent extends TipherethEvent {
  final User user;
  final String? password;

  TipherethEditUserEvent(this.user, {this.password});
}
