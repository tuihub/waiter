part of 'netzach_bloc.dart';

class NetzachState {
  late List<NotifyTarget>? notifyTargets;
  late List<NotifyFlow>? notifyFlows;

  late int? notifyTargetEditIndex;
  late int? notifyFlowEditIndex;

  NetzachState({
    this.notifyTargets,
    this.notifyTargetEditIndex,
    this.notifyFlows,
    this.notifyFlowEditIndex,
  });

  NetzachState copyWith({
    List<NotifyTarget>? notifyTargets,
    int? notifyTargetEditIndex,
    List<NotifyFlow>? notifyFlows,
    int? notifyFlowEditIndex,
  }) {
    return NetzachState(
      notifyTargets: notifyTargets ?? this.notifyTargets,
      notifyTargetEditIndex:
          notifyTargetEditIndex ?? this.notifyTargetEditIndex,
      notifyFlows: notifyFlows ?? this.notifyFlows,
      notifyFlowEditIndex: notifyFlowEditIndex ?? this.notifyFlowEditIndex,
    );
  }

  void _from(NetzachState other) {
    notifyTargets = other.notifyTargets;
    notifyTargetEditIndex = other.notifyTargetEditIndex;
    notifyFlows = other.notifyFlows;
    notifyFlowEditIndex = other.notifyFlowEditIndex;
  }
}

class NetzachTargetLoadState extends NetzachState with EventStatusMixin {
  NetzachTargetLoadState(NetzachState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class NetzachTargetAddState extends NetzachState with EventStatusMixin {
  NetzachTargetAddState(NetzachState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class NetzachTargetEditState extends NetzachState with EventStatusMixin {
  NetzachTargetEditState(NetzachState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class NetzachFlowLoadState extends NetzachState with EventStatusMixin {
  NetzachFlowLoadState(NetzachState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class NetzachFlowAddState extends NetzachState with EventStatusMixin {
  NetzachFlowAddState(NetzachState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class NetzachFlowEditState extends NetzachState with EventStatusMixin {
  NetzachFlowEditState(NetzachState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}
