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
  final ListAppsRequest request;

  GeburaLoadEvent(this.request);
}

class ChesedEvent extends ApiRequestEvent {}

class ChesedLoadEvent extends ChesedEvent {
  final SearchImagesRequest request;

  ChesedLoadEvent(this.request);
}

class YesodEvent extends ApiRequestEvent {}

class ListFeedItem extends YesodEvent {
  final ListFeedItemsRequest request;

  ListFeedItem(this.request);
}

class CreateFeedConfig extends YesodEvent {
  final CreateFeedConfigRequest request;

  CreateFeedConfig(this.request);
}

class LoadFeedConfig extends YesodEvent {
  final ListFeedConfigsRequest request;

  LoadFeedConfig(this.request);
}

class PullFeedItem extends YesodEvent {
  final GroupFeedItemsRequest request;

  PullFeedItem(this.request);
}
