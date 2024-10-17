import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:native_flutter_proxy/native_proxy_reader.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

import '../../common/platform.dart';
import '../../rust/api/simple.dart';

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

  var proxy = await _readSystemProxy();
  if (!useSystemProxy) {
    proxy = null;
  }

  final channel = ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
      connectTimeout: const Duration(seconds: 10),
      credentials: credentials,
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      proxy: proxy,
    ),
  );
  return LibrarianSephirahServiceClient(channel);
}

Future<void> applySystemProxyImpl() async {
  final proxy = await _readSystemProxy();
  HttpOverrides.global =
      ProxiedHttpOverrides(proxy?.host, proxy?.port.toString());
}

Future<Proxy?> _readSystemProxy() async {
  Proxy? proxy;
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
      final (enabled, host, port) = await getSystemProxy();
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
  return proxy;
}

class ProxiedHttpOverrides extends HttpOverrides {
  final String? _port;
  final String? _host;
  ProxiedHttpOverrides(this._host, this._port);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      // set proxy
      ..findProxy = (uri) {
        return _host != null ? 'PROXY $_host:$_port;' : 'DIRECT';
      };
  }
}
