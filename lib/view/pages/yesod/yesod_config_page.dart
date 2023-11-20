import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../common/api/l10n.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/overlapping_panels.dart';
import '../frame_page.dart';

class YesodConfigPage extends StatelessWidget {
  const YesodConfigPage({super.key});

  Widget _buildStatePage(BuildContext context, YesodState state) {
    final listData = state.feedConfigs ?? [];
    final bgColor = Theme.of(context).colorScheme.surface;
    if (state.feedConfigs == null) {
      context.read<YesodBloc>().add(YesodInitEvent());
    }
    return Stack(children: [
      if (state is YesodConfigLoadState && state.processing)
        const Center(
          child: CircularProgressIndicator(),
        ),
      if (state is YesodConfigLoadState && state.failed)
        Center(
          child: Text('加载失败: ${state.msg}'),
        )
      else
        ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            final item = listData.elementAt(index);

            void openEditPage() {
              context
                  .read<YesodBloc>()
                  .add(YesodSetConfigEditIndexEvent(index));
              AppRoutes.yesodConfigEdit().go(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.right);
              FramePage.of(context)?.openDrawer();
            }

            return SelectionArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Ink(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: openEditPage,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: item.feed.image.url.isNotEmpty
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        SpacingHelper.defaultBorderRadius,
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          item.feed.image.url,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  width: 48,
                                  height: 48,
                                )
                              : const SizedBox(),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.config.feedUrl,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10,
                                  color: Theme.of(context).disabledColor),
                              maxLines: 2,
                            ),
                            Text(item.config.name),
                            Text(
                                '${S.current.FEED_CONFIG_STATUS}: ${feedConfigStatusString(item.config.status)}'),
                            Text(
                                '上次更新：${DurationHelper.recentString(item.config.latestUpdateTime.toDateTime())}')
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: IconButton(
                            onPressed: openEditPage,
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                  FilledButton.tonalIcon(
                    onPressed: () async {
                      AppRoutes.yesodConfigAdd().go(context);
                      OverlappingPanels.of(context)?.reveal(RevealSide.right);
                      FramePage.of(context)?.openDrawer();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('添加订阅'),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: _buildStatePage(context, state),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<YesodBloc>().add(YesodConfigLoadEvent());
          },
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
