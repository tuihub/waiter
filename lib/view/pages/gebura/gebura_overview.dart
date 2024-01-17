import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../route.dart';

class GeburaOverview extends StatelessWidget {
  const GeburaOverview({super.key});

  @override
  Widget build(BuildContext context) {
    bool firstBuild = true;
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        if (firstBuild) {
          firstBuild = false;
        }
        final apps = state.purchasedApps ?? [];
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: apps.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = apps.elementAt(index);
                      return GeburaOverviewItem(
                        index: index,
                        item: item,
                      );
                    },
                  ),
                ),
              ),
              const Row(
                children: [
                  Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}

class GeburaOverviewItem extends StatefulWidget {
  const GeburaOverviewItem(
      {super.key, required this.index, required this.item});

  final int index;
  final AppMixed item;

  @override
  State<GeburaOverviewItem> createState() => _GeburaOverviewItemState();
}

class _GeburaOverviewItemState extends State<GeburaOverviewItem> {
  bool showBorder = false;

  @override
  Widget build(BuildContext context) {
    return HoverScaleEffect(
      child: GestureDetector(
        onTap: () {
          context
              .read<GeburaBloc>()
              .add(GeburaSetPurchasedAppIndexEvent(widget.index));
          AppRoutes.geburaLibraryDetail(widget.index).push(context);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: showBorder ? Colors.grey : Colors.transparent,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Center(child: Text(widget.item.name)),
              Center(
                child: Hero(
                  tag: widget.item.id.id.toString(),
                  child: ExtendedImage.network(
                    widget.item.coverImageUrl,
                    loadStateChanged: (ExtendedImageState state) {
                      if (state.extendedImageLoadState == LoadState.failed) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((_) => setState(() {
                                  showBorder = true;
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
      ),
    );
  }
}

class HoverScaleEffect extends StatefulWidget {
  const HoverScaleEffect({super.key, required this.child});

  final Widget child;

  @override
  State<HoverScaleEffect> createState() => _HoverScaleEffectState();
}

class _HoverScaleEffectState extends State<HoverScaleEffect> {
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
