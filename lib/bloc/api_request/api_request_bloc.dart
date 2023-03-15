import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

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
      if (event is UserTableLoadEvent) {
        emit(UserTableLoading());
        try {
          final resp = await client.listUsers(event.request, options: option);
          debugPrint(resp.toDebugString());
          emit(UserTableDone(resp));
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(UserTableFailed(e.code, e.message ?? "发生未知错误"));
          }
          emit(UserTableFailed(-1, "发生未知错误"));
        }
      }
      if (event is CreateUserEvent) {
        try {
          final resp = await client.createUser(event.request, options: option);
          debugPrint(resp.toDebugString());
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(UserTableFailed(e.code, e.message ?? "发生未知错误"));
          }
          emit(UserTableFailed(-1, "发生未知错误"));
        }
      }
      if (event is GeburaLoadEvent) {
        emit(UserTableLoading());
        try {
          final resp = await client.listApp(event.request, options: option);
          debugPrint(resp.toDebugString());
          emit(GeburaLoadDone(resp));
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(GeburaFailed(e.code, e.message ?? "发生未知错误"));
          }
          emit(GeburaFailed(-1, "发生未知错误"));
        }
      }
      if (event is LoadFeedConfig) {
        emit(YesodLoading());
        try {
          final resp = await client.listFeeds(event.request, options: option);
          debugPrint(resp.toDebugString());
          emit(YesodLoadDone(resp));
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(YesodFailed(e.code, e.message ?? "发生未知错误"));
          }
          emit(YesodFailed(-1, "发生未知错误"));
        }
      }
      if (event is ListFeedItem) {
        emit(YesodLoading());
        try {
          final resp =
              await client.listFeedItems(event.request, options: option);
          debugPrint(resp.toDebugString());
          emit(YesodLoadDone(resp));
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(YesodFailed(e.code, e.message ?? "发生未知错误"));
          }
          emit(YesodFailed(-1, "发生未知错误"));
        }
      }
      if (event is CreateFeedConfig) {
        emit(YesodLoading());
        try {
          final resp =
              await client.createFeedConfig(event.request, options: option);
          debugPrint(resp.toDebugString());
          emit(YesodLoadDone(resp));
        } catch (e) {
          debugPrint(e.toString());

          if (e is GrpcError) {
            emit(YesodFailed(e.code, e.message ?? "发生未知错误"));
          }
          emit(YesodFailed(-1, "发生未知错误"));
        }
      }
    });
  }
}
