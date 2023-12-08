import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../helper/spacing.dart';

class YesodRecentSettingPage extends StatelessWidget {
  const YesodRecentSettingPage({super.key});

  void close(BuildContext context) {
    AppRoutes.yesodRecentFilter().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<InternalID> feedIDFilter = [];
    List<String> categoryFilter = [];

    return BlocBuilder<YesodBloc, YesodState>(
      builder: (context, state) {
        feedIDFilter = state.feedItemFilter?.feedIdFilter?.toList() ?? [];
        categoryFilter = state.feedItemFilter?.categoryFilter?.toList() ?? [];
        final listType = state.feedListType ?? FeedListType.enrich;

        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('设置'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SpacingHelper.defaultDivider,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('显示风格'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AnimatedToggleSwitch<FeedListType>.size(
                    current: listType,
                    values: FeedListType.values,
                    iconOpacity: 1.0,
                    selectedIconScale: 1.0,
                    indicatorSize: const Size.fromWidth(100),
                    iconAnimationType: AnimationType.onHover,
                    styleAnimationType: AnimationType.onHover,
                    spacing: 2.0,
                    customIconBuilder: (context, local, global) {
                      final text = const ['表格', '信息', '动态'][local.index];
                      return Center(
                          child: Text(text,
                              style: TextStyle(
                                  color: Color.lerp(Colors.black, Colors.white,
                                      local.animationValue))));
                    },
                    onChanged: (value) {
                      context.read<YesodBloc>().add(
                            YesodFeedListTypeSetEvent(value),
                          );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SpacingHelper.defaultDivider,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('筛选'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MultiSelectDialogField(
                    title: const Text('按订阅筛选'),
                    buttonText: const Text('订阅'),
                    buttonIcon: const Icon(Icons.filter_alt_outlined),
                    items: [
                      for (final ListFeedConfigsResponse_FeedWithConfig config
                          in state.feedConfigs ?? [])
                        MultiSelectItem(
                            config.config.id,
                            config.feed.title.isNotEmpty
                                ? config.feed.title
                                : config.config.feedUrl),
                    ],
                    initialValue: feedIDFilter,
                    onConfirm: (values) {
                      feedIDFilter = values;
                    },
                    decoration: BoxDecoration(
                      borderRadius: SpacingHelper.defaultBorderRadius,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MultiSelectDialogField(
                    title: const Text('按分类筛选'),
                    buttonText: const Text('分类'),
                    buttonIcon: const Icon(Icons.filter_alt_outlined),
                    items: [
                      for (final String category in state.feedCategories ?? [])
                        MultiSelectItem(
                            category, category.isNotEmpty ? category : '未分类'),
                    ],
                    initialValue: categoryFilter,
                    onConfirm: (values) {
                      categoryFilter = values;
                    },
                    decoration: BoxDecoration(
                      borderRadius: SpacingHelper.defaultBorderRadius,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<YesodBloc>().add(
                          YesodFeedItemDigestsSetFilterEvent(
                            YesodFeedItemFilter(
                              feedIdFilter: feedIDFilter,
                              categoryFilter: categoryFilter,
                            ),
                          ),
                        );
                    close(context);
                  },
                  child: const Text('确定'),
                ),
                ElevatedButton(
                  onPressed: () => close(context),
                  child: const Text('取消'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
