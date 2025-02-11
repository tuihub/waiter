import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../service/di_service.dart';
import '../../service/librarian_service.dart';

part 'chesed_event.dart';
part 'chesed_state.dart';

class ChesedBloc extends Bloc<ChesedEvent, ChesedState> {
  final DIProvider<LibrarianService> _api;

  ChesedBloc(this._api) : super(ChesedState()) {
    // on<ChesedSearchImagesEvent>((event, emit) async {
    //   emit(ChesedSearchImagesState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.searchImages,
    //     SearchImagesRequest(
    //       paging: PagingRequest(pageNum: Int64(1), pageSize: Int64(50)),
    //       keywords: event.query,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(ChesedSearchImagesState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   final urls = List<String>.empty(growable: true);
    //   for (final id in resp.getData().ids) {
    //     try {
    //       final token = await _api.doRequest(
    //         (client) => client.downloadImage,
    //         DownloadImageRequest(id: id),
    //       );
    //
    //       final downloadOption = CallOptions(metadata: {
    //         'Authorization': 'Bearer ${token.getData().downloadToken}'
    //       });
    //
    //       final url = await _api.doRequestWithOptions(
    //         (client) => client.presignedDownloadFile,
    //         PresignedDownloadFileRequest(),
    //         downloadOption,
    //       );
    //       urls.add(url.getData().downloadUrl);
    //     } catch (e) {
    //       debugPrint(e.toString());
    //       emit(ChesedSearchImagesState(state, EventStatus.failed,
    //           msg: resp.error));
    //       return;
    //     }
    //   }
    //   emit(ChesedSearchImagesState(
    //       state.copyWith(imageUrls: urls), EventStatus.success,
    //       msg: resp.error));
    // }, transformer: droppable());

    // on<ChesedUploadImageEvent>((event, emit) async {
    //   emit(ChesedUploadImageState(state, EventStatus.processing));
    //   File file;
    //   FileMetadata fileMetadata;
    //   String extension;
    //   try {
    //     switch (event.type) {
    //       case ChesedUploadImageType.pick:
    //         {
    //           final pickResult = await file_picker.FilePicker.platform
    //               .pickFiles(type: file_picker.FileType.image);
    //           if (pickResult != null) {
    //             final pick = pickResult.files.first;
    //             file = File(pick.path!);
    //             fileMetadata = FileMetadata(
    //               name: pick.name,
    //               sizeBytes: Int64(file.lengthSync()),
    //               type: FileType.FILE_TYPE_CHESED_IMAGE,
    //             );
    //             extension = pick.extension!;
    //           } else {
    //             emit(ChesedUploadImageState(state, EventStatus.failed,
    //                 msg: S.current.updateImageUserCanceledPick));
    //             return;
    //           }
    //         }
    //       case ChesedUploadImageType.capture:
    //         {
    //           // TODOlinux platform rely on gnome-screenshot
    //           if (!await ScreenCapturer.instance.isAccessAllowed()) {
    //             return;
    //           }
    //           final Directory directory = await getTemporaryDirectory();
    //           final String imageName =
    //               'Screenshot-${DateTime.now().millisecondsSinceEpoch}.png';
    //           final String imagePath = '${directory.path}/$imageName';
    //           debugPrint('imagePath: $imagePath');
    //           final capturedData = await ScreenCapturer.instance.capture(
    //             mode: CaptureMode.region,
    //             imagePath: imagePath,
    //             silent: true,
    //           );
    //           if (capturedData != null) {
    //             file = File(capturedData.imagePath!);
    //             fileMetadata = FileMetadata(
    //               name: imageName,
    //               sizeBytes: Int64(file.lengthSync()),
    //               type: FileType.FILE_TYPE_CHESED_IMAGE,
    //             );
    //             extension = 'png';
    //           } else {
    //             emit(ChesedUploadImageState(state, EventStatus.failed,
    //                 msg: S.current.updateImageUserCanceledCapture));
    //             return;
    //           }
    //         }
    //     }
    //     final token = await _api.doRequest(
    //       (client) => client.uploadImage,
    //       UploadImageRequest(
    //         fileMetadata: fileMetadata,
    //         name: fileMetadata.name,
    //       ),
    //     );
    //     final uploadOption = CallOptions(metadata: {
    //       'Authorization': 'Bearer ${token.getData().uploadToken}'
    //     });
    //     final url = await _api.doRequestWithOptions(
    //       (client) => client.presignedUploadFile,
    //       PresignedUploadFileRequest(),
    //       uploadOption,
    //     );
    //     final uploadResponse = await http.put(
    //       Uri.parse(url.getData().uploadUrl),
    //       headers: {'Content-Type': 'image/$extension'},
    //       body: await file.readAsBytes(),
    //     );
    //     if (uploadResponse.statusCode != 200) {
    //       throw Exception(
    //           '${S.current.uploadImageFailed} ${uploadResponse.reasonPhrase}');
    //     }
    //     await _api.doRequestWithOptions(
    //       (client) => client.presignedUploadFileStatus,
    //       PresignedUploadFileStatusRequest(
    //         status: FileTransferStatus.FILE_TRANSFER_STATUS_SUCCESS,
    //       ),
    //       uploadOption,
    //     );
    //   } catch (e) {
    //     debugPrint(e.toString());
    //     emit(ChesedUploadImageState(state, EventStatus.failed,
    //         msg: e.toString()));
    //     return;
    //   }
    // }, transformer: droppable());
  }
}
