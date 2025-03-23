part of 'chesed_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class ChesedState with ChesedStateMappable {
  late List<String>? imageUrls;

  ChesedState({
    this.imageUrls,
  });

  ChesedState.clone(ChesedState other) : imageUrls = other.imageUrls;
}

class ChesedEventState extends ChesedState with EventStatusMixin {
  ChesedEventState.clone(super.state, this.statusCode, {this.msg})
      : super.clone();

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class ChesedSearchImagesState extends ChesedEventState {
  ChesedSearchImagesState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class ChesedUploadImageState extends ChesedEventState {
  ChesedUploadImageState(super.state, super.statusCode, {super.msg})
      : super.clone();
}
