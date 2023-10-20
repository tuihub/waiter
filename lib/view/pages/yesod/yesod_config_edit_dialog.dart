import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../../common/api/api_mixins.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';

class YesodConfigEditDialog extends StatefulWidget {
  final void Function() callback;
  final FeedConfig config;

  const YesodConfigEditDialog(
      {super.key, required this.config, required this.callback});
  @override
  State<YesodConfigEditDialog> createState() => _YesodConfigEditDialogState();
}

class _YesodConfigEditDialogState extends State<YesodConfigEditDialog>
    with SingleRequestMixin<YesodConfigEditDialog, UpdateFeedConfigResponse> {
  @override
  void initState() {
    super.initState();
    name = widget.config.name;
    feedUrl = widget.config.feedUrl;
    feedEnabled =
        widget.config.status == FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE;
    pullInterval = widget.config.pullInterval.seconds.toInt();
    category = widget.config.category;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
        request: (client, option) {
          return client.updateFeedConfig(
            UpdateFeedConfigRequest(
              config: FeedConfig(
                id: widget.config.id,
                name: name,
                feedUrl: feedUrl,
                source: widget.config.source,
                status: feedEnabled
                    ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                    : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                pullInterval: $duration.Duration(
                  seconds: $fixnum.Int64(pullInterval * 60),
                ),
                category: category,
              ),
            ),
            options: option,
          );
        },
      ).then((value) {
        widget.callback();
        Navigator.of(context).pop();
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  late String name;
  late String feedUrl;
  late int pullInterval;
  late String category;
  late bool feedEnabled;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('订阅详情'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                initialValue: widget.config.id.id.toString(),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入名称';
                  }
                  return null;
                },
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
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isError && !loading ? 48 : 0,
                child: isError && !loading
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            Text(response.error ?? '未知错误'),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: submit,
          child:
              loading ? const CircularProgressIndicator() : const Text('应用更改'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('取消'),
        )
      ],
    );
  }
}
