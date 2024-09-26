import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keframe/keframe.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../common/bloc_event_status_mixin.dart';
import '../../../l10n/l10n.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../form/form_field.dart';
import '../../helper/app_bar.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_breakpoints.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';
import 'yesod_detail_page.dart';
import 'yesod_preview_card.dart';

class YesodRecentPage extends StatefulWidget {
  const YesodRecentPage({super.key});

  @override
  State<YesodRecentPage> createState() => YesodRecentPageState();
}

class YesodRecentPageState extends State<YesodRecentPage> {
  int lastPageNum = 0;
  EventStatus lastStatus = EventStatus.processing;
  int? maxPageNum;
  ScrollController? controller;
  bool isScrolledToTop = true;

  String _title(BuildContext context, YesodState state) {
    final length = state.listConfig?.feedIdFilter?.length ?? 0;
    if (length == 0) {
      return S.of(context).allArticles;
    } else if (length == 1) {
      if (state.feedConfigs?.any((element) =>
              element.config.id.id.toString() ==
              state.listConfig?.feedIdFilter?.first) ??
          false) {
        return state.feedConfigs
                ?.firstWhere((element) =>
                    element.config.id.id.toString() ==
                    state.listConfig?.feedIdFilter?.first)
                .config
                .name ??
            S.of(context).filteredArticles;
      }
      return S.of(context).filteredArticles;
    } else if (length > 1) {
      return S.of(context).filteredArticles;
    } else {
      return S.of(context).allArticles;
    }
  }

  void _scrollToTop() {
    unawaited(controller?.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut));
  }

  Widget _listItem(
    BuildContext context,
    YesodState state,
    FeedItemDigest item,
  ) {
    final theme = Theme.of(context);

    return BootstrapContainer(
      fill: BootstrapSteps.xs,
      children: [
        BootstrapColumn(
          fill: BootstrapSteps.xs,
          xxs: 12,
          md: 9,
          lg: 7,
          builder: (context, filled) {
            return OpenContainer(
              tappable:
                  false, // https://github.com/flutter/flutter/issues/74111
              openBuilder: (_, __) {
                return BlocProvider.value(
                  value: context.read<YesodBloc>(),
                  child: YesodDetailPage(
                    itemId: item.itemId,
                  ),
                );
              },
              openColor: theme.colorScheme.primary,
              closedShape: RoundedRectangleBorder(
                borderRadius: filled
                    ? BorderRadius.zero
                    : SpacingHelper.defaultBorderRadius,
              ),
              closedElevation: 0,
              closedColor: theme.cardColor,
              closedBuilder: (context, openContainer) {
                return YesodPreviewCard(
                  name:
                      '${item.feedConfigName} | ${DurationHelper.recentString(item.publishedParsedTime.toDateTime())}',
                  title: item.title,
                  callback: () {
                    openContainer();
                    context
                        .read<YesodBloc>()
                        .add(YesodFeedItemReadEvent(item.itemId));
                  },
                  iconUrl: item.feedAvatarUrl,
                  images: item.imageUrls,
                  description: item.shortDescription,
                  listType: state.listConfig?.listType ?? FeedItemListType.card,
                  cardBorderRadius: filled ? BorderRadius.zero : null,
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      if (state is YesodFeedItemDigestLoadState) {
        lastStatus = state.statusCode;
        if (state.currentPage != null) {
          lastPageNum = state.currentPage!;
        }
        maxPageNum = state.maxPage;
      }
      final items = state.feedItemDigests ?? [];

      return Scaffold(
        appBar: AppBar(
          title: Text(_title(context, state)),
          shape: AppBarHelper.defaultShape,
          leading: AppBarHelper.defaultMainLeading(context),
          actions: [
            IconButton(
              onPressed: () {
                const YesodFunctionRoute(YesodFunctions.recent,
                        action: YesodActions.recentSettings)
                    .go(context);
                FramePage.of(context)?.openDrawer();
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: DynMouseScroll(
          builder: (context, controller, physics) {
            this.controller = controller;
            controller.addListener(() {
              if (controller.position.pixels ==
                  controller.position.maxScrollExtent) {
                if (lastStatus == EventStatus.success &&
                    (maxPageNum == null || lastPageNum < maxPageNum!)) {
                  context
                      .read<YesodBloc>()
                      .add(YesodFeedItemDigestsLoadEvent(lastPageNum + 1));
                }
              }
            });
            controller.addListener(() {
              if (isScrolledToTop != (controller.position.pixels == 0)) {
                setState(() {
                  isScrolledToTop = controller.position.pixels == 0;
                });
              }
            });

            return SizeCacheWidget(
              child: ListView.builder(
                controller: controller,
                physics: physics,
                itemCount: items.length + 1,
                cacheExtent: MediaQuery.sizeOf(context).height * 3,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    if ((state.listConfig?.hideRead ?? false) &&
                        items[index].readCount > 0) {
                      return const SizedBox();
                    }
                    final item = items[index];

                    return FrameSeparateWidget(
                      index: index,
                      child: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: _listItem(context, state, item),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: maxPageNum != null && maxPageNum == lastPageNum
                            ? const Text('没有了')
                            : const Text('加载中'),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          key: Key(isScrolledToTop.toString()),
          onPressed: isScrolledToTop
              ? () {
                  context
                      .read<YesodBloc>()
                      .add(YesodFeedItemDigestsLoadEvent(1, refresh: true));
                  context.read<YesodBloc>().add(YesodFeedConfigLoadEvent());
                }
              : _scrollToTop,
          child: Icon(isScrolledToTop ? Icons.refresh : Icons.arrow_upward),
        ),
      );
    });
  }
}

class YesodRecentSettingPanel extends StatefulWidget {
  const YesodRecentSettingPanel({super.key});

  @override
  State<YesodRecentSettingPanel> createState() =>
      YesodRecentSettingPanelState();
}

class YesodRecentSettingPanelState extends State<YesodRecentSettingPanel> {
  bool initialized = false;
  List<String> feedIDFilter = [];
  List<String> categoryFilter = [];
  bool hideRead = false;
  FeedItemListType listType = FeedItemListType.card;

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  void submit(BuildContext context) {
    context.read<YesodBloc>().add(YesodFeedItemListConfigSetEvent(
          YesodFeedItemListConfig(
            feedIdFilter: feedIDFilter,
            categoryFilter: categoryFilter,
            hideRead: hideRead,
            listType: listType,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(
      builder: (context, state) {
        feedIDFilter = state.listConfig?.feedIdFilter?.toList() ?? [];
        categoryFilter = state.listConfig?.categoryFilter?.toList() ?? [];
        listType = state.listConfig?.listType ?? FeedItemListType.card;
        hideRead = state.listConfig?.hideRead ?? false;
        initialized = true;

        return RightPanelForm(
          title: const Text('设置'),
          formFields: [
            SpacingHelper.defaultDivider,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('显示风格'),
            ),
            AnimatedToggleSwitch<FeedItemListType>.size(
              current: listType,
              values: FeedItemListType.values,
              iconOpacity: 1.0,
              selectedIconScale: 1.0,
              indicatorSize: const Size.fromWidth(100),
              iconAnimationType: AnimationType.onHover,
              styleAnimationType: AnimationType.onHover,
              spacing: 2.0,
              customIconBuilder: (context, local, global) {
                final text = const ['列表', '杂志', '卡片'][local.index];
                return Center(child: Text(text));
              },
              onChanged: (value) {
                setState(() {
                  listType = value;
                  submit(context);
                });
              },
            ),
            SpacingHelper.defaultDivider,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('筛选'),
            ),
            SwitchFormField(
              onSaved: (newValue) {
                setState(() {
                  hideRead = newValue ?? false;
                  submit(context);
                });
              },
              title: const Text('隐藏已读'),
              initialValue: hideRead,
            ),
            MultiSelectDialogField(
              title: const Text('按订阅筛选'),
              buttonText: const Text('订阅'),
              buttonIcon: const Icon(Icons.filter_alt_outlined),
              searchable: true,
              items: [
                for (final ListFeedConfigsResponse_FeedWithConfig config
                    in state.feedConfigs ?? [])
                  MultiSelectItem(config.config.id.id.toString(),
                      '${config.config.name} - ${config.feed.title}'),
              ],
              itemsTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              selectedItemsTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              initialValue: feedIDFilter,
              onConfirm: (values) {
                feedIDFilter = values;
              },
              decoration: BoxDecoration(
                borderRadius: SpacingHelper.defaultBorderRadius,
              ),
            ),
            MultiSelectDialogField(
              title: const Text('按分类筛选'),
              buttonText: const Text('分类'),
              buttonIcon: const Icon(Icons.filter_alt_outlined),
              searchable: true,
              items: [
                for (final String category in state.feedCategories ?? [])
                  MultiSelectItem(
                      category, category.isNotEmpty ? category : '未分类'),
              ],
              itemsTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              selectedItemsTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              initialValue: categoryFilter,
              onConfirm: (values) {
                categoryFilter = values;
              },
              decoration: BoxDecoration(
                borderRadius: SpacingHelper.defaultBorderRadius,
              ),
            ),
          ],
          onSubmit: () {
            submit(context);
            close(context);
          },
          close: () => close(context),
        );
      },
    );
  }
}
