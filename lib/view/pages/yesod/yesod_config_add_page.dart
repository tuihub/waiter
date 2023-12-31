import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';
import 'yesod_preview_card.dart';

class YesodConfigAddPage extends StatelessWidget {
  const YesodConfigAddPage({super.key});

  void close(BuildContext context) {
    AppRoutes.yesodConfigAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var url = '';
    var name = '';
    var category = '';
    var refreshInterval = 60;
    var enabled = true;
    var hideItems = false;
    RssPostItem? feedPreview;

    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodConfigAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
        if (state is YesodConfigPreviewState && state.success) {
          feedPreview = state.feedPreview;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('添加订阅'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (feedPreview != null && feedPreview!.link != null)
                    YesodPreviewCard(
                      iconUrl: feedPreview!.subscription.iconUrl,
                      name: feedPreview!.subscription.title ?? '',
                      images: feedPreview!.image != null
                          ? [feedPreview!.image!]
                          : null,
                      description: feedPreview!.description,
                      title: feedPreview!.title ?? '',
                      callback: () {},
                      listType: FeedListType.card,
                    ),
                  Text(state is YesodConfigPreviewState && state.failed
                      ? state.msg ?? ''
                      : ''),
                  const SizedBox(
                    height: 8,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
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
                          onChanged: (newValue) =>
                              refreshInterval = int.parse(newValue),
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: state is YesodConfigAddState && state.failed
                              ? 48
                              : 0,
                          child: state is YesodConfigAddState && state.failed
                              ? Ink(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius:
                                        BorderRadius.circular(kToolbarHeight),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      Text(state.msg ?? ''),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
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
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<YesodBloc>()
                          .add(YesodConfigAddEvent(FeedConfig(
                            name: name,
                            feedUrl: url,
                            source: FeedConfigSource.FEED_CONFIG_SOURCE_COMMON,
                            status: enabled
                                ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                                : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                            pullInterval: $duration.Duration(
                              seconds: $fixnum.Int64(refreshInterval * 60),
                            ),
                            category: category,
                            hideItems: hideItems,
                          )));
                    }
                  },
                  child: state is YesodConfigAddState && state.processing
                      ? const CircularProgressIndicator()
                      : const Text('确定'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<YesodBloc>()
                          .add(YesodConfigPreviewEvent(url));
                    }
                  },
                  child: state is YesodConfigAddState && state.processing
                      ? const CircularProgressIndicator()
                      : const Text('加载预览'),
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
