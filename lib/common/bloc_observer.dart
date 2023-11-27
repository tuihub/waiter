import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'bloc_event_status_mixin.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    String current = change.currentState.toString();
    String next = change.nextState.toString();
    if (change.currentState is EventStatusMixin) {
      final state = change.currentState as EventStatusMixin;
      current += '${state.statusCode} ${state.msg ?? ''}';
    }
    if (change.nextState is EventStatusMixin) {
      final state = change.nextState as EventStatusMixin;
      next += '${state.statusCode} ${state.msg ?? ''}';
    }
    debugPrint('[BLOC] ${bloc.runtimeType} current: $current, next: $next');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('[BLOC] ${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('[BLOC] ${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
