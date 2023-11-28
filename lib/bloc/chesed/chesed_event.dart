part of 'chesed_bloc.dart';

@immutable
sealed class ChesedEvent {}

final class ChesedSearchImagesEvent extends ChesedEvent {
  final String query;

  ChesedSearchImagesEvent(this.query);
}

final class ChesedUploadImageEvent extends ChesedEvent {
  final ChesedUploadImageType type;

  ChesedUploadImageEvent(this.type);
}

enum ChesedUploadImageType { pick, capture }
