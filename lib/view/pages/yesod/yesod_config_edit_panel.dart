import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../components/toast.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class YesodConfigEditPanel extends StatelessWidget {
  const YesodConfigEditPanel({super.key, required this.index});

  final int? index;

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodConfigEditState && state.success) {
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
          title: const Text('订阅详情'),
          formFields: [
            TextFormField(
              initialValue: config.id.id.toString(),
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: feedUrl,
              onSaved: (newValue) => feedUrl = newValue!,
              decoration: const InputDecoration(
                icon: Icon(Icons.rss_feed),
                border: OutlineInputBorder(),
                label: Text('订阅地址'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: name,
              onSaved: (newValue) => name = newValue!,
              decoration: const InputDecoration(
                icon: Icon(Icons.text_fields),
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: pullInterval.toString(),
              onSaved: (newValue) => pullInterval = int.parse(newValue!),
              decoration: const InputDecoration(
                icon: Icon(Icons.timer),
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: category,
              onSaved: (newValue) => category = newValue!,
              decoration: const InputDecoration(
                icon: Icon(Icons.category),
                border: OutlineInputBorder(),
                labelText: '分组',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchFormField(
              initialValue: feedEnabled,
              onSaved: (newValue) => feedEnabled = newValue!,
              title: const Text('启用'),
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchFormField(
              initialValue: hideItems,
              onSaved: (newValue) => hideItems = newValue!,
              title: const Text('隐藏内容'),
            ),
          ],
          errorMsg:
              state is YesodConfigEditState && state.failed ? state.msg : null,
          onSubmit: () {
            context.read<YesodBloc>().add(YesodConfigEditEvent(
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
          submitting: state is YesodConfigEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
