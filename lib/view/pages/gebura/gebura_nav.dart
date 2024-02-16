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
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        if (state.purchasedAppInfos == null) {
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
                  .add(GeburaSetPurchasedAppInfoIndexEvent(null));
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
                  .add(GeburaSetPurchasedAppInfoIndexEvent(null));
              AppRoutes.geburaLibrary.push(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.main);
            },
            title: Text(S.of(context).library),
            selected: function == GeburaFunctions.library &&
                state.selectedPurchasedAppInfoIndex == null,
          ),
          SpacingHelper.defaultDivider,
          Expanded(
            child: DynMouseScroll(
              builder: (context, controller, physics) {
                return SingleChildScrollView(
                  controller: controller,
                  physics: physics,
                  child: (state.purchasedAppInfos != null &&
                          state.purchasedAppInfos!.isNotEmpty)
                      ? Column(
                          children: [
                            for (var i = 0, app = state.purchasedAppInfos![i];
                                i < state.purchasedAppInfos!.length;
                                i++,
                                app = state.purchasedAppInfos!
                                        .elementAtOrNull(i) ??
                                    AppInfoMixed())
                              ListTile(
                                selected:
                                    i == state.selectedPurchasedAppInfoIndex,
                                onTap: () {
                                  context.read<GeburaBloc>().add(
                                      GeburaSetPurchasedAppInfoIndexEvent(i));
                                  AppRoutes.geburaLibraryDetail(i)
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
                      : (state is GeburaPurchasedAppsLoadState)
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
