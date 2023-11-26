part of 'gebura_bloc.dart';

@immutable
sealed class GeburaEvent {}

final class GeburaInitEvent extends GeburaEvent {}

final class GeburaPurchasedAppsLoadEvent extends GeburaEvent {}

final class GeburaSetPurchasedAppIndexEvent extends GeburaEvent {
  final int index;

  GeburaSetPurchasedAppIndexEvent(this.index);
}

final class GeburaSearchAppsEvent extends GeburaEvent {
  final String query;

  GeburaSearchAppsEvent(this.query);
}

final class GeburaPurchaseEvent extends GeburaEvent {
  final InternalID id;

  GeburaPurchaseEvent(this.id);
}
