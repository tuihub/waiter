import 'package:extended_image/extended_image.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../repo/grpc/l10n.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class YesodFeedManagePage extends StatelessWidget {
  const YesodFeedManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<YesodBloc>().add(YesodInitEvent());
      }
      final listData = state.feedConfigs ?? [];
      return ListManagePage(
        title: S.of(context).feedConfigManage,
        processing: state is YesodFeedConfigLoadState && state.processing,
        msg: state is YesodFeedConfigLoadState ? state.msg : '',
        onRefresh: () {
          context.read<YesodBloc>().add(YesodFeedConfigLoadEvent());
        },
        onAdd: () {
          const YesodFeedManageRoute(action: YesodFeedManageActions.add)
              .go(context);
          FramePage.of(context)?.openDrawer();
        },
        children: [
          for (var i = 0; i < listData.length; i++)
            ListTile(
              leading: listData[i].feed.image.url.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: ExtendedNetworkImageProvider(
                        listData[i].feed.image.url,
                      ),
                    )
                  : null,
              trailing: const Icon(Icons.edit),
              onTap: () {
                YesodFeedManageRoute(action: YesodFeedManageActions.edit, id: i)
                    .go(context);
                FramePage.of(context)?.openDrawer();
              },
              title: Text(listData[i].config.name.isNotEmpty
                  ? listData[i].config.name
                  : listData[i].feed.title),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '${S.current.FEED_CONFIG_STATUS}: ${feedConfigStatusString(listData[i].config.status)}'),
                  if (listData[i].config.latestPullStatus ==
                      FeedConfigPullStatus.FEED_CONFIG_PULL_STATUS_SUCCESS)
                    Text(
                        '上次更新：${DurationHelper.recentString(listData[i].config.latestPullTime.toDateTime())}')
                  else if (listData[i].config.latestPullStatus ==
                      FeedConfigPullStatus.FEED_CONFIG_PULL_STATUS_FAILED)
                    Text('更新失败：${listData[i].config.latestPullMessage}')
                  else
                    const Text('更新中...'),
                ],
              ),
            ),
        ],
      );
    });
  }
}

class YesodFeedManageAddPanel extends StatelessWidget {
  const YesodFeedManageAddPanel({super.key});

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final feedSources =
        context.read<MainBloc>().state.serverFeatureSummary?.feedSources ?? [];
    var source = feedSources.isNotEmpty ? feedSources.first : null;
    var url = '';
    var name = '';
    var category = '';
    var refreshInterval = 60;
    var enabled = true;
    var hideItems = false;
    var actions = <InternalID?>[];

    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedConfigAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        final actionSets = state.feedActionSets ?? [];
        return RightPanelForm(
          title: Text(S.of(context).feedConfigAdd),
          formFields: [
            if (feedSources.isEmpty)
              const TextFormErrorMessage(message: '当前服务器无可用订阅源'),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '订阅源类型',
              ),
              value: source,
              items: [
                for (final s in feedSources)
                  DropdownMenuItem(
                    value: s,
                    child: Text(s.id),
                  ),
              ],
              onChanged: (newValue) => source = newValue,
              validator: (value) {
                if (value == null) {
                  return '请选择订阅源类型';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (newValue) => url = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('订阅地址'),
              ),
            ),
            TextFormField(
              onChanged: (newValue) => name = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('名称'),
              ),
            ),
            TextFormField(
              onChanged: (newValue) => refreshInterval = int.parse(newValue),
              initialValue: refreshInterval.toString(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '刷新间隔(分钟)',
              ),
              inputFormatters: [IntInputFormatter()],
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入刷新间隔';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (newValue) => category = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '分组',
              ),
            ),
            MultiSelectBottomSheetField<InternalID?>(
              title: const Text('规则集'),
              buttonText: const Text('自动化规则'),
              items:
                  actionSets.map((e) => MultiSelectItem(e.id, e.name)).toList(),
              listType: MultiSelectListType.LIST,
              onConfirm: (values) {
                actions = values;
              },
              decoration: BoxDecoration(
                borderRadius: SpacingHelper.defaultBorderRadius,
              ),
            ),
            SwitchFormField(
              onSaved: (newValue) => enabled = newValue ?? false,
              title: const Text('立即启用'),
              initialValue: enabled,
            ),
            SwitchFormField(
              onSaved: (newValue) => hideItems = newValue ?? false,
              title: const Text('隐藏内容'),
              initialValue: hideItems,
            ),
          ],
          errorMsg: state is YesodFeedConfigAddState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context.read<YesodBloc>().add(YesodFeedConfigAddEvent(FeedConfig(
                  name: name,
                  feedUrl: url,
                  source: source?.id,
                  status: enabled
                      ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                      : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                  pullInterval: $duration.Duration(
                    seconds: $fixnum.Int64(refreshInterval * 60),
                  ),
                  category: category,
                  hideItems: hideItems,
                )));
          },
          submitting: state is YesodFeedConfigAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class YesodFeedManageEditPanel extends StatelessWidget {
  const YesodFeedManageEditPanel({super.key, required this.index});

  final int? index;

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedConfigEditState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        final config = index != null && state.feedConfigs != null
            ? state.feedConfigs![index!].config
            : FeedConfig();
        var name = config.name;
        var feedUrl = config.feedUrl;
        var feedEnabled =
            config.status == FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE;
        var pullInterval = config.pullInterval.seconds.toInt() ~/ 60;
        var category = config.category;
        var hideItems = config.hideItems;

        return RightPanelForm(
          title: Text(S.of(context).feedConfigEdit),
          formFields: [
            TextReadOnlyFormField(
              label: S.of(context).id,
              value: config.id.id.toString(),
            ),
            TextReadOnlyFormField(
              label: '订阅源类型',
              value: config.source,
            ),
            TextFormField(
              initialValue: feedUrl,
              onSaved: (newValue) => feedUrl = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('订阅地址'),
              ),
            ),
            TextFormField(
              initialValue: name,
              onSaved: (newValue) => name = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            TextFormField(
              initialValue: pullInterval.toString(),
              onSaved: (newValue) => pullInterval = int.parse(newValue!),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '刷新间隔(分钟)',
              ),
              inputFormatters: [IntInputFormatter()],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入刷新间隔';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: category,
              onSaved: (newValue) => category = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '分组',
              ),
            ),
            SwitchFormField(
              initialValue: feedEnabled,
              onSaved: (newValue) => feedEnabled = newValue!,
              title: const Text('启用'),
            ),
            SwitchFormField(
              initialValue: hideItems,
              onSaved: (newValue) => hideItems = newValue!,
              title: const Text('隐藏内容'),
            ),
          ],
          errorMsg: state is YesodFeedConfigEditState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context.read<YesodBloc>().add(YesodFeedConfigEditEvent(
                  FeedConfig(
                    id: config.id,
                    name: name,
                    feedUrl: feedUrl,
                    source: config.source,
                    status: feedEnabled
                        ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                        : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                    pullInterval: $duration.Duration(
                      seconds: $fixnum.Int64(pullInterval * 60),
                    ),
                    category: category,
                    latestPullTime: config.latestPullTime,
                    hideItems: hideItems,
                  ),
                ));
          },
          submitting: state is YesodFeedConfigEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
