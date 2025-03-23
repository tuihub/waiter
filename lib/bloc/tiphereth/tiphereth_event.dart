part of 'tiphereth_bloc.dart';

@immutable
sealed class TipherethEvent {
  final EventContext context;

  TipherethEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

final class _TipherethSwitchServerEvent extends TipherethEvent {
  _TipherethSwitchServerEvent(ServerID serverID)
      : super(EventContext(serverID));
}

final class TipherethEditUserEvent extends TipherethEvent {
  final User user;
  final String? password;

  TipherethEditUserEvent(super.context, this.user, {this.password});
}

final class TipherethGetAccountsEvent extends TipherethEvent {
  TipherethGetAccountsEvent(super.context);
}

final class TipherethLinkAccountEvent extends TipherethEvent {
  final String platform;
  final String platformAccountID;

  TipherethLinkAccountEvent(
      super.context, this.platform, this.platformAccountID);
}

final class TipherethUnLinkAccountEvent extends TipherethEvent {
  final String platform;
  final String platformAccountID;

  TipherethUnLinkAccountEvent(
      super.context, this.platform, this.platformAccountID);
}

final class TipherethAddPorterContextEvent extends TipherethEvent {
  final PorterContext porterContext;

  TipherethAddPorterContextEvent(super.context, this.porterContext);
}

final class TipherethEditPorterContextEvent extends TipherethEvent {
  final PorterContext porterContext;

  TipherethEditPorterContextEvent(super.context, this.porterContext);
}

final class TipherethLoadPorterContextsEvent extends TipherethEvent {
  TipherethLoadPorterContextsEvent(super.context);
}

final class TipherethLoadSessionsEvent extends TipherethEvent {
  TipherethLoadSessionsEvent(super.context);
}

final class TipherethEditSessionEvent extends TipherethEvent {
  final InternalID sessionID;

  TipherethEditSessionEvent(super.context, this.sessionID);
}
