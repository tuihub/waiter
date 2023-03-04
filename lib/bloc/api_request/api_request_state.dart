part of 'api_request_bloc.dart';

@immutable
abstract class ApiRequestState {}

class ApiRequestInitial extends ApiRequestState {}

class UserTableBase extends ApiRequestState {}

class UserTableLoading extends UserTableBase {}

class UserTableDone extends UserTableBase {
  final ListUserResponse resp;

  UserTableDone(this.resp);
}

class UserTableFailed extends UserTableBase {
  final int code;
  final String message;

  UserTableFailed(this.code, this.message);
}

class GeburaState extends ApiRequestState {}

class GeburaLoading extends GeburaState {}

class GeburaLoadDone extends GeburaState {
  final ListAppResponse resp;

  GeburaLoadDone(this.resp);
}

class GeburaFailed extends GeburaState {
  final int code;
  final String message;

  GeburaFailed(this.code, this.message);
}
