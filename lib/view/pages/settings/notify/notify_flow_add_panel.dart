import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../../bloc/yesod/yesod_bloc.dart';
import '../../../../model/netzach_model.dart';
import '../../../components/chips_input.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';
import '../../../helper/spacing.dart';
import '../../../specialized/right_panel_form.dart';
import '../../frame_page.dart';

class NotifyFlowAddPanel extends StatefulWidget {
  const NotifyFlowAddPanel({super.key});

  @override
  State<StatefulWidget> createState() => _NotifyFlowAddPanelState();
}

class _NotifyFlowAddPanelState extends State<NotifyFlowAddPanel> {
  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  int _index = 0;
  String name = '';
  String description = '';
  bool enabled = true;
  List<NotifyFlowSourceModel> sources = [];
  List<NotifyFlowTargetModel> targets = [];

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
        return RightPanelForm(
          title: const Text('添加规则'),
          formFields: [
            Stepper(
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
                        onSaved: (newValue) => enabled = newValue ?? false,
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
                          if (config.config.id.id != 0)
                            MultiSelectItem(
                                config.config.id, config.feed.title),
                      ],
                      initialValue: sources.map((e) => e.feedConfigId).toList(),
                      onConfirm: (values) {
                        final List<NotifyFlowSourceModel> newSources = [];
                        for (final value in values) {
                          if (sources
                              .map((e) => e.feedConfigId)
                              .contains(value)) {
                            newSources.add(sources
                                .firstWhere((e) => e.feedConfigId == value));
                          } else {
                            newSources.add(NotifyFlowSourceModel(
                              feedConfigId: value,
                              filter: NotifyFilterModel(
                                excludeKeywords: [],
                                includeKeywords: [],
                              ),
                            ));
                          }
                        }
                        setState(() {
                          sources = newSources;
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
                              .firstWhere(
                                  (e) => e.config.id == sources[i].feedConfigId)
                              .feed
                              .title),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ExpansionTile(title: const Text('过滤器'), children: [
                          const SizedBox(
                            height: 8,
                          ),
                          ChipsInput<String>(
                            values: sources[i].filter.excludeKeywords,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '排除关键字',
                            ),
                            onChanged: (data) {
                              setState(() {
                                sources[i].filter.excludeKeywords = data;
                              });
                            },
                            onSubmitted: (text) {
                              if (sources[i]
                                  .filter
                                  .excludeKeywords
                                  .contains(text)) {
                                return;
                              } else if (text.trim().isNotEmpty) {
                                setState(() {
                                  sources[i].filter.excludeKeywords = [
                                    ...sources[i].filter.excludeKeywords,
                                    text
                                  ];
                                });
                              } else {
                                setState(() {
                                  sources[i].filter.excludeKeywords = [];
                                });
                              }
                            },
                            onTextChanged: (text) {
                              sources[i].filter.extraExcludeKeywords =
                                  text.isNotEmpty ? [text] : [];
                            },
                            chipBuilder: (context, topping) => ToppingInputChip(
                              topping: topping,
                              onDeleted: (text) {
                                setState(() {
                                  sources[i].filter.excludeKeywords = [
                                    ...sources[i]
                                        .filter
                                        .excludeKeywords
                                        .where((e) => e != text)
                                  ];
                                });
                              },
                              onSelected: (_) {},
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ChipsInput<String>(
                            values: sources[i].filter.includeKeywords,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '包含关键字',
                            ),
                            onChanged: (data) {
                              setState(() {
                                sources[i].filter.includeKeywords = data;
                              });
                            },
                            onSubmitted: (text) {
                              if (sources[i]
                                  .filter
                                  .includeKeywords
                                  .contains(text)) {
                                return;
                              } else if (text.trim().isNotEmpty) {
                                setState(() {
                                  sources[i].filter.includeKeywords = [
                                    ...sources[i].filter.includeKeywords,
                                    text
                                  ];
                                });
                              } else {
                                setState(() {
                                  sources[i].filter.includeKeywords = [];
                                });
                              }
                            },
                            onTextChanged: (text) {
                              sources[i].filter.extraIncludeKeywords =
                                  text.isNotEmpty ? [text] : [];
                            },
                            chipBuilder: (context, topping) => ToppingInputChip(
                              topping: topping,
                              onDeleted: (text) {
                                setState(() {
                                  sources[i].filter.includeKeywords = [
                                    ...sources[i]
                                        .filter
                                        .includeKeywords
                                        .where((e) => e != text)
                                  ];
                                });
                              },
                              onSelected: (_) {},
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
                          if (config.id.id != 0)
                            MultiSelectItem(config.id, config.name),
                      ],
                      initialValue: targets.map((e) => e.targetId).toList(),
                      onConfirm: (values) {
                        final List<NotifyFlowTargetModel> newTargets = [];
                        for (final value in values) {
                          if (targets.map((e) => e.targetId).contains(value)) {
                            newTargets.add(
                                targets.firstWhere((e) => e.targetId == value));
                          } else {
                            newTargets.add(NotifyFlowTargetModel(
                              targetId: value,
                              filter: NotifyFilterModel(
                                excludeKeywords: [],
                                includeKeywords: [],
                              ),
                            ));
                          }
                        }
                        setState(() {
                          targets = newTargets;
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
                          child: Text(notifyTargets
                              .firstWhere((e) => e.id == targets[i].targetId)
                              .name),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ExpansionTile(title: const Text('过滤器'), children: [
                          const SizedBox(
                            height: 8,
                          ),
                          ChipsInput<String>(
                            values: targets[i].filter.excludeKeywords,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '排除关键字',
                            ),
                            onChanged: (data) {
                              setState(() {
                                targets[i].filter.excludeKeywords = data;
                              });
                            },
                            onSubmitted: (text) {
                              if (targets[i]
                                  .filter
                                  .excludeKeywords
                                  .contains(text)) {
                                return;
                              } else if (text.trim().isNotEmpty) {
                                setState(() {
                                  targets[i].filter.excludeKeywords = [
                                    ...targets[i].filter.excludeKeywords,
                                    text
                                  ];
                                });
                              } else {
                                setState(() {
                                  targets[i].filter.excludeKeywords = [];
                                });
                              }
                            },
                            onTextChanged: (text) {
                              targets[i].filter.extraExcludeKeywords =
                                  text.isNotEmpty ? [text] : [];
                            },
                            chipBuilder: (context, topping) => ToppingInputChip(
                              topping: topping,
                              onDeleted: (text) {
                                setState(() {
                                  targets[i].filter.excludeKeywords = [
                                    ...targets[i]
                                        .filter
                                        .excludeKeywords
                                        .where((e) => e != text)
                                  ];
                                });
                              },
                              onSelected: (_) {},
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ChipsInput<String>(
                            values: targets[i].filter.includeKeywords,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '包含关键字',
                            ),
                            onChanged: (data) {
                              setState(() {
                                targets[i].filter.includeKeywords = data;
                              });
                            },
                            onSubmitted: (text) {
                              if (targets[i]
                                  .filter
                                  .includeKeywords
                                  .contains(text)) {
                                return;
                              } else if (text.trim().isNotEmpty) {
                                setState(() {
                                  targets[i].filter.includeKeywords = [
                                    ...targets[i].filter.includeKeywords,
                                    text
                                  ];
                                });
                              } else {
                                setState(() {
                                  targets[i].filter.includeKeywords = [];
                                });
                              }
                            },
                            onTextChanged: (text) {
                              targets[i].filter.extraIncludeKeywords =
                                  text.isNotEmpty ? [text] : [];
                            },
                            chipBuilder: (context, topping) => ToppingInputChip(
                              topping: topping,
                              onDeleted: (text) {
                                setState(() {
                                  targets[i].filter.includeKeywords = [
                                    ...targets[i]
                                        .filter
                                        .includeKeywords
                                        .where((e) => e != text)
                                  ];
                                });
                              },
                              onSelected: (_) {},
                            ),
                          ),
                        ]),
                      ]),
                  ]),
                ),
              ],
            ),
          ],
          errorMsg:
              state is NetzachFlowAddState && state.failed ? state.msg : null,
          onSubmit: () {
            context.read<NetzachBloc>().add(NetzachFlowAddEvent(NotifyFlow(
                  name: name,
                  description: description,
                  status: enabled
                      ? NotifyFlowStatus.NOTIFY_FLOW_STATUS_ACTIVE
                      : NotifyFlowStatus.NOTIFY_FLOW_STATUS_SUSPEND,
                  sources: sources.map((e) => e.toProto()).toList(),
                  targets: targets.map((e) => e.toProto()).toList(),
                )));
          },
          submitting: state is NetzachFlowAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
