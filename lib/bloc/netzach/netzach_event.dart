part of 'netzach_bloc.dart';

@immutable
sealed class NetzachEvent {
  final EventContext context;

  NetzachEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

final class _NetzachSwitchServerEvent extends NetzachEvent {
  _NetzachSwitchServerEvent(ServerID serverID) : super(EventContext(serverID));
}

final class NetzachInitEvent extends NetzachEvent {
  NetzachInitEvent(super.context);
}

final class NetzachTargetLoadEvent extends NetzachEvent {
  NetzachTargetLoadEvent(super.context);
}

final class NetzachTargetAddEvent extends NetzachEvent {
  final NotifyTarget target;

  NetzachTargetAddEvent(super.context, this.target);
}

final class NetzachTargetEditEvent extends NetzachEvent {
  final NotifyTarget target;

  NetzachTargetEditEvent(super.context, this.target);
}

final class NetzachFlowLoadEvent extends NetzachEvent {
  NetzachFlowLoadEvent(super.context);
}

final class NetzachFlowAddEvent extends NetzachEvent {
  final NotifyFlow flow;

  NetzachFlowAddEvent(super.context, this.flow);
}

final class NetzachSetFlowEditIndexEvent extends NetzachEvent {
  final int index;

  NetzachSetFlowEditIndexEvent(super.context, this.index);
}

final class NetzachFlowEditEvent extends NetzachEvent {
  final NotifyFlow flow;

  NetzachFlowEditEvent(super.context, this.flow);
}

final class NetzachAggregationLogFilterSetEvent extends NetzachEvent {
  final List<LogLevel> levelFilter;
  final List<String>? serverIDs;

  NetzachAggregationLogFilterSetEvent(
    super.context,
    this.levelFilter, {
    this.serverIDs,
  });
}
