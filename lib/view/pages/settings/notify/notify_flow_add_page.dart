import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../../bloc/yesod/yesod_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../components/expand_rail_tile.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';
import '../../../helper/spacing.dart';

class NotifyFlowAddPage extends StatefulWidget {
  const NotifyFlowAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotifyFlowAddPageState();
}

class _NotifyFlowAddPageState extends State<NotifyFlowAddPage> {
  void close(BuildContext context) {
    AppRoutes.notifyFlowAdd().pop(context);
  }

  int _index = 0;
  final formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  bool enabled = true;
  List<NotifyFlowSource> sources = [];
  List<NotifyFlowTarget> targets = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetzachBloc, NetzachState>(
      listener: (context, state) {
        if (state is NetzachFlowAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        final notifySources = context.read<YesodBloc>().state.feedConfigs ?? [];
        final notifyTargets = state.notifyTargets ?? [];
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('添加规则'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Stepper(
                      currentStep: _index,
                      onStepCancel: () {
                        if (_index > 0) {
                          setState(() {
                            _index -= 1;
                          });
                        }
                      },
                      onStepContinue: () {
                        if (_index <= 1) {
                          setState(() {
                            _index += 1;
                          });
                        }
                      },
                      onStepTapped: (int index) {
                        setState(() {
                          _index = index;
                        });
                      },
                      steps: <Step>[
                        Step(
                          title: const Text('基础信息'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
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
                                onChanged: (newValue) => description = newValue,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.description),
                                  border: OutlineInputBorder(),
                                  labelText: '备注',
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SwitchFormField(
                                onSaved: (newValue) =>
                                    enabled = newValue ?? false,
                                title: const Text('启用'),
                                initialValue: enabled,
                              ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('通知源'),
                          content: Column(children: [
                            MultiSelectDialogField(
                              title: const Text('订阅源'),
                              buttonText: const Text('订阅'),
                              buttonIcon: const Icon(Icons.filter_alt_outlined),
                              items: [
                                for (final ListFeedConfigsResponse_FeedWithConfig config
                                    in notifySources)
                                  MultiSelectItem(
                                      config.config.id,
                                      config.feed.title.isNotEmpty
                                          ? config.feed.title
                                          : config.config.feedUrl),
                              ],
                              initialValue:
                                  sources.map((e) => e.sourceId).toList(),
                              onConfirm: (values) {
                                setState(() {
                                  sources = values
                                      .map((e) => NotifyFlowSource(sourceId: e))
                                      .toList();
                                });
                              },
                              decoration: BoxDecoration(
                                borderRadius: SpacingHelper.defaultBorderRadius,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请选择至少一个订阅';
                                }
                                return null;
                              },
                            ),
                            for (var i = 0; i < sources.length; i++)
                              Column(children: [
                                SpacingHelper.defaultDivider,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(notifySources
                                      .firstWhere((e) =>
                                          e.config.id == sources[i].sourceId)
                                      .feed
                                      .title),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ExpandRailTile(
                                    title: const Text('过滤器'),
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        onChanged: (newValue) {
                                          setState(() {
                                            sources[i].filter = NotifyFilter(
                                              includeKeywords: [newValue],
                                              excludeKeywords: sources[i]
                                                  .filter
                                                  .excludeKeywords,
                                            );
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '排除关键字',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        onChanged: (newValue) {
                                          setState(() {
                                            sources[i].filter = NotifyFilter(
                                              includeKeywords: sources[i]
                                                  .filter
                                                  .includeKeywords,
                                              excludeKeywords: [newValue],
                                            );
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '包含关键字',
                                        ),
                                      ),
                                    ]),
                              ]),
                          ]),
                        ),
                        Step(
                          title: const Text('通知目标'),
                          content: Column(children: [
                            MultiSelectDialogField(
                              title: const Text('第三方平台'),
                              buttonText: const Text('第三方平台'),
                              buttonIcon: const Icon(Icons.filter_alt_outlined),
                              items: [
                                for (final NotifyTarget config in notifyTargets)
                                  MultiSelectItem(config.id,
                                      '${config.name} (${notifyTargetTypeString(config.type)})'),
                              ],
                              initialValue:
                                  targets.map((e) => e.targetId).toList(),
                              onConfirm: (values) {
                                setState(() {
                                  targets = values
                                      .map((e) => NotifyFlowTarget(targetId: e))
                                      .toList();
                                });
                              },
                              decoration: BoxDecoration(
                                borderRadius: SpacingHelper.defaultBorderRadius,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请选择至少一个第三方平台';
                                }
                                return null;
                              },
                            ),
                            for (var i = 0; i < targets.length; i++)
                              Column(children: [
                                SpacingHelper.defaultDivider,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      '${notifyTargets.firstWhere((e) => e.id == targets[i].targetId).name} (${notifyTargetTypeString(notifyTargets.firstWhere((e) => e.id == targets[i].targetId).type)})'),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  onChanged: (newValue) {
                                    setState(() {
                                      targets[i].channelId = newValue;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '频道',
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ExpandRailTile(
                                    title: const Text('过滤器'),
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        onChanged: (newValue) {
                                          setState(() {
                                            targets[i].filter = NotifyFilter(
                                              includeKeywords: [newValue],
                                              excludeKeywords: targets[i]
                                                  .filter
                                                  .excludeKeywords,
                                            );
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '排除关键字',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        onChanged: (newValue) {
                                          setState(() {
                                            targets[i].filter = NotifyFilter(
                                              includeKeywords: targets[i]
                                                  .filter
                                                  .includeKeywords,
                                              excludeKeywords: [newValue],
                                            );
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '包含关键字',
                                        ),
                                      ),
                                    ]),
                              ]),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height:
                        state is NetzachFlowAddState && state.failed ? 48 : 0,
                    child: state is NetzachFlowAddState && state.failed
                        ? Ink(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
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
                          .read<NetzachBloc>()
                          .add(NetzachFlowAddEvent(NotifyFlow(
                            name: name,
                            description: description,
                            status: enabled
                                ? NotifyFlowStatus.NOTIFY_FLOW_STATUS_ACTIVE
                                : NotifyFlowStatus.NOTIFY_FLOW_STATUS_SUSPEND,
                            sources: sources,
                            targets: targets,
                          )));
                    }
                  },
                  child: state is NetzachFlowAddState && state.processing
                      ? const CircularProgressIndicator()
                      : const Text('确定'),
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
