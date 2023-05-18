import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'yesod_add_event.dart';
part 'yesod_add_state.dart';

class YesodAddBloc extends Bloc<YesodAddEvent, YesodAddState> {
  YesodAddBloc() : super(YesodAddInitial()) {
    on<YesodAddEvent>((event, emit) {
      if (event is YesodUrlCheckEvent) {}
    });
  }
}
