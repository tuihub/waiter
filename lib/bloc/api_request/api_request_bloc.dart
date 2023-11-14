import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/binah.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/chesed.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

part 'api_request_event.dart';
part 'api_request_state.dart';

class ApiRequestBloc extends Bloc<ApiRequestEvent, ApiRequestState> {
  final LibrarianSephirahServiceClient client;
  final String accessToken;
  ApiRequestBloc({required this.client, required this.accessToken})
      : super(ApiRequestInitial()) {
    final option =
        CallOptions(metadata: {'Authorization': 'Bearer $accessToken'});
    on<ApiRequestEvent>((event, emit) async {
      // if (event is UserTableLoadEvent) {
      //   emit(UserTableLoading());
      //   try {
      //     final resp = await client.listUsers(event.request, options: option);
      //     debugPrint(resp.toDebugString());
      //     emit(UserTableDone(resp));
      //   } catch (e) {
      //     debugPrint(e.toString());
      //
      //     if (e is GrpcError) {
      //       emit(UserTableFailed(e.code, e.message ?? '发生未知错误'));
      //     }
      //     emit(UserTableFailed(-1, '发生未知错误'));
      //   }
      // }
      // if (event is CreateUserEvent) {
      //   try {
      //     final resp = await client.createUser(event.request, options: option);
      //     debugPrint(resp.toDebugString());
      //   } catch (e) {
      //     debugPrint(e.toString());
      //
      //     if (e is GrpcError) {
      //       emit(UserTableFailed(e.code, e.message ?? '发生未知错误'));
      //     }
      //     emit(UserTableFailed(-1, '发生未知错误'));
      //   }
      // }
      if (event is GeburaLibraryRefreshEvent) {
        emit(GeburaRefreshLibrary());
      }
      if (event is ChesedLoadEvent) {
        emit(ChesedLoading());
        try {
          var ids = List<InternalID>.empty();
          if (event.request.keywords.isEmpty) {
            final resp = await client.listImages(
                ListImagesRequest(paging: event.request.paging),
                options: option);
            ids = resp.ids;
          } else {
            final resp =
                await client.searchImages(event.request, options: option);
            ids = resp.ids;
          }
          final res = List<PresignedDownloadFileResponse>.empty(growable: true);
          for (final id in ids) {
            try {
              final resp = await client
                  .downloadImage(DownloadImageRequest(id: id), options: option);
              debugPrint(resp.toString());
              final downloadOption = CallOptions(
                  metadata: {'Authorization': 'Bearer ${resp.downloadToken}'});
              final downloadResp = await client.presignedDownloadFile(
                  PresignedDownloadFileRequest(),
                  options: downloadOption);
              res.add(downloadResp);
            } catch (e) {
              debugPrint(e.toString());
            }
          }
          debugPrint(res.toString());
          emit(ChesedLoadDone(res));
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(ChesedFailed(e.code, e.message ?? '发生未知错误'));
          }
          emit(ChesedFailed(-1, '发生未知错误'));
        }
      }
      // if (event is LoadFeedConfig) {
      //   emit(YesodLoading());
      //   try {
      //     final resp =
      //         await client.listFeedConfigs(event.request, options: option);
      //     debugPrint(resp.toDebugString());
      //     emit(YesodLoadDone(resp));
      //   } catch (e) {
      //     debugPrint(e.toString());
      //
      //     if (e is GrpcError) {
      //       emit(YesodFailed(e.code, e.message ?? '发生未知错误'));
      //     }
      //     emit(YesodFailed(-1, '发生未知错误'));
      //   }
      // }
      // if (event is ListFeedItem) {
      //   emit(YesodLoading());
      //   try {
      //     final resp =
      //         await client.listFeedItems(event.request, options: option);
      //     debugPrint(resp.toDebugString());
      //     emit(YesodLoadDone(resp));
      //   } catch (e) {
      //     debugPrint(e.toString());
      //
      //     if (e is GrpcError) {
      //       emit(YesodFailed(e.code, e.message ?? '发生未知错误'));
      //     }
      //     emit(YesodFailed(-1, '发生未知错误'));
      //   }
      // }
      // if (event is CreateFeedConfig) {
      //   emit(YesodLoading());
      //   try {
      //     final resp =
      //         await client.createFeedConfig(event.request, options: option);
      //     debugPrint(resp.toDebugString());
      //     emit(YesodLoadDone(resp));
      //   } catch (e) {
      //     debugPrint(e.toString());
      //
      //     if (e is GrpcError) {
      //       emit(YesodFailed(e.code, e.message ?? '发生未知错误'));
      //     }
      //     emit(YesodFailed(-1, '发生未知错误'));
      //   }
      // }
      // if (event is PullFeedItem) {
      //   emit(YesodLoading());
      //   try {
      //     final resp =
      //         await client.groupFeedItems(event.request, options: option);
      //     debugPrint(resp.toDebugString());
      //     emit(YesodLoadDone(resp));
      //   } catch (e) {
      //     debugPrint(e.toString());
      //
      //     if (e is GrpcError) {
      //       emit(YesodFailed(e.code, e.message ?? '发生未知错误'));
      //     }
      //     emit(YesodFailed(-1, '发生未知错误'));
      //   }
      // }
    });
  }
}
