import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uni_links/uni_links.dart';

import '../common/platform.dart';
import '../model/common_model.dart';

part 'deeplink_bloc.g.dart';

@immutable
sealed class DeepLinkEvent {}

class DeepLinkInitEvent extends DeepLinkEvent {}

@JsonSerializable()
class DeepLinkState {
  DeepLinkState();

  factory DeepLinkState.fromJson(Map<String, dynamic> json) =>
      _$DeepLinkStateFromJson(json);

  Map<String, dynamic> toJson() => _$DeepLinkStateToJson(this);
}

class DeepLinkConnectState extends DeepLinkState {
  final ServerConfig serverConfig;

  DeepLinkConnectState(this.serverConfig);
}

// DeepLinkBloc manages deep link events and states.
class DeepLinkBloc extends HydratedBloc<DeepLinkEvent, DeepLinkState> {
  StreamSubscription<Uri?>? _sub;

  DeepLinkBloc(Uri? initialUri) : super(DeepLinkState()) {
    on<DeepLinkInitEvent>((event, emit) async {
      try {
        if (PlatformHelper.isWeb()) return;
        void process(Uri? uri) {
          if (uri == null) return;
          if (uri.host == 'connect') {
            if (uri.pathSegments.length == 1) {
              final host = uri.pathSegments[0];
              final port =
                  int.tryParse(uri.queryParameters['port'] ?? '443') ?? 443;
              final tls = uri.queryParameters['tls'] != 'false';
              debugPrint('connect: $host:$port, tls: $tls');
              emit(DeepLinkConnectState(
                ServerConfig(host, port, tls),
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
      } catch (e) {
        debugPrint('DeepLinkBloc: $e');
      }
    });

    add(DeepLinkInitEvent());
  }

  Future<void> dispose() async {
    await _sub?.cancel();
    await super.close();
  }

  @override
  DeepLinkState? fromJson(Map<String, dynamic> json) {
    return DeepLinkState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DeepLinkState state) {
    return state.toJson();
  }
}
