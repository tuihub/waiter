import 'dart:convert';

import 'package:animated_tree_view/listenable_node/indexed_listenable_node.dart';
import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:universal_io/io.dart' as io;
import 'package:universal_io/io.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/app_scan/app_scan.dart';
import '../../../common/app_scan/model.dart';
import '../../../common/steam/steam.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../components/form_field.dart';
import '../../components/pop_alert.dart';
import '../../helper/app_bar.dart';
import '../../layout/bootstrap_container.dart';
import '../../layout/card_list_page.dart';
import '../../universal/button.dart';
import '../../universal/list_tile.dart';
import '../../universal/spacing.dart';
import '../../universal/tool_bar.dart';
import '../../universal/universal.dart';
import '../frame_page.dart';

part 'gebura_library_settings_common.dart';
part 'gebura_library_settings_steam.dart';

class GeburaLibrarySettings extends StatelessWidget {
  const GeburaLibrarySettings({super.key});

  Widget _buildCommonItem(
    BuildContext context,
    GeburaState state,
    CommonAppFolderScanSetting setting,
  ) {
    final folder = setting.basePath;
    final (
      tracked,
      untracked,
    ) = state.analyzeCommonAppInsts(folder);

    return UniversalListTile(
      leading: const Icon(FontAwesomeIcons.folder),
      title: Text(folder),
      subtitle: Text(
        '共 ${untracked.length + tracked.length}，已导入 ${tracked.length}',
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
                        action:
                            GeburaLibrarySettingsActions.commonAppScanResult,
                        $extra: folder)
                    .go(context);
                ModuleFramePage.of(context)?.openDrawer();
              },
            ),
          ],
          secondaryItems: [
            UniversalToolBarItem(
              icon: UniversalUI.of(context).icons.edit,
              label: const Text('编辑扫描设置'),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
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
                await OpenFile.open(folder);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSteamItem(
    BuildContext context,
    GeburaState state,
    String folder,
  ) {
    final (
      tracked,
      untracked,
    ) = state.analyzeSteamAppInsts(folder);

    return UniversalListTile(
      leading: const Icon(FontAwesomeIcons.steam),
      title: Text(folder),
      subtitle: Text(
        '共 ${untracked.length + tracked.length}，已导入 ${tracked.length}',
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
                        action: GeburaLibrarySettingsActions.steamAppScanResult,
                        $extra: folder)
                    .go(context);
                ModuleFramePage.of(context)?.openDrawer();
              },
            ),
          ],
          secondaryItems: [
            UniversalToolBarItem(
              icon: UniversalUI.of(context).icons.folderOpen,
              label: const Text('使用资源管理器打开'),
              onPressed: () async {
                await OpenFile.open(folder);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        final commonLibraryFolders = state.localCommonLibraryFolders ?? {};
        final steamLibraryFolders =
            state.localInstalledSteamAppInsts?.keys ?? [];
        return ListManagePage(
          title: S.of(context).localLibraryManage,
          processing: state is GeburaScanLocalLibraryState && state.processing,
          onRefresh: () {
            context.read<GeburaBloc>().add(GeburaScanLocalLibraryEvent());
          },
          onAdd: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const _CommonAppFolderScanSettingPage();
              }),
            );
          },
          children: [
            for (final folder in steamLibraryFolders)
              _buildSteamItem(context, state, folder),
            for (final folder in commonLibraryFolders.values)
              _buildCommonItem(context, state, folder)
          ],
        );
      },
    );
  }
}
