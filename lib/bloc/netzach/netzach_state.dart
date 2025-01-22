part of 'netzach_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class NetzachState with NetzachStateMappable {
  late List<NotifyTarget>? notifyTargets;
  late List<NotifyFlow>? notifyFlows;

  late int? notifyFlowEditIndex;

  late List<SystemNotification>? systemNotifications;
  late SystemNotificationFilter? systemNotificationFilter;

  NetzachState({
    this.notifyTargets,
    this.notifyFlows,
    this.notifyFlowEditIndex,
    this.systemNotifications,
    this.systemNotificationFilter,
  });

  NetzachState.clone(NetzachState other)
      : notifyTargets = other.notifyTargets,
        notifyFlows = other.notifyFlows,
        notifyFlowEditIndex = other.notifyFlowEditIndex,
        systemNotifications = other.systemNotifications,
        systemNotificationFilter = other.systemNotificationFilter;
}

class NetzachEventState extends NetzachState with EventStatusMixin {
  NetzachEventState.clone(super.state, this.statusCode, {this.msg})
      : super.clone();

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class NetzachTargetLoadState extends NetzachEventState {
  NetzachTargetLoadState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class NetzachTargetAddState extends NetzachEventState {
  NetzachTargetAddState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class NetzachTargetEditState extends NetzachEventState {
  NetzachTargetEditState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class NetzachFlowLoadState extends NetzachEventState {
  NetzachFlowLoadState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class NetzachFlowAddState extends NetzachEventState {
  NetzachFlowAddState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class NetzachFlowEditState extends NetzachEventState {
  NetzachFlowEditState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class NetzachSystemNotificationLoadState extends NetzachEventState {
  NetzachSystemNotificationLoadState(super.state, super.statusCode, {super.msg})
      : super.clone();
}
