import 'dart:async';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../common/api/api_mixins.dart';
import '../../../repo/yesod/yesod_repo.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';

class YesodConfigEditPage extends StatefulWidget {
  const YesodConfigEditPage({super.key, required this.feedConfigID});

  final int feedConfigID;

  @override
  State<YesodConfigEditPage> createState() => _YesodConfigEditPageState();
}

class _YesodConfigEditPageState extends State<YesodConfigEditPage>
    with SingleRequestMixin<YesodConfigEditPage, UpdateFeedConfigResponse> {
  bool initialized = false;

  final _formKey = GlobalKey<FormState>();

  late FeedConfig config;
  late String name;
  late String feedUrl;
  late int pullInterval;
  late String category;
  late bool feedEnabled;

  @override
  void initState() {
    super.initState();
    config = FeedConfig();

    unawaited(GetIt.I<YesodRepo>()
        .getFeedConfig(InternalID(id: $fixnum.Int64(widget.feedConfigID)))
        .then((value) {
      setState(() {
        config = value.config;

        name = config.name;
        feedUrl = config.feedUrl;
        feedEnabled =
            config.status == FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE;
        pullInterval = config.pullInterval.seconds.toInt() ~/ 60;
        category = config.category;
        initialized = true;
      });
    }));
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      unawaited(doRequest(
        request: (client, option) {
          return client.updateFeedConfig(
            UpdateFeedConfigRequest(
              config: FeedConfig(
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
              ),
            ),
            options: option,
          );
        },
      ).then((value) {
        if (isSuccess) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      }));
    }
  }

  void close(BuildContext context) {
    AppRoutes.yesodConfigEdit(0).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        title: const Text('订阅详情'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(isError ? response.error ?? '' : ''),
              buildForm(),
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
              onPressed: submit,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('应用更改'),
            ),
            ElevatedButton(
              onPressed: () => close(context),
              child: const Text('取消'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return initialized
        ? Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
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
          )
        : const LinearProgressIndicator();
  }
}
