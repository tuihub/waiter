import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../l10n/l10n.dart';

enum ApiStatus { success, error, local }

class ApiResponse<T> {
  final T? data;
  final ApiStatus status;
  final String? error;

  ApiResponse(this.data, this.status, this.error);

  T getData() {
    if (status == ApiStatus.success) {
      return data!;
    } else {
      throw Exception('Response is not success');
    }
  }
}

enum ConnectionStatus {
  connected,
  disconnected,
  local,
}

class ApiHelper {
  final LibrarianSephirahServiceClient? _client;
  late CallOptions? _option;
  late String? _refreshToken;
  late ConnectionStatus _connectionStatus;

  ConnectionStatus get status => _connectionStatus;

  ApiHelper._({
    LibrarianSephirahServiceClient? client,
    String? refreshToken,
    CallOptions? option,
    ConnectionStatus connectionStatus = ConnectionStatus.local,
  })  : _connectionStatus = connectionStatus,
        _refreshToken = refreshToken,
        _option = option,
        _client = client;

  factory ApiHelper.local() {
    return ApiHelper._(connectionStatus: ConnectionStatus.local);
  }

  factory ApiHelper.grpc(
    LibrarianSephirahServiceClient client,
    String accessToken,
    String refreshToken,
  ) {
    return ApiHelper._(
      client: client,
      refreshToken: refreshToken,
      option: _newCallOptions(accessToken),
      connectionStatus: ConnectionStatus.disconnected,
    );
  }

  static CallOptions _newCallOptions(String bearerToken) {
    return CallOptions(
      metadata: {'Authorization': 'Bearer $bearerToken'},
      timeout: const Duration(seconds: 120),
    );
  }

  Future<ApiResponse<Res>> doRequestWithOptions<Req, Res>(
    ResponseFuture<Res> Function(Req, {CallOptions? options}) Function(
            LibrarianSephirahServiceClient client)
        requestBuilder,
    Req req,
    CallOptions? opt,
  ) async {
    // Check if the connection is local or uninitialized
    if (_connectionStatus == ConnectionStatus.local ||
        _client == null ||
        _refreshToken == null) {
      return ApiResponse(null, ApiStatus.local, null);
    }

    final requestFunc = requestBuilder(_client);
    final option =
        opt != null ? (_option ?? CallOptions()).mergedWith(opt) : _option;

    try {
      final resp = await requestFunc(req, options: option);
      return ApiResponse(resp, ApiStatus.success, null);
    } catch (e) {
      await Sentry.captureException(e);
      if (e is GrpcError &&
          e.code == StatusCode.unauthenticated &&
          await doRefresh()) {
        try {
          final option = opt != null
              ? (_option ?? CallOptions()).mergedWith(opt)
              : _option;
          final resp = await requestFunc(req, options: option);
          return ApiResponse(resp, ApiStatus.success, null);
        } catch (e) {
          await Sentry.captureException(e);
          if (e is GrpcError) {
            return ApiResponse(null, ApiStatus.error,
                e.message ?? S.current.unknownErrorOccurred);
          }
          return ApiResponse(null, ApiStatus.error, e.toString());
        }
      }
      debugPrint(e.toString());
      if (e is GrpcError) {
        return ApiResponse(
            null, ApiStatus.error, e.message ?? S.current.unknownErrorOccurred);
      }
      return ApiResponse(null, ApiStatus.error, e.toString());
    }
  }

  Future<ApiResponse<Res>> doRequest<Req, Res>(
    ResponseFuture<Res> Function(Req, {CallOptions? options}) Function(
            LibrarianSephirahServiceClient client)
        requestBuilder,
    Req req,
  ) async {
    return doRequestWithOptions<Req, Res>(requestBuilder, req, null);
  }

  Future<bool> doRefresh() async {
    // Check if the connection is local or uninitialized
    if (_connectionStatus == ConnectionStatus.local ||
        _client == null ||
        _refreshToken == null) {
      return false;
    }

    try {
      debugPrint('refreshing token');
      final resp = await _client.refreshToken(RefreshTokenRequest(),
          options: _newCallOptions(_refreshToken!));
      _option = _newCallOptions(resp.accessToken);
      _refreshToken = resp.refreshToken;
    } catch (e) {
      debugPrint(e.toString());
      _connectionStatus = ConnectionStatus.disconnected;
      return false;
    }
    _connectionStatus = ConnectionStatus.connected;
    return true;
  }
}
