part of 'api_request_bloc.dart';

@immutable
abstract class ApiRequestState {}

class ApiRequestInitial extends ApiRequestState {}

// class UserTableBase extends ApiRequestState {}
//
// class UserTableLoading extends UserTableBase {}
//
// class UserTableDone extends UserTableBase {
//   final ListUsersResponse resp;
//
//   UserTableDone(this.resp);
// }
//
// class UserTableFailed extends UserTableBase {
//   final int code;
//   final String message;
//
//   UserTableFailed(this.code, this.message);
// }

class GeburaState extends ApiRequestState {}

class GeburaRefreshLibrary extends GeburaState {}

class ChesedState extends ApiRequestState {}

class ChesedLoading extends ChesedState {}

class ChesedLoadDone extends ChesedState {
  final List<PresignedDownloadFileResponse> resp;

  ChesedLoadDone(this.resp);
}

class ChesedFailed extends ChesedState {
  final int code;
  final String message;

  ChesedFailed(this.code, this.message);
}
//
// class YesodState extends ApiRequestState {}
//
// class YesodLoading extends YesodState {}
//
// class YesodLoadDone<T> extends YesodState {
//   final T resp;
//
//   YesodLoadDone(this.resp);
// }
//
// class YesodFailed extends YesodState {
//   final int code;
//   final String message;
//
//   YesodFailed(this.code, this.message);
// }
