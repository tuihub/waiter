import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:uni_links/uni_links.dart';

import '../model/common_model.dart';

@immutable
sealed class DeepLinkEvent {}

class DeepLinkInitEvent extends DeepLinkEvent {}

class DeepLinkState {}

class DeepLinkConnectState extends DeepLinkState {
  final ServerConfig serverConfig;

  DeepLinkConnectState(this.serverConfig);
}

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  StreamSubscription? _sub;

  DeepLinkBloc(Uri? initialUri) : super(DeepLinkState()) {
    on<DeepLinkInitEvent>((event, emit) async {
      void process(Uri? uri) {
        if (uri == null) return;
        if (uri.host == 'connect') {
          if (uri.pathSegments.length == 1) {
            final host = uri.pathSegments[0];
            final port =
                int.tryParse(uri.queryParameters['port'] ?? '443') ?? 443;
            final tls = uri.queryParameters['tls'] == 'true';
            debugPrint('connect: $host:$port, tls: $tls');
            emit(DeepLinkConnectState(
              ServerConfig(host, port, tls, ''),
            ));
          }
        }
        return;
      }

      process(initialUri);
      _sub = uriLinkStream.listen(process);
      while (_sub != null) {
        await Future.delayed(const Duration(seconds: 1));
      }
    });

    add(DeepLinkInitEvent());
  }

  void dispose() {
    _sub?.cancel();
    super.close();
  }
}
