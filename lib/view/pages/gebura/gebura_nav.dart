import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../route.dart';
import '../../components/rail_tile.dart';
import '../../helper/spacing.dart';
import '../../layout/overlapping_panels.dart';

class GeburaNav extends StatelessWidget {
  const GeburaNav({super.key, required this.function});

  final String function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      if (state.purchasedApps == null) {
        context.read<GeburaBloc>().add(GeburaInitEvent());
      }

      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              RailTile(
                leading: const Icon(
                  Icons.shopping_cart,
                ),
                onTap: () {
                  context
                      .read<GeburaBloc>()
                      .add(GeburaSetPurchasedAppIndexEvent(null));
                  AppRoutes.geburaStore.go(context);
                  OverlappingPanels.of(context)?.reveal(RevealSide.main);
                },
                title: const Text('Store'),
                selected: function == 'store',
              ),
              SpacingHelper.defaultDivider,
              Expanded(
                child: DynMouseScroll(
                  builder: (context, controller, physics) {
                    return SingleChildScrollView(
                      controller: controller,
                      physics: physics,
                      child: Column(
                        children: [
                          if (state.purchasedApps != null &&
                              state.purchasedApps!.isNotEmpty)
                            for (var i = 0, app = state.purchasedApps![i];
                                i < state.purchasedApps!.length;
                                i++,
                                app = state.purchasedApps!.elementAtOrNull(i) ??
                                    App())
                              RailTile(
                                selected: i == state.selectedPurchasedAppIndex,
                                onTap: () {
                                  context
                                      .read<GeburaBloc>()
                                      .add(GeburaSetPurchasedAppIndexEvent(i));
                                  AppRoutes.geburaLibraryDetail(
                                          app.id.id.toInt())
                                      .go(context);
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
                                            image: CachedNetworkImageProvider(
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
                          else if (state is GeburaPurchasedAppsLoadState)
                            if (state.processing)
                              const Center(
                                child: CircularProgressIndicator(),
                              )
                            else if (state.failed)
                              Center(
                                child: Text('加载失败: ${state.msg}'),
                              ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
