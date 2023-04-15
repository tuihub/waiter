import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:waitress/common/util/input_formatters.dart';
import 'package:waitress/view/widget/form_field.dart';

class YesodeAdd extends StatefulWidget {
  final void Function() callback;

  const YesodeAdd({super.key, required this.callback});

  @override
  YesodeAddState createState() => YesodeAddState();
}

class YesodeAddState extends State<YesodeAdd>
    with SingleRequestMixin<YesodeAdd, CreateFeedConfigResponse> {
  final _formKey = GlobalKey<FormState>();

  late String rssUrl;
  late int refreshInterval;
  late bool enabled;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest().then((value) {
        if (isSuccess) {
          widget.callback();
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加RSS订阅'),
      content: SizedBox(
        width: 600,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onSaved: (newValue) => rssUrl = newValue!,
                decoration: const InputDecoration(
                  icon: Icon(Icons.rss_feed),
                  border: OutlineInputBorder(),
                  labelText: 'RSS订阅地址',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入RSS订阅地址';
                  }
                  if (value.startsWith("http://") ||
                      value.startsWith("https://")) {
                    return null;
                  }
                  return "请输入正确的地址格式";
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                onSaved: (newValue) => refreshInterval = int.parse(newValue!),
                initialValue: "60",
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  border: OutlineInputBorder(),
                  labelText: '刷新间隔(秒)',
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
              const Divider(
                height: 8,
              ),
              SwitchFormField(
                onSaved: (newValue) => enabled = newValue!,
                title: const Text("立即启用"),
                initialValue: true,
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
                            SizedBox(
                              width: 24,
                            ),
                            Text(response.error ?? "未知错误"),
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
          child: loading ? const CircularProgressIndicator() : const Text('确定'),
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

  @override
  Future<CreateFeedConfigResponse> request(client, option) async {
    return await client.createFeedConfig(
      CreateFeedConfigRequest(
        config: FeedConfig(
          feedUrl: rssUrl,
          source: FeedConfigSource.FEED_CONFIG_SOURCE_COMMON,
          status: enabled
              ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
              : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
          pullInterval: $duration.Duration(
            seconds: $fixnum.Int64(refreshInterval),
          ),
        ),
      ),
      options: option,
    );
  }
}
