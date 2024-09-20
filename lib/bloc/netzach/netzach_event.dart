part of 'netzach_bloc.dart';

@immutable
sealed class NetzachEvent {}

final class NetzachInitEvent extends NetzachEvent {}

final class NetzachTargetLoadEvent extends NetzachEvent {}

final class NetzachTargetAddEvent extends NetzachEvent {
  final NotifyTarget target;

  NetzachTargetAddEvent(this.target);
}

final class NetzachTargetEditEvent extends NetzachEvent {
  final NotifyTarget target;

  NetzachTargetEditEvent(this.target);
}

final class NetzachFlowLoadEvent extends NetzachEvent {}

final class NetzachFlowAddEvent extends NetzachEvent {
  final NotifyFlow flow;

  NetzachFlowAddEvent(this.flow);
}

final class NetzachSetFlowEditIndexEvent extends NetzachEvent {
  final int index;

  NetzachSetFlowEditIndexEvent(this.index);
}

final class NetzachFlowEditEvent extends NetzachEvent {
  final NotifyFlow flow;

  NetzachFlowEditEvent(this.flow);
}

final class NetzachSystemNotificationLoadEvent extends NetzachEvent {
  final int page;

  NetzachSystemNotificationLoadEvent(this.page);
}

final class NetzachSystemNotificationFilterSetEvent extends NetzachEvent {
  final SystemNotificationFilter filter;

  NetzachSystemNotificationFilterSetEvent(this.filter);
}
