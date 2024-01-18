import 'package:data_table_2/data_table_2.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_io/io.dart' as io;
import 'package:url_launcher/url_launcher_string.dart';

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
        final importedSteamApps = state.importedSteamApps ?? [];
        final unImportedSteamApps = localSteamApps
            .where(
                (l) => importedSteamApps.every((i) => l.appId != i.steamAppID))
            .toList();
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                            '发现${unImportedSteamApps.length}个Steam游戏（已导入${importedSteamApps.length}个）'),
                        if (unImportedSteamApps.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            constraints: const BoxConstraints(
                              maxHeight: 400,
                            ),
                            child: _SteamGameList(apps: unImportedSteamApps),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

class _SteamGameList extends StatefulWidget {
  const _SteamGameList({
    required this.apps,
  });

  final List<InstalledSteamApps> apps;

  @override
  State<_SteamGameList> createState() => _SteamGameListState();
}

class _SteamGameListState extends State<_SteamGameList> {
  @override
  void initState() {
    super.initState();
    selectedIndex = List.generate(widget.apps.length, (index) => false);
  }

  late List<bool> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      onSelectAll: (isSelectedAll) {
        if (isSelectedAll ?? false) {
          setState(() {
            selectedIndex = List.generate(widget.apps.length, (index) => true);
          });
        } else {
          setState(() {
            selectedIndex = List.generate(widget.apps.length, (index) => false);
          });
        }
      },
      columns: [
        DataColumn2(
          label: Text(
              '游戏列表${selectedIndex.contains(true) ? '（已选${selectedIndex.where((element) => element).length}个）' : ''}'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: selectedIndex.contains(true)
                  ? () {
                      context.read<GeburaBloc>().add(
                            GeburaImportSteamAppsEvent(
                              widget.apps
                                  .where((element) => selectedIndex[
                                      widget.apps.indexOf(element)])
                                  .map((e) => e.appId)
                                  .toList(),
                            ),
                          );
                      for (var i = 0; i < selectedIndex.length; i++) {
                        selectedIndex[i] = false;
                      }
                    }
                  : null,
              child: const Text('导入选中'),
            ),
          ),
          fixedWidth: 150,
        ),
      ],
      rows: widget.apps
          .map(
            (e) => DataRow(
              selected: selectedIndex[widget.apps.indexOf(e)],
              onSelectChanged: (isSelected) {
                setState(() {
                  selectedIndex[widget.apps.indexOf(e)] = isSelected ?? false;
                });
              },
              cells: [
                DataCell(Row(
                  children: [
                    if (e.iconFilePath != null)
                      Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: ExtendedImage.file(
                                io.File(e.iconFilePath!),
                                width: 16,
                                height: 16,
                              )))
                    else
                      const Icon(Icons.image),
                    Text(e.name),
                  ],
                )),
                DataCell(
                  Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await launchUrlString(
                              'steam://nav/games/details/${e.appId}');
                        },
                        icon: Icon(const FaIcon(FontAwesomeIcons.steam).icon,
                            size: 16),
                        label: const Text('查看'),
                      )),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
