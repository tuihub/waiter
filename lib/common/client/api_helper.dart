import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

enum ApiStatus { success, error }

class ApiResponse<T> {
  final T? data;
  final ApiStatus status;
  final String? error;

  ApiResponse(this.data, this.status, this.error);

  T getResponse() {
    if (status == ApiStatus.success) {
      return data!;
    } else {
      throw Exception("Response is not success");
    }
  }
}

class ApiHelper {
  late final LibrarianSephirahServiceClient client;
  late final CallOptions option;

  /// private constructor
  ApiHelper._();

  /// the one and only instance of this singleton
  static final instance = ApiHelper._();

  void init(LibrarianSephirahServiceClient client, String accessToken) {
    this.client = client;
    final option = CallOptions(
        metadata: {'Authorization': 'Bearer $accessToken'},
        timeout: const Duration(seconds: 120));
    this.option = option;
  }

  Future<ApiResponse<T>> doRequest<T>(
      Future<T> Function(
              LibrarianSephirahServiceClient client, CallOptions option)
          request) async {
    try {
      final resp = await request(client, option);
      return ApiResponse(resp, ApiStatus.success, null);
    } catch (e) {
      debugPrint(e.toString());
      if (e is GrpcError) {
        return ApiResponse(null, ApiStatus.error, e.message ?? "发生未知错误");
      }
      return ApiResponse(null, ApiStatus.error, e.toString());
    }
  }
}
