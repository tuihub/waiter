import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_request_event.dart';
part 'api_request_state.dart';

class ApiRequestBloc extends Bloc<ApiRequestEvent, ApiRequestState> {
  ApiRequestBloc() : super(ApiRequestInitial()) {
    on<ApiRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
