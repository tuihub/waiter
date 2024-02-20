import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../helper/spacing.dart';
import '../../layout/overlapping_panels.dart';

class GeburaNav extends StatelessWidget {
  const GeburaNav({super.key, required this.function});

  final String function;

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    final searchController = TextEditingController();
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        if (state.libraryItems == null) {
          context.read<GeburaBloc>().add(GeburaInitEvent());
        }
      }

      return Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.shopping_cart,
            ),
            onTap: () {
              context
                  .read<GeburaBloc>()
                  .add(GeburaSetSelectedLibraryItemEvent(null));
              AppRoutes.geburaStore.go(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.main);
            },
            title: Text(S.of(context).store),
            selected: function == GeburaFunctions.store,
          ),
          ListTile(
            leading: const Icon(
              Icons.apps,
            ),
            onTap: () {
              context
                  .read<GeburaBloc>()
                  .add(GeburaSetSelectedLibraryItemEvent(null));
              AppRoutes.geburaLibrary.push(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.main);
            },
            title: Text(S.of(context).library),
            selected: function == GeburaFunctions.library &&
                state.selectedLibraryItem == null,
          ),
          SpacingHelper.defaultDivider,
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.filter_alt_outlined),
                suffixIcon: state.librarySettings?.query?.isNotEmpty ?? false
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          context
                              .read<GeburaBloc>()
                              .add(GeburaApplyLibrarySettingsEvent(query: ''));
                          searchController.clear();
                        },
                      )
                    : null,
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: SpacingHelper.defaultBorderRadius,
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: SpacingHelper.defaultBorderRadius,
                ),
              ),
              onChanged: (query) {
                context
                    .read<GeburaBloc>()
                    .add(GeburaApplyLibrarySettingsEvent(query: query));
              },
            ),
          ),
          Expanded(
            child: DynMouseScroll(
              builder: (context, controller, physics) {
                return SingleChildScrollView(
                  controller: controller,
                  physics: physics,
                  child: (state.libraryItems != null &&
                          state.libraryItems!.isNotEmpty)
                      ? Column(
                          children: [
                            for (final AppInfoMixed app
                                in state.libraryItems ?? [])
                              ListTile(
                                selected: app.id.id.toInt() ==
                                    state.selectedLibraryItem,
                                onTap: () {
                                  context.read<GeburaBloc>().add(
                                      GeburaSetSelectedLibraryItemEvent(
                                          app.id));
                                  AppRoutes.geburaLibraryDetail(
                                          app.id.id.toInt())
                                      .push(context);
                                  OverlappingPanels.of(context)
                                      ?.reveal(RevealSide.main);
                                },
                                leading: Container(
                                  decoration: app.iconImageUrl.isEmpty
                                      ? const BoxDecoration()
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: ExtendedNetworkImageProvider(
                                              app.iconImageUrl,
                                            ),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                  height: 24,
                                  width: 24,
                                ),
                                title: Text(app.name.isEmpty
                                    ? app.id.id.toHexString()
                                    : app.name),
                              )
                          ],
                        )
                      : (state is GeburaRefreshLibraryState)
                          ? (state.processing)
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : (state.failed)
                                  ? Center(
                                      child: Text(S
                                          .of(context)
                                          .loadFailed(state.msg ?? '')),
                                    )
                                  : Container()
                          : Container(),
                );
              },
            ),
          )
        ],
      );
    });
  }
}
