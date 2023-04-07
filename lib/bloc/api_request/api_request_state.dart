part of 'api_request_bloc.dart';

@immutable
abstract class ApiRequestState {}

class ApiRequestInitial extends ApiRequestState {}

class UserTableBase extends ApiRequestState {}

class UserTableLoading extends UserTableBase {}

class UserTableDone extends UserTableBase {
  final ListUsersResponse resp;

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
  final ListAppsResponse resp;

  GeburaLoadDone(this.resp);
}

class GeburaFailed extends GeburaState {
  final int code;
  final String message;

  GeburaFailed(this.code, this.message);
}

class YesodState extends ApiRequestState {}

class YesodLoading extends YesodState {}

class YesodLoadDone<T> extends YesodState {
  final T resp;

  YesodLoadDone(this.resp);
}

class YesodFailed extends YesodState {
  final int code;
  final String message;

  YesodFailed(this.code, this.message);
}
