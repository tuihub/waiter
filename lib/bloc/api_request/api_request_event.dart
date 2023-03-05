part of 'api_request_bloc.dart';

@immutable
abstract class ApiRequestEvent {}

class UserTableRequestEvent extends ApiRequestEvent {}

class UserTableLoadEvent extends UserTableRequestEvent {
  final ListUsersRequest request;

  UserTableLoadEvent(this.request);
}

class CreateUserEvent extends UserTableRequestEvent {
  final CreateUserRequest request;

  CreateUserEvent(this.request);
}

class GeburaEvent extends ApiRequestEvent {}

class GeburaLoadEvent extends GeburaEvent {
  final ListAppRequest request;

  GeburaLoadEvent(this.request);
}
