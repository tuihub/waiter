import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/steam/local_library.dart';
import '../../../route.dart';

class GeburaLibrarySettings extends StatelessWidget {
  const GeburaLibrarySettings({super.key});

  @override
  Widget build(BuildContext context) {
    bool firstBuild = true;
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        if (firstBuild) {
          firstBuild = false;
        }
        final localLibraryState = state.localLibraryState ?? '';
        final localSteamScanResult = state.localSteamScanResult;
        final localSteamApps = state.localSteamApps ?? [];
        late String? localSteamStateMsg;
        switch (localSteamScanResult) {
          case SteamScanResult.unavailable:
            localSteamStateMsg = '不支持当前平台';
          case SteamScanResult.steamInstallationNotFound:
            localSteamStateMsg = '未发现Steam客户端';
          case SteamScanResult.libraryFoldersNotFound:
            localSteamStateMsg = '未发现Steam游戏库';
          case SteamScanResult.unknownError:
            localSteamStateMsg = '扫描时出现未知错误';
          default:
            localSteamStateMsg = null;
        }
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(const FaIcon(FontAwesomeIcons.steam).icon),
                          const SizedBox(width: 16),
                          const Text('Steam'),
                          if (localSteamStateMsg == null)
                            Container()
                          else
                            Container(
                              margin: const EdgeInsets.only(left: 16),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                localSteamStateMsg,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          Expanded(child: Container()),
                          if (localSteamScanResult !=
                              SteamScanResult.unavailable)
                            OutlinedButton.icon(
                              onPressed: () {
                                context
                                    .read<GeburaBloc>()
                                    .add(GeburaScanLocalLibraryEvent());
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text('扫描'),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text('发现${localSteamApps.length}个Steam游戏'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AppRoutes.geburaLibrary.go(context);
            },
            child: const Icon(Icons.apps),
          ),
          floatingActionButtonLocation: localLibraryState.isNotEmpty
              ? FloatingActionButtonLocation.endContained
              : FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            child: BottomAppBar(
              height: localLibraryState.isNotEmpty ? 88 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localLibraryState,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 64),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
