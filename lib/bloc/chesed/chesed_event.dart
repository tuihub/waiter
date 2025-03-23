part of 'chesed_bloc.dart';

@immutable
sealed class ChesedEvent {
  final EventContext context;

  ChesedEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

final class ChesedSearchImagesEvent extends ChesedEvent {
  final String query;

  ChesedSearchImagesEvent(super.context, this.query);
}

final class ChesedUploadImageEvent extends ChesedEvent {
  final ChesedUploadImageType type;

  ChesedUploadImageEvent(super.context, this.type);
}

enum ChesedUploadImageType { pick, capture }
