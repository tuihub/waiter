part of 'tiphereth_bloc.dart';

@immutable
sealed class TipherethEvent {
  final EventContext context;

  TipherethEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

class TipherethAddUserEvent extends TipherethEvent {
  final User user;

  TipherethAddUserEvent(super.context, this.user);
}

class TipherethEditUserEvent extends TipherethEvent {
  final User user;
  final String? password;

  TipherethEditUserEvent(super.context, this.user, {this.password});
}

class TipherethGetAccountsEvent extends TipherethEvent {
  TipherethGetAccountsEvent(super.context);
}

class TipherethLinkAccountEvent extends TipherethEvent {
  final String platform;
  final String platformAccountID;

  TipherethLinkAccountEvent(
      super.context, this.platform, this.platformAccountID);
}

class TipherethUnLinkAccountEvent extends TipherethEvent {
  final String platform;
  final String platformAccountID;

  TipherethUnLinkAccountEvent(
      super.context, this.platform, this.platformAccountID);
}

class TipherethLoadPortersEvent extends TipherethEvent {
  TipherethLoadPortersEvent(super.context);
}

class TipherethSetPorterEditIndexEvent extends TipherethEvent {
  final int index;

  TipherethSetPorterEditIndexEvent(super.context, this.index);
}

class TipherethEditPorterEvent extends TipherethEvent {
  final InternalID porterID;
  final UserStatus status;

  TipherethEditPorterEvent(super.context, this.porterID, this.status);
}

class TipherethAddPorterContextEvent extends TipherethEvent {
  final PorterContext porterContext;

  TipherethAddPorterContextEvent(super.context, this.porterContext);
}

class TipherethEditPorterContextEvent extends TipherethEvent {
  final PorterContext porterContext;

  TipherethEditPorterContextEvent(super.context, this.porterContext);
}

class TipherethLoadPorterContextsEvent extends TipherethEvent {
  TipherethLoadPorterContextsEvent(super.context);
}

class TipherethLoadSessionsEvent extends TipherethEvent {
  TipherethLoadSessionsEvent(super.context);
}

class TipherethSetSessionEditIndexEvent extends TipherethEvent {
  final int index;

  TipherethSetSessionEditIndexEvent(super.context, this.index);
}

class TipherethEditSessionEvent extends TipherethEvent {
  final InternalID sessionID;

  TipherethEditSessionEvent(super.context, this.sessionID);
}
