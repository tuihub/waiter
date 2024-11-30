import 'dart:convert';

import 'package:animated_tree_view/listenable_node/indexed_listenable_node.dart';
import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/app_scan/app_scan.dart';
import '../../../common/app_scan/model.dart';
import '../../../common/steam/steam.dart';
import '../../../l10n/l10n.dart';
import '../../../model/gebura_model.dart';
import '../../../route.dart';
import '../../components/form_field.dart';
import '../../components/pop_alert.dart';
import '../../components/toast.dart';
import '../../helper/app_bar.dart';
import '../../layout/bootstrap_container.dart';
import '../../layout/card_list_page.dart';
import '../../universal/universal.dart';
import '../frame_page.dart';

part 'gebura_library_settings_common.dart';
part 'gebura_library_settings_steam.dart';

class GeburaLibrarySettingsPage extends StatelessWidget {
  const GeburaLibrarySettingsPage({super.key});

  Widget _buildCommonItem(
    BuildContext context,
    GeburaState state,
    LocalLibraryScanResult item,
  ) {
    return UniversalListTile(
      leading: Icon((() {
        switch (item.type) {
          case LocalLibraryScanResultType.common:
            return FontAwesomeIcons.folder;
          case LocalLibraryScanResultType.steam:
            return FontAwesomeIcons.steam;
        }
      })()),
      title: Text(item.path),
      subtitle: Text(
        '共 ${item.installedCount}，已导入 ${item.trackedCount}',
      ),
      trailing: Flexible(
        child: UniversalToolBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            UniversalToolBarItem(
              icon: UniversalUI.of(context).icons.openInFull,
              label: const Text('详情'),
              onPressed: () {
                GeburaLibrarySettingsRoute(
                        action: GeburaLibrarySettingsActions.appScanResult,
                        $extra: item.uuid)
                    .go(context);
                ModuleFramePage.of(context)?.openDrawer();
              },
            ),
          ],
          secondaryItems: [
            if (item.type == LocalLibraryScanResultType.common)
              UniversalToolBarItem(
                icon: UniversalUI.of(context).icons.edit,
                label: const Text('编辑扫描设置'),
                onPressed: () async {
                  final setting = await context
                      .read<GeburaBloc>()
                      .getLocalCommonAppLibraryFolder(item.uuid);
                  if (setting == null) {
                    const Toast(title: '', message: '未找到设置').show(context);
                  }
                  await Navigator.of(context).push(
                    UniversalPageRoute(builder: (context) {
                      return _CommonAppFolderScanSettingPage(
                        initialValue: setting,
                      );
                    }),
                  );
                },
              ),
            UniversalToolBarItem(
              icon: UniversalUI.of(context).icons.folderOpen,
              label: const Text('使用资源管理器打开'),
              onPressed: () async {
                await OpenFile.open(item.path);
              },
            ),
            UniversalToolBarItem(
              icon: UniversalUI.of(context).icons.delete,
              label: const Text('删除'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        return ListManagePage(
          title: S.of(context).localLibraryManage,
          processing: state is GeburaScanLocalLibraryState && state.processing,
          onRefresh: () {
            context.read<GeburaBloc>().add(GeburaScanLocalLibraryEvent());
          },
          onAdd: () async {
            final navigator = Navigator.of(context);
            await showDialog(
              context: context,
              builder: (context) {
                return _GeburaLibrarySettingAddDialog(navigator);
              },
            );
          },
          children: [
            for (final folder in state.localLibraryScanResults.values
                .sorted((a, b) => a.path.compareTo(b.path)))
              _buildCommonItem(context, state, folder),
          ],
        );
      },
    );
  }
}

class _GeburaLibrarySettingAddDialog extends StatefulWidget {
  const _GeburaLibrarySettingAddDialog(this.navigator);

  final NavigatorState navigator;

  @override
  State<_GeburaLibrarySettingAddDialog> createState() =>
      _GeburaLibrarySettingAddDialogState();
}

class _GeburaLibrarySettingAddDialogState
    extends State<_GeburaLibrarySettingAddDialog> {
  String? _result;

  @override
  Widget build(BuildContext context) {
    return UniversalDialog(
      title: const Text('添加本地库'),
      content: Wrap(
        children: [
          UniversalCard(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('添加文件夹', style: Theme.of(context).textTheme.bodyLarge),
                  Text('手动配置扫描', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              UniversalElevatedButton(
                child: const Text('打开设置页面'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await widget.navigator.push(
                    UniversalPageRoute(builder: (context) {
                      return const _CommonAppFolderScanSettingPage();
                    }),
                  );
                },
              ),
            ],
          )),
          UniversalCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Steam集成',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(_result ?? '自动扫描',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                UniversalElevatedButton(
                  child: const Text('扫描'),
                  onPressed: () async {
                    final (folders, result) = await context
                        .read<GeburaBloc>()
                        .getLocalSteamLibraryFolders();
                    if (result != SteamScanResult.fullyScanned) {
                      setState(() {
                        _result = _steamScanResultString(context, result);
                      });
                    } else {
                      setState(() {
                        _result = '扫描完成，共找到 ${folders.length} 个库';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        UniversalDialogAction(
          child: const Text('关闭'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class GeburaAppScanResultPanel extends StatelessWidget {
  const GeburaAppScanResultPanel({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaTrackCommonAppsState && state.msg != null) {
        Toast(title: '', message: state.msg!).show(context);
      }
      if (state is GeburaTrackSteamAppsState && state.msg != null) {
        Toast(title: '', message: state.msg!).show(context);
      }
      if (state is GeburaScanLocalLibraryState && state.msg != null) {
        Toast(title: '', message: state.msg!).show(context);
      }
    }, builder: (context, state) {
      final data = state.localLibraryScanResults[uuid] ??
          const LocalLibraryScanResult(
            uuid: '',
            type: LocalLibraryScanResultType.common,
            path: '未找到数据',
          );
      final tracked = data.details?.where((e) => e.tracked).toList() ?? [];
      final untracked = data.details?.where((e) => !e.tracked).toList() ?? [];
      return Scaffold(
        appBar: AppBar(
          title: Text(data.path),
          shape: UniversalUI.of(context).defaultShape,
          backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
          leading: AppBarHelper.defaultRightLeading(context),
          actions: [
            Container(
              width: 128,
              padding: const EdgeInsets.only(right: 8),
              child: UniversalToolBar(
                mainAxisAlignment: MainAxisAlignment.end,
                primaryItems: [
                  UniversalToolBarItem(
                    icon: UniversalUI.of(context).icons.refresh,
                    label: const Text('刷新'),
                    onPressed: () {
                      switch (data.type) {
                        case LocalLibraryScanResultType.common:
                          context
                              .read<GeburaBloc>()
                              .add(GeburaScanLocalLibraryEvent(
                                refreshCommon: [uuid],
                              ));
                        case LocalLibraryScanResultType.steam:
                          context
                              .read<GeburaBloc>()
                              .add(GeburaScanLocalLibraryEvent(
                                refreshSteam: [uuid],
                              ));
                      }
                    },
                  ),
                ],
              ),
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
            child: _GeburaAppScanResultList(
              type: data.type,
              untracked: untracked,
              tracked: tracked,
            ),
          ),
        ),
      );
    });
  }
}

class _GeburaAppScanResultList extends StatefulWidget {
  const _GeburaAppScanResultList({
    required this.type,
    required this.untracked,
    required this.tracked,
  });

  final LocalLibraryScanResultType type;
  final List<LocalLibraryScanResultDetail> untracked;
  final List<LocalLibraryScanResultDetail> tracked;

  @override
  State<_GeburaAppScanResultList> createState() =>
      _GeburaAppScanResultListState();
}

class _GeburaAppScanResultListState extends State<_GeburaAppScanResultList> {
  @override
  void initState() {
    super.initState();
    selectedIndex = List.generate(widget.untracked.length, (index) => false);
  }

  late List<bool> selectedIndex;

  DataRow _buildRow(LocalLibraryScanResultDetail app, bool tracked) {
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
        DataCell(
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  app.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: tracked ? Theme.of(context).disabledColor : null,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  app.path,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: tracked ? Theme.of(context).disabledColor : null,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Align(
              alignment: Alignment.centerRight,
              child: UniversalOutlinedButton.icon(
                onPressed: () async {
                  await OpenFile.open(app.path);
                },
                icon: Icon(UniversalUI.of(context).icons.folder, size: 16),
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
            '游戏列表${selectedIndex.contains(true) ? '（已选${selectedIndex.where((element) => element).length}个）' : ''}',
            overflow: TextOverflow.ellipsis,
          ),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Align(
            alignment: Alignment.centerRight,
            child: UniversalElevatedButton(
              onPressed: selectedIndex.contains(true)
                  ? () {
                      switch (widget.type) {
                        case LocalLibraryScanResultType.common:
                          context.read<GeburaBloc>().add(
                                GeburaTrackCommonAppsEvent(
                                  widget.untracked
                                      .where((element) => selectedIndex[
                                          widget.untracked.indexOf(element)])
                                      .map((e) => e.uuid)
                                      .toList(),
                                ),
                              );
                        case LocalLibraryScanResultType.steam:
                          context.read<GeburaBloc>().add(
                                GeburaTrackSteamAppsEvent(
                                  widget.untracked
                                      .where((element) => selectedIndex[
                                          widget.untracked.indexOf(element)])
                                      .map((e) => e.uuid)
                                      .toList(),
                                ),
                              );
                      }
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
