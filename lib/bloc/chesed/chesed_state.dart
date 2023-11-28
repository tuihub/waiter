part of 'chesed_bloc.dart';

class ChesedState {
  List<String>? imageUrls;

  ChesedState({
    this.imageUrls,
  });

  ChesedState copyWith({
    List<String>? imageUrls,
  }) {
    return ChesedState(
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  void _from(ChesedState other) {
    imageUrls = other.imageUrls;
  }
}

class ChesedSearchImagesState extends ChesedState with EventStatusMixin {
  ChesedSearchImagesState(ChesedState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class ChesedUploadImageState extends ChesedState with EventStatusMixin {
  ChesedUploadImageState(ChesedState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
