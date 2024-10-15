part of 'gebura_library_settings.dart';

class _SteamSettingCard extends StatelessWidget {
  const _SteamSettingCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final localSteamApps = state.localInstalledSteamAppInsts ?? {};
      final localTrackedSteamAppInsts = state.localTrackedAppInsts?.values
              .where((e) => e.steamLaunchSetting != null)
              .toList() ??
          [];
      final untrackedSteamApps = localSteamApps.values
          .where(
            (l) => localTrackedSteamAppInsts.every(
              (i) =>
                  i.steamLaunchSetting == null ||
                  l.appId != i.steamLaunchSetting!.steamAppID,
            ),
          )
          .toList();
      final uninstalledSteamApps = localTrackedSteamAppInsts
          .where(
              (e) => localSteamApps[e.steamLaunchSetting!.steamAppID] == null)
          .toList();
      final String? localSteamStateMsg = steamScanResultString(
        context,
        state.localSteamScanResult,
      );
      return Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: SpacingHelper.listSpacing(
                  width: 16,
                  children: [
                    const Icon(FontAwesomeIcons.steam),
                    const Text('Steam 集成'),
                    if (localSteamStateMsg != null)
                      Chip(label: Text(localSteamStateMsg)),
                    Expanded(child: Container()),
                    if (state.localSteamScanResult !=
                        SteamScanResult.unavailable)
                      OutlinedButton.icon(
                        onPressed: () {
                          context
                              .read<GeburaBloc>()
                              .add(GeburaScanLocalLibraryEvent());
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('刷新'),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  '发现${untrackedSteamApps.length}个Steam游戏（已导入${localTrackedSteamAppInsts.length}个${uninstalledSteamApps.isNotEmpty ? '，已卸载${uninstalledSteamApps.length}个' : ''}）'),
              if (untrackedSteamApps.isNotEmpty)
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
                  child: _SteamGameList(apps: untrackedSteamApps),
                ),
            ],
          ),
        ),
      );
    });
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
                            GeburaTrackSteamAppsEvent(
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
      rows: widget.apps.map(
        (e) {
          final file = io.File(e.iconFilePath!);
          final content = file.readAsBytesSync();
          return DataRow(
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
                            child: ExtendedImage.memory(
                              content,
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
                        await context
                            .read<GeburaBloc>()
                            .showSteamAppDetails(e.appId);
                      },
                      icon: Icon(const FaIcon(FontAwesomeIcons.steam).icon,
                          size: 16),
                      label: const Text('查看'),
                    )),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}

String? steamScanResultString(BuildContext context, SteamScanResult? result) {
  if (result == null) {
    return null;
  }
  switch (result) {
    case SteamScanResult.unavailable:
      return S.of(context).steamScanResultPlatformUnsupported;
    case SteamScanResult.steamInstallationNotFound:
      return S.of(context).steamScanResultSteamNotFound;
    case SteamScanResult.libraryFoldersNotFound:
      return S.of(context).steamScanResultLibraryNotFound;
    case SteamScanResult.libraryEmpty:
      return S.of(context).steamScanResultLibraryEmpty;
    case SteamScanResult.unknownError:
      return S.of(context).steamScanResultUnknownError;
    case SteamScanResult.fullyScanned:
      return null;
  }
}
