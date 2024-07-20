import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../model/yesod_model.dart';
import '../../form/form_field.dart';
import '../../helper/spacing.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

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

  Future<void> init(BuildContext context) async {
    if (!initialized) {
      final listConfig =
          await context.read<YesodBloc>().repo.getFeedItemListConfig();
      feedIDFilter = listConfig.feedIdFilter?.toList() ?? [];
      categoryFilter = listConfig.categoryFilter?.toList() ?? [];
      listType = listConfig.listType ?? FeedItemListType.card;
      hideRead = listConfig.hideRead ?? false;
      initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(
      builder: (context, state) {
        return FutureBuilder(
          future: init(context),
          builder: (context, snapshot) {
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
                    return Center(
                        child: Text(text,
                            style: TextStyle(
                                color: Color.lerp(Colors.black, Colors.white,
                                    local.animationValue))));
                  },
                  onChanged: (value) {
                    setState(() {
                      listType = value;
                    });
                  },
                ),
                SpacingHelper.defaultDivider,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('筛选'),
                ),
                SwitchFormField(
                  onSaved: (newValue) => hideRead = newValue ?? false,
                  title: const Text('隐藏已读'),
                  initialValue: hideRead,
                ),
                MultiSelectDialogField(
                  title: const Text('按订阅筛选'),
                  buttonText: const Text('订阅'),
                  buttonIcon: const Icon(Icons.filter_alt_outlined),
                  items: [
                    for (final ListFeedConfigsResponse_FeedWithConfig config
                        in state.feedConfigs ?? [])
                      MultiSelectItem(
                          config.config.id.id.toString(), config.feed.title),
                  ],
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
              onSubmit: () async => context
                  .read<YesodBloc>()
                  .repo
                  .setFeedItemListConfig(YesodFeedItemListConfig(
                    feedIdFilter: feedIDFilter,
                    categoryFilter: categoryFilter,
                    hideRead: hideRead,
                    listType: listType,
                  ))
                  .then((value) => close(context)),
              close: () => close(context),
            );
          },
        );
      },
    );
  }
}
