import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../components/toast.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class YesodFeedManageAddPanel extends StatelessWidget {
  const YesodFeedManageAddPanel({super.key});

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final feedSources =
        context.read<MainBloc>().state.serverFeatureSummary?.feedSources ?? [];
    var source = feedSources.isNotEmpty ? feedSources.first : null;
    var url = '';
    var name = '';
    var category = '';
    var refreshInterval = 60;
    var enabled = true;
    var hideItems = false;

    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedConfigAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          formKey: formKey,
          title: Text(S.of(context).feedConfigAdd),
          formFields: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.place),
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
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              onChanged: (newValue) => url = newValue,
              decoration: const InputDecoration(
                icon: Icon(Icons.rss_feed),
                border: OutlineInputBorder(),
                label: Text('订阅地址'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              onChanged: (newValue) => name = newValue,
              decoration: const InputDecoration(
                icon: Icon(Icons.text_fields),
                border: OutlineInputBorder(),
                label: Text('名称'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              onChanged: (newValue) => refreshInterval = int.parse(newValue),
              initialValue: refreshInterval.toString(),
              decoration: const InputDecoration(
                icon: Icon(Icons.timer),
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (newValue) => category = newValue,
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
              onSaved: (newValue) => enabled = newValue ?? false,
              title: const Text('立即启用'),
              initialValue: enabled,
            ),
            const SizedBox(
              height: 16,
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
