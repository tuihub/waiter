import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../model/gebura_model.dart';
import '../../../route.dart';
import '../../helper/spacing.dart';
import '../../layout/overlapping_panels.dart';
import '../../universal/list.dart';
import 'gebura_common.dart';

class GeburaNav extends StatelessWidget {
  const GeburaNav({
    super.key,
    required this.function,
    this.selectedItem,
  });

  final GeburaFunctions function;
  final String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return BlocBuilder<GeburaBloc, GeburaState>(
      buildWhen: (previous, current) {
        return previous.libraryListItems != current.libraryListItems;
      },
      builder: (context, state) {
        return Column(
          children: [
            UniversalListTile(
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                const GeburaStoreRoute().go(context);
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: Text(S.of(context).store),
              selected: function == GeburaFunctions.store,
            ),
            UniversalListTile(
              leading: const Icon(Icons.apps),
              onTap: () {
                const GeburaLibraryRoute().go(context);
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: Text(S.of(context).library),
              selected:
                  function == GeburaFunctions.library && selectedItem == null,
            ),
            SpacingHelper.defaultDivider,
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.filter_alt_outlined),
                  suffixIcon:
                      state.librarySettings?.filter?.query?.isNotEmpty ?? false
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                context.read<GeburaBloc>().add(
                                    GeburaApplyLibraryFilterEvent(query: ''));
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
                      .add(GeburaApplyLibraryFilterEvent(query: query));
                },
              ),
            ),
            Expanded(
              child: DynMouseScroll(
                builder: (context, controller, physics) {
                  return ListView(
                      controller: controller,
                      physics: physics,
                      children: [
                        if (state.libraryListItems != null &&
                            state.libraryListItems!.isNotEmpty)
                          for (final LibraryListItem item
                              in state.libraryListItems ?? [])
                            Material(
                                child: UniversalListTile(
                              // https://github.com/flutter/flutter/issues/86584
                              selected: item.uuid == selectedItem,
                              onTap: () {
                                GeburaLibraryDetailRoute(item.uuid).go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              leading: GeburaAppIconImage(item: item),
                              title: AutoSizeText(
                                item.name.isEmpty ? item.uuid : item.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                            ))
                        else
                          (state is GeburaRefreshLibraryState)
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
                      ]);
                },
              ),
            ),
            UniversalListTile(
              leading: const Icon(Icons.library_add_check),
              onTap: () {
                const GeburaLibrarySettingsRoute().go(context);
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: Text(S.of(context).localLibraryManage),
              selected: function == GeburaFunctions.librarySettings &&
                  selectedItem == null,
            ),
          ],
        );
      },
    );
  }
}
