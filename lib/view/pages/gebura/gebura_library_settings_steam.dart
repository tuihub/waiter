part of 'gebura_library_settings.dart';

class GeburaSteamAppScanResultPanel extends StatelessWidget {
  const GeburaSteamAppScanResultPanel({super.key, required this.folder});

  final String folder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final (
        tracked,
        untracked,
      ) = state.analyzeSteamAppInsts(folder);
      return Scaffold(
        appBar: AppBar(
          title: Text(folder),
          shape: AppBarHelper.defaultShape,
          leading: AppBarHelper.defaultRightLeading(context),
          actions: [
            OutlinedButton.icon(
              onPressed: () {
                context.read<GeburaBloc>().add(GeburaScanLocalLibraryEvent(
                      refreshCommon: [],
                    ));
              },
              icon: const Icon(Icons.refresh),
              label: const Text('刷新'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: _SteamGameList(
              untracked: untracked,
              tracked: tracked,
            ),
          ),
        ),
      );
    });
  }
}

class _SteamGameList extends StatefulWidget {
  const _SteamGameList({
    required this.untracked,
    required this.tracked,
  });

  final List<InstalledSteamApps> untracked;
  final List<InstalledSteamApps> tracked;

  @override
  State<_SteamGameList> createState() => _SteamGameListState();
}

class _SteamGameListState extends State<_SteamGameList> {
  @override
  void initState() {
    super.initState();
    selectedIndex = List.generate(widget.untracked.length, (index) => false);
  }

  late List<bool> selectedIndex;

  DataRow _buildRow(InstalledSteamApps app, bool tracked) {
    final file = io.File(app.iconFilePath!);
    return DataRow(
      selected: tracked || selectedIndex[widget.untracked.indexOf(app)],
      onSelectChanged: tracked
          ? null
          : (isSelected) {
              setState(() {
                selectedIndex[widget.untracked.indexOf(app)] =
                    isSelected ?? false;
              });
            },
      cells: [
        DataCell(Row(
          children: [
            if (app.iconFilePath != null)
              Container(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: ExtendedImage.file(
                        file,
                        width: 16,
                        height: 16,
                      )))
            else
              const Icon(Icons.image),
            Text(
              app.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: tracked ? Theme.of(context).disabledColor : null,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        )),
        DataCell(
          Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await context
                      .read<GeburaBloc>()
                      .showSteamAppDetails(app.appId);
                },
                icon: const Icon(FontAwesomeIcons.steam, size: 16),
                label: const Text('查看'),
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      onSelectAll: (isSelectedAll) {
        if (isSelectedAll ?? false) {
          setState(() {
            selectedIndex =
                List.generate(widget.untracked.length, (index) => true);
          });
        } else {
          setState(() {
            selectedIndex =
                List.generate(widget.untracked.length, (index) => false);
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
                              widget.untracked
                                  .where((element) => selectedIndex[
                                      widget.untracked.indexOf(element)])
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
      rows: [
        ...widget.untracked.map((e) => _buildRow(e, false)),
        ...widget.tracked.map((e) => _buildRow(e, true)),
      ],
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
