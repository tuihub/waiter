import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../model/gebura_model.dart';
import '../../../route.dart';
import '../../helper/app_bar.dart';
import 'gebura_common.dart';

class GeburaLibraryOverview extends StatelessWidget {
  const GeburaLibraryOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return BlocBuilder<GeburaBloc, GeburaState>(
        builder: (context, state) {
          final apps = state.libraryListItems.where((e) => !e.filtered);
          return Scaffold(
            appBar: AppBar(
              shape: UniversalUI.of(context).defaultShape,
              backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
              leading: AppBarHelper.defaultMainLeading(context),
              title: Text(S.of(context).library),
              actions: [
                Container(
                  width: width / 2,
                  padding: const EdgeInsets.only(right: 8),
                  child: UniversalToolBar(
                    mainAxisAlignment: MainAxisAlignment.end,
                    primaryItems: [
                      UniversalToolBarItem(
                        icon: UniversalIcon(context).refresh,
                        label: Text(S.of(context).refresh),
                        onPressed: () {
                          context
                              .read<GeburaBloc>()
                              .add(GeburaRefreshLibraryListEvent(null));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: DynMouseScroll(
              builder: (context, controller, physics) {
                if (apps.isNotEmpty) {
                  return GridView.builder(
                    controller: controller,
                    physics: physics,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: apps.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = apps.elementAt(index);
                      return _GeburaLibraryOverviewItem(
                        index: index,
                        item: item,
                      );
                    },
                  );
                } else {
                  return Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(S.of(context).noAppInLibrary),
                      const SizedBox(height: 12),
                      UniversalOutlinedButton(
                        onPressed: () {
                          const GeburaLibrarySettingsRoute().go(context);
                        },
                        child: Text(S.of(context).addApplication),
                      ),
                    ],
                  ));
                }
              },
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     const GeburaLibrarySettingsRoute().go(context);
            //   },
            //   child: const Icon(Icons.settings),
            // ),
            // floatingActionButtonLocation: localLibraryState.isNotEmpty
            //     ? FloatingActionButtonLocation.endContained
            //     : FloatingActionButtonLocation.endFloat,
            // bottomNavigationBar: ClipRRect(
            //   borderRadius: const BorderRadius.only(
            //     topRight: Radius.circular(16),
            //     topLeft: Radius.circular(16),
            //   ),
            //   child: BottomAppBar(
            //     height: localLibraryState.isNotEmpty ? 88 : 0,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           localLibraryState,
            //           style: const TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         TextButton(
            //           onPressed: () {
            //             context
            //                 .read<GeburaBloc>()
            //                 .add(GeburaClearLocalLibraryStateEvent());
            //           },
            //           child: Text(S.of(context).hide),
            //         ),
            //         // const SizedBox(width: 64),
            //       ],
            //     ),
            //   ),
            // ),
          );
        },
      );
    });
  }
}

class _GeburaLibraryOverviewItem extends StatefulWidget {
  const _GeburaLibraryOverviewItem({required this.index, required this.item});

  final int index;
  final LibraryListItem item;

  @override
  State<_GeburaLibraryOverviewItem> createState() =>
      _GeburaLibraryOverviewItemState();
}

class _GeburaLibraryOverviewItemState
    extends State<_GeburaLibraryOverviewItem> {
  bool noCoverImage = false;

  @override
  Widget build(BuildContext context) {
    if (widget.item.coverImagePath == null) {
      noCoverImage = true;
    }
    final name = widget.item.name.isNotEmpty
        ? widget.item.name
        : S.of(context).unknownApp;
    return _HoverScaleEffect(
      child: GestureDetector(
        onTap: () {
          GeburaLibraryDetailRoute(widget.item.uuid).go(context);
        },
        child: Stack(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: noCoverImage ? Colors.grey : Colors.transparent,
              //     width: 1,
              //   ),
              // ),
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(noCoverImage ? name : ''),
              ),
            ),
            Center(
              child: Hero(
                tag: widget.item.uuid,
                child: GeburaAppCoverImage(path: widget.item.coverImagePath),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverScaleEffect extends StatefulWidget {
  const _HoverScaleEffect({required this.child});

  final Widget child;

  @override
  State<_HoverScaleEffect> createState() => _HoverScaleEffectState();
}

class _HoverScaleEffectState extends State<_HoverScaleEffect> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity())
            : (Matrix4.identity()..scale(0.975)),
        child: widget.child,
      ),
    );
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
