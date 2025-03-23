import 'dart:async';

import 'package:dao/dao.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:option_result/result.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as duration_pb;
import 'package:tuihub_protos/google/protobuf/timestamp.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/sephirah_service.pbgrpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../common/platform.dart';
import '../consts.dart';
import '../l10n/l10n.dart';
import '../model/common_model.dart';
import 'librarian_service/client.dart';

export 'package:option_result/result.dart';

class LibrarianService {
  ServerConfig? _config;
  String? _clientLocalID;
  LibrarianSephirahServiceClient? _client;
  CallOptions? _option;
  ConnectionStatus _connectionStatus;
  String _connectionStatusMessage = '';
  final StreamController<ConnectionStatus> _connectionStatusController =
      StreamController<ConnectionStatus>();
  final StreamController<ServerConfig> _serverConfigController =
      StreamController<ServerConfig>();

  ServerConfig? get config => _config;
  ConnectionStatus get connectionStatus => _connectionStatus;
  String get connectionStatusMessage => _connectionStatusMessage;
  Stream<ConnectionStatus> get connectionStatusStream =>
      _connectionStatusController.stream;
  Stream<ServerConfig> get serverConfigStream => _serverConfigController.stream;

  LibrarianService._({
    ServerConfig? config,
    LibrarianSephirahServiceClient? client,
    CallOptions? option,
    ConnectionStatus connectionStatus = ConnectionStatus.local,
  })  : _config = config,
        _connectionStatus = connectionStatus,
        _option = option,
        _client = client;

  factory LibrarianService.local() {
    return LibrarianService._();
  }

  static Future<LibrarianService> grpc(
    ServerConfig config, [
    bool useSystemProxy = false,
  ]) async {
    final client = await clientFactory(
      config: config,
      useSystemProxy: useSystemProxy,
    );
    final service = LibrarianService._(
      config: config,
      client: client,
      connectionStatus: ConnectionStatus.disconnected,
    );
    await service._doRefresh();
    return service;
  }

  Future<bool> loadConfig(
    ServerConfig config, [
    bool useSystemProxy = false,
    String? clientLocalID,
  ]) async {
    if (_config != null) {
      return false;
    }
    _config = config;
    _clientLocalID = clientLocalID;
    _client = await clientFactory(
      config: config,
      useSystemProxy: useSystemProxy,
    );
    _updateConnectionStatus(ConnectionStatus.disconnected);
    await _doRefresh();
    return true;
  }

  static CallOptions _newCallOptions(String bearerToken) {
    return CallOptions(
      metadata: {'Authorization': 'Bearer $bearerToken'},
      timeout: const Duration(seconds: 120),
    );
  }

  void _updateConnectionStatus(ConnectionStatus status, [String? message]) {
    final oldStatus = _connectionStatus;
    _connectionStatus = status;
    _connectionStatusMessage = message ?? '';
    if (oldStatus != status) _connectionStatusController.add(status);
    debugPrint('Connection status: $status');
  }

  void _updateServerConfig(ServerConfig config) {
    _config = config;
    _serverConfigController.add(config);
    debugPrint('Server config updated: ${config.serverID}');
  }

  Future<Result<Res, String>> doRequestWithOptions<Req, Res>(
    ResponseFuture<Res> Function(Req, {CallOptions? options}) Function(
            LibrarianSephirahServiceClient client)
        requestBuilder,
    Req req,
    CallOptions? opt,
  ) async {
    // Check if the connection is local or uninitialized
    if (_connectionStatus == ConnectionStatus.local || _client == null) {
      return const Err('Local mode');
    }

    final requestFunc = requestBuilder(_client!);
    final option =
        opt != null ? (_option ?? CallOptions()).mergedWith(opt) : _option;

    try {
      final resp = await requestFunc(req, options: option);
      return Ok(resp);
    } catch (e) {
      if (e is GrpcError &&
          e.code == StatusCode.unauthenticated &&
          await _doRefresh()) {
        try {
          final option = opt != null
              ? (_option ?? CallOptions()).mergedWith(opt)
              : _option;
          final resp = await requestFunc(req, options: option);
          return Ok(resp);
        } catch (e) {
          if (e is GrpcError) {
            return Err(e.message ?? S.current.unknownErrorOccurred);
          }
          return Err(e.toString());
        }
      }
      debugPrint(e.toString());
      if (e is GrpcError) {
        return Err(e.message ?? S.current.unknownErrorOccurred);
      }
      return Err(e.toString());
    }
  }

  Future<Result<Res, String>> doRequest<Req, Res>(
    ResponseFuture<Res> Function(Req, {CallOptions? options}) Function(
            LibrarianSephirahServiceClient client)
        requestBuilder,
    Req req,
  ) async {
    return doRequestWithOptions<Req, Res>(requestBuilder, req, null);
  }

  Future<bool> _doRefresh({bool withDeviceID = true}) async {
    // Check if the connection is local or uninitialized
    if (_connectionStatus == ConnectionStatus.local ||
        _client == null ||
        _config == null ||
        _config?.refreshToken == null) {
      return false;
    }

    InternalID? deviceId;
    if (_config!.deviceId != null) {
      deviceId = InternalID()..id = Int64(_config!.deviceId!);
    }

    try {
      debugPrint('refreshing token');
      final resp = await _client!.refreshToken(
          RefreshTokenRequest(
            deviceId: withDeviceID ? deviceId : null,
          ),
          options: _newCallOptions(_config!.refreshToken!));
      _option = _newCallOptions(resp.accessToken);
      _updateServerConfig(_config!.copyWith(refreshToken: resp.refreshToken));
      _updateConnectionStatus(ConnectionStatus.connected);
      if (withDeviceID && _config!.deviceId == null) {
        await _doRegisterDevice();
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      if (e is GrpcError) {
        if (e.code == StatusCode.notFound && withDeviceID) {
          await _doRefresh(withDeviceID: false);
          if (connectionStatus == ConnectionStatus.connected) {
            await _doRegisterDevice();
          }
        }
        if (e.code == StatusCode.unauthenticated) {
          _updateConnectionStatus(ConnectionStatus.unauthenticated, e.message);
        }
      } else {
        _updateConnectionStatus(ConnectionStatus.disconnected, e.toString());
      }
      return false;
    }
  }

  Future<String?> doLogin(String password) async {
    if (_config == null) {
      return S.current.unknownErrorOccurred;
    }
    final resp = await doRequest(
      (client) => client.getToken,
      GetTokenRequest(
        username: _config!.username,
        password: password,
      ),
    );
    switch (resp) {
      case (Err()):
        return resp.error;
      case (Ok()):
        _option = _newCallOptions(resp.v.accessToken);
        _updateServerConfig(
            _config!.copyWith(refreshToken: resp.v.refreshToken));
        _updateConnectionStatus(ConnectionStatus.connected);
        if (_config!.deviceId == null) {
          return _doRegisterDevice();
        }
        return null;
    }
  }

  Future<String?> _doRegisterDevice() async {
    if (_config == null) {
      return S.current.unknownErrorOccurred;
    }
    final deviceInfo = await _genDeviceInfo();
    final resp = await doRequest(
      (client) => client.registerDevice,
      RegisterDeviceRequest(
        deviceInfo: deviceInfo,
        clientLocalId: _clientLocalID,
      ),
    );
    switch (resp) {
      case (Err(value: final String error)):
        return error;
      case (Ok(value: final RegisterDeviceResponse resp)):
        _updateServerConfig(
            _config!.copyWith(deviceId: resp.deviceId.id.toInt()));
        await _doRefresh();
        return null;
    }
  }
}

Future<DeviceInfo> _genDeviceInfo() async {
  final deviceInfo = await PlatformHelper.clientDeviceInfoAsync();
  final packageInfo = await PackageInfo.fromPlatform();
  return DeviceInfo(
    deviceName: deviceInfo.deviceName,
    systemType: PlatformHelper.getSystemType(),
    systemVersion: deviceInfo.systemVersion,
    clientName: packageInfo.appName,
    clientSourceCodeAddress: clientSourceCodeUrl,
    clientVersion: packageInfo.version,
  );
}

duration_pb.Duration toPBDuration(Duration duration) {
  return duration_pb.Duration(seconds: Int64(duration.inSeconds));
}

TimeRange toPBTimeRange(DateTime start, DateTime end) {
  return TimeRange()
    ..startTime = Timestamp.fromDateTime(start)
    ..duration = toPBDuration(end.difference(start));
}

Duration fromPBDuration(duration_pb.Duration duration) {
  return Duration(seconds: duration.seconds.toInt());
}
