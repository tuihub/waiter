import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:native_flutter_proxy/native_proxy_reader.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

import '../../common/platform.dart';
import '../../ffi/ffi.dart';

Future<LibrarianSephirahServiceClient> newGrpc({
  required String host,
  required int port,
  required bool tls,
  bool useSystemProxy = false,
}) async {
  late ChannelCredentials credentials;
  if (tls) {
    credentials = const ChannelCredentials.secure();
  } else {
    credentials = const ChannelCredentials.insecure();
  }
  Proxy? proxy;
  if (useSystemProxy) {
    if (PlatformHelper.isAndroidApp()) {
      try {
        final ProxySetting settings = await NativeProxyReader.proxySetting;
        if (settings.enabled) {
          proxy = Proxy(
            host: settings.host!,
            port: settings.port!,
          );
        }
      } catch (e) {
        debugPrint('Failed to get system proxy: $e');
      }
    }
    if (PlatformHelper.isWindowsApp()) {
      try {
        final (enabled, host, port) = await FFI().getSystemProxy();
        if (enabled) {
          proxy = Proxy(
            host: host,
            port: port,
          );
        }
      } catch (e) {
        debugPrint('Failed to get system proxy: $e');
      }
    }
  }
  final channel = ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
      credentials: credentials,
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      proxy: proxy,
    ),
  );
  return LibrarianSephirahServiceClient(channel);
}
