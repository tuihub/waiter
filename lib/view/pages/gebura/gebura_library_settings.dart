import 'dart:convert';

import 'package:animated_tree_view/listenable_node/indexed_listenable_node.dart';
import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
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
import '../../components/pop_alert.dart';
import '../../form/form_field.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_container.dart';

part 'gebura_library_settings_common.dart';
part 'gebura_library_settings_steam.dart';

class GeburaLibrarySettings extends StatelessWidget {
  const GeburaLibrarySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        final localLibraryState = state.localLibraryStateMessage ?? '';
        return Scaffold(
          body: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OverviewCard(),
                SizedBox(height: 16),
                _CommonSettingCard(),
                SizedBox(height: 16),
                _SteamSettingCard(),
                SizedBox(height: 100),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     const GeburaLibraryRoute().go(context);
          //   },
          //   child: const Icon(Icons.apps),
          // ),
          // floatingActionButtonLocation: localLibraryState.isNotEmpty
          //     ? FloatingActionButtonLocation.endContained
          //     : FloatingActionButtonLocation.endFloat,
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
                  TextButton(
                    onPressed: () {
                      context
                          .read<GeburaBloc>()
                          .add(GeburaClearLocalLibraryStateEvent());
                    },
                    child: Text(S.of(context).hide),
                  ),
                  // const SizedBox(width: 64),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final commonLibraryFolders = state.localCommonLibraryFolders ?? {};
      final steamLibraryFolders = state.localSteamLibraryFolders ?? [];
      return Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: SpacingHelper.listSpacing(width: 16, children: [
                  const Icon(Icons.fact_check),
                  const Text('概览'),
                  const Expanded(child: SizedBox()),
                ]),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final folder in steamLibraryFolders)
                      InkWell(
                        onTap: () async {
                          await OpenFile.open(folder);
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(16),
                          child: Ink(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    const Center(
                                      child: Icon(
                                        FontAwesomeIcons.folder,
                                        size: 48,
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: const Icon(
                                            FontAwesomeIcons.steam,
                                            size: 24),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(folder),
                              ],
                            ),
                          ),
                        ),
                      ),
                    for (final folder in commonLibraryFolders.values)
                      InkWell(
                        onTap: () async {
                          await OpenFile.open(folder.basePath);
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(16),
                          child: Ink(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Stack(
                                  children: [
                                    Center(
                                      child: Icon(
                                        FontAwesomeIcons.folder,
                                        size: 48,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(folder.basePath),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
