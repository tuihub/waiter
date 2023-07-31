import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

enum ApiStatus { success, error }

class ApiResponse<T> {
  final T? data;
  final ApiStatus status;
  final String? error;

  ApiResponse(this.data, this.status, this.error);

  T getData() {
    if (status == ApiStatus.success) {
      return data!;
    } else {
      throw Exception("Response is not success");
    }
  }
}

class ApiHelper {
  late LibrarianSephirahServiceClient client;
  late CallOptions option;
  late String refreshToken;

  void init(LibrarianSephirahServiceClient client, String accessToken,
      String refreshToken) {
    this.client = client;
    final option = newCallOptions(accessToken);
    this.option = option;
    this.refreshToken = refreshToken;
  }

  CallOptions newCallOptions(String bearerToken) {
    return CallOptions(
      metadata: {'Authorization': 'Bearer $bearerToken'},
      timeout: const Duration(seconds: 120),
    );
  }

  Future<ApiResponse<T>> doRequest<T>(
      Future<T> Function(
              LibrarianSephirahServiceClient client, CallOptions option)
          request) async {
    try {
      final resp = await request(client, option);
      return ApiResponse(resp, ApiStatus.success, null);
    } catch (e) {
      if (e is GrpcError &&
          e.code == StatusCode.unauthenticated &&
          await doRefresh()) {
        try {
          final resp = await request(client, option);
          return ApiResponse(resp, ApiStatus.success, null);
        } catch (e) {
          if (e is GrpcError) {
            return ApiResponse(null, ApiStatus.error, e.message ?? "发生未知错误");
          }
          return ApiResponse(null, ApiStatus.error, e.toString());
        }
      }
      debugPrint(e.toString());
      if (e is GrpcError) {
        return ApiResponse(null, ApiStatus.error, e.message ?? "发生未知错误");
      }
      return ApiResponse(null, ApiStatus.error, e.toString());
    }
  }

  Future<bool> doRefresh() async {
    try {
      debugPrint("refreshing token");
      final resp = await client.refreshToken(RefreshTokenRequest(),
          options: newCallOptions(refreshToken));
      option = newCallOptions(resp.accessToken);
      refreshToken = resp.refreshToken;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return true;
  }
}
