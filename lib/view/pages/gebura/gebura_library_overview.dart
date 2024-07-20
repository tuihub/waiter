import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_hero/local_hero.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../helper/url.dart';

class GeburaLibraryOverview extends StatelessWidget {
  const GeburaLibraryOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        final apps = state.libraryItems ?? [];
        final localLibraryState = state.localLibraryState ?? '';
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: apps.isNotEmpty
                    ? GridView.builder(
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
                      )
                    : Center(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(S.of(context).noAppInLibrary),
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () {
                              const GeburaLibrarySettingsRoute().go(context);
                            },
                            child: Text(S.of(context).addApplication),
                          ),
                        ],
                      )),
              ),
              const Row(
                children: [
                  Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              const GeburaLibrarySettingsRoute().go(context);
            },
            child: const Icon(Icons.settings),
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
                  TextButton(
                    onPressed: () {
                      context
                          .read<GeburaBloc>()
                          .add(GeburaClearLocalLibraryStateEvent());
                    },
                    child: Text(S.of(context).hide),
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

class _GeburaLibraryOverviewItem extends StatefulWidget {
  const _GeburaLibraryOverviewItem({required this.index, required this.item});

  final int index;
  final AppInfoMixed item;

  @override
  State<_GeburaLibraryOverviewItem> createState() =>
      _GeburaLibraryOverviewItemState();
}

class _GeburaLibraryOverviewItemState
    extends State<_GeburaLibraryOverviewItem> {
  bool noCoverImage = false;

  @override
  Widget build(BuildContext context) {
    if (!UrlHelper.isValidUrl(widget.item.coverImageUrl)) {
      noCoverImage = true;
    }
    final name = widget.item.name.isNotEmpty
        ? widget.item.name
        : S.of(context).unknownApp;
    return _HoverScaleEffect(
      child: GestureDetector(
        onTap: () {
          context
              .read<GeburaBloc>()
              .add(GeburaSetSelectedLibraryItemEvent(widget.item.id));
          GeburaLibraryDetailRoute(id: widget.item.id.id.toInt()).go(context);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: noCoverImage ? Colors.grey : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Center(child: Text(noCoverImage ? name : '')),
            ),
            Center(
              child: LocalHero(
                tag: widget.item.id.id.toString(),
                child: noCoverImage
                    ? Container()
                    : ExtendedImage.network(
                        widget.item.coverImageUrl,
                        loadStateChanged: (ExtendedImageState state) {
                          if (state.extendedImageLoadState ==
                              LoadState.failed) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) => setState(() {
                                      noCoverImage = true;
                                    }));
                            return const SizedBox();
                          }
                          return null;
                        },
                      ),
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
