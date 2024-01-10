part of 'tiphereth_bloc.dart';

@immutable
sealed class TipherethEvent {}

class TipherethAddUserEvent extends TipherethEvent {
  final User user;

  TipherethAddUserEvent(this.user);
}

class TipherethEditUserEvent extends TipherethEvent {
  final User user;
  final String? password;

  TipherethEditUserEvent(this.user, {this.password});
}

class TipherethGetAccountsEvent extends TipherethEvent {}

class TipherethLinkAccountEvent extends TipherethEvent {
  final String platform;
  final String platformAccountID;

  TipherethLinkAccountEvent(this.platform, this.platformAccountID);
}

class TipherethUnLinkAccountEvent extends TipherethEvent {
  final String platform;
  final String platformAccountID;

  TipherethUnLinkAccountEvent(this.platform, this.platformAccountID);
}

class TipherethLoadPortersEvent extends TipherethEvent {}

class TipherethSetPorterEditIndexEvent extends TipherethEvent {
  final int index;

  TipherethSetPorterEditIndexEvent(this.index);
}

class TipherethEditPorterEvent extends TipherethEvent {
  final InternalID porterID;
  final UserStatus status;

  TipherethEditPorterEvent(this.porterID, this.status);
}
