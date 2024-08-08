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

class TipherethAddPorterContextEvent extends TipherethEvent {
  final PorterContext porterContext;

  TipherethAddPorterContextEvent(this.porterContext);
}

class TipherethEditPorterContextEvent extends TipherethEvent {
  final PorterContext porterContext;

  TipherethEditPorterContextEvent(this.porterContext);
}

class TipherethLoadPorterContextsEvent extends TipherethEvent {}

class TipherethLoadSessionsEvent extends TipherethEvent {}

class TipherethSetSessionEditIndexEvent extends TipherethEvent {
  final int index;

  TipherethSetSessionEditIndexEvent(this.index);
}

class TipherethEditSessionEvent extends TipherethEvent {
  final InternalID sessionID;

  TipherethEditSessionEvent(this.sessionID);
}
