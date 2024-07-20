import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonschema_builder/flutter_jsonschema_builder.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../layout/bootstrap_container.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/app_bar.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class YesodActionManagePage extends StatelessWidget {
  const YesodActionManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      final listData = state.feedActionSets ?? [];
      return ListManagePage(
        title: S.of(context).feedActionSetManage,
        processing: state is YesodFeedActionSetLoadState && state.processing,
        msg: state is YesodFeedActionSetLoadState ? state.msg : '',
        onRefresh: () {
          context.read<YesodBloc>().add(YesodFeedActionSetLoadEvent());
        },
        onAdd: () {
          const YesodActionManageRoute(action: YesodActionManageActions.add)
              .go(context);
          FramePage.of(context)?.openDrawer();
        },
        children: [
          for (var i = 0; i < listData.length; i++)
            ListTile(
              trailing: const Icon(Icons.edit),
              onTap: () {
                YesodActionManageRoute(
                        action: YesodActionManageActions.edit, id: i)
                    .go(context);
                FramePage.of(context)?.openDrawer();
              },
              title: Text(listData[i].name.isNotEmpty
                  ? listData[i].name
                  : listData[i].id.id.toHexString()),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(listData[i].description),
                  Text('包含${listData[i].actions.length}个规则')
                ],
              ),
            ),
        ],
      );
    });
  }
}

class YesodActionManageAddPanel extends StatefulWidget {
  const YesodActionManageAddPanel({super.key});

  @override
  State<YesodActionManageAddPanel> createState() =>
      _YesodActionManageAddPanelState();
}

class _YesodActionManageAddPanelState extends State<YesodActionManageAddPanel> {
  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  String name = '';
  String description = '';
  List<FeatureRequest> actions = <FeatureRequest>[];

  @override
  Widget build(BuildContext context) {
    final features =
        context.read<MainBloc>().state.serverFeatureSummary?.feedItemActions ??
            [];

    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedActionSetAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          title: Text(S.of(context).feedActionSetAdd),
          formFields: [
            if (features.isEmpty)
              const TextFormErrorMessage(message: '当前服务器无可用规则'),
            TextFormField(
              onChanged: (newValue) => name = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('名称'),
              ),
            ),
            TextFormField(
              onChanged: (newValue) => description = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('描述'),
              ),
            ),
            ExpansionTile(
              title: Center(
                child: Text('已配置${actions.length}个规则'),
              ),
              subtitle: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => _YesodActionConfigurePage(
                        features: features,
                        actions: actions,
                        onSave: (newActions) {
                          setState(() => actions = newActions);
                        },
                      ),
                    ),
                  );
                },
                child: const Text('编辑'),
              ),
              children: [
                for (var i = 0; i < actions.length; i++)
                  ListTile(
                    title: Text(features
                        .firstWhere((element) => element.id == actions[i].id)
                        .name),
                    subtitle: Text(actions[i].region),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() => actions.removeAt(i));
                      },
                    ),
                  ),
              ],
            ),
          ],
          errorMsg: state is YesodFeedActionSetAddState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context
                .read<YesodBloc>()
                .add(YesodFeedActionSetAddEvent(FeedActionSet(
                  name: name,
                  description: description,
                  actions: actions,
                )));
          },
          submitting: state is YesodFeedActionSetAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class YesodActionManageEditPanel extends StatefulWidget {
  const YesodActionManageEditPanel({super.key, required this.index});

  final int? index;

  @override
  State<YesodActionManageEditPanel> createState() =>
      _YesodActionManageEditPanelState();
}

class _YesodActionManageEditPanelState
    extends State<YesodActionManageEditPanel> {
  @override
  void initState() {
    super.initState();
    final state = context.read<YesodBloc>().state;
    final actionSet = widget.index != null && state.feedActionSets != null
        ? state.feedActionSets![widget.index!]
        : FeedActionSet();
    id = actionSet.id;
    name = actionSet.name;
    description = actionSet.description;
    actions = actionSet.actions;
  }

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  InternalID id = InternalID();
  String name = '';
  String description = '';
  List<FeatureRequest> actions = <FeatureRequest>[];

  @override
  Widget build(BuildContext context) {
    final features =
        context.read<MainBloc>().state.serverFeatureSummary?.feedItemActions ??
            [];
    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedActionSetEditState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          title: Text(S.of(context).feedActionSetEdit),
          formFields: [
            TextReadOnlyFormField(
              label: S.of(context).id,
              value: id.id.toString(),
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
              initialValue: description,
              onSaved: (newValue) => description = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
              ),
            ),
            ExpansionTile(
              title: Center(
                child: Text('已配置${actions.length}个规则'),
              ),
              subtitle: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => _YesodActionConfigurePage(
                        features: features,
                        actions: actions,
                        onSave: (newActions) {
                          setState(() => actions = newActions);
                        },
                      ),
                    ),
                  );
                },
                child: const Text('编辑'),
              ),
              children: [
                for (var i = 0; i < actions.length; i++)
                  ListTile(
                    title: Text(features
                        .firstWhere((element) => element.id == actions[i].id)
                        .name),
                    subtitle: Text(actions[i].region),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() => actions.removeAt(i));
                      },
                    ),
                  ),
              ],
            ),
          ],
          errorMsg: state is YesodFeedActionSetEditState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context
                .read<YesodBloc>()
                .add(YesodFeedActionSetEditEvent(FeedActionSet(
                  id: id,
                  name: name,
                  description: description,
                  actions: actions,
                )));
          },
          submitting: state is YesodFeedActionSetEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class _YesodActionConfigurePage extends StatefulWidget {
  const _YesodActionConfigurePage({
    required this.features,
    required this.actions,
    required this.onSave,
  });

  final List<FeatureFlag> features;
  final List<FeatureRequest> actions;
  final void Function(List<FeatureRequest> actions) onSave;

  @override
  _YesodActionConfigurePageState createState() =>
      _YesodActionConfigurePageState();
}

class _YesodActionConfigurePageState extends State<_YesodActionConfigurePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    actions = widget.actions;
    _tabController = TabController(length: actions.length + 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late TabController _tabController;
  late List<FeatureRequest> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑规则'),
        shape: AppBarHelper.defaultShape,
        leading: AppBarHelper.defaultMainLeading(context, onPressed: () {
          Navigator.of(context).pop();
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              widget.onSave(widget.actions);
              Navigator.of(context).pop();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            for (var i = 0; i < actions.length; i++)
              Tab(
                icon: CircleAvatar(
                  child: Text((i + 1).toString()),
                ),
                text: widget.features
                    .firstWhere((element) => element.id == actions[i].id)
                    .name,
              ),
            const Tab(
              icon: Icon(Icons.add),
              text: '添加',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (var i = 0; i < actions.length; i++)
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: i > 0
                            ? () {
                                setState(() {
                                  final temp = actions[i - 1];
                                  actions[i - 1] = actions[i];
                                  actions[i] = temp;
                                });
                                _tabController.animateTo(i - 1);
                              }
                            : null,
                        icon: const Icon(Icons.keyboard_arrow_left),
                        label: const Text('前移'),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              actions.removeAt(i);
                              _tabController = TabController(
                                  length: actions.length + 1, vsync: this);
                            });
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text('删除'),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: i < actions.length - 1
                            ? () {
                                setState(() {
                                  final temp = actions[i + 1];
                                  actions[i + 1] = actions[i];
                                  actions[i] = temp;
                                });
                                _tabController.animateTo(i + 1);
                              }
                            : null,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        label: const Text('后移'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _YesodActionConfigureItem(
                    key: Key(actions[i].toString()),
                    features: widget.features,
                    action: actions[i],
                    onSave: (action) {
                      setState(() {
                        actions[i] = action;
                      });
                    },
                  ),
                ),
              ],
            ),
          _YesodActionConfigureItem(
            features: widget.features,
            action: FeatureRequest(),
            onSave: (action) {
              setState(() {
                actions.add(action);
                _tabController =
                    TabController(length: actions.length + 1, vsync: this);
              });
            },
          ),
        ],
      ),
    );
  }
}

class _YesodActionConfigureItem extends StatefulWidget {
  const _YesodActionConfigureItem({
    super.key,
    required this.features,
    required this.action,
    required this.onSave,
  });

  final List<FeatureFlag> features;
  final FeatureRequest action;
  final void Function(FeatureRequest action) onSave;

  @override
  _YesodActionConfigureItemState createState() =>
      _YesodActionConfigureItemState();
}

class _YesodActionConfigureItemState extends State<_YesodActionConfigureItem> {
  @override
  void initState() {
    super.initState();
    if (widget.action.id.isEmpty) {
      action = FeatureRequest(id: widget.features.first.id);
      allowChangeId = true;
      selectedFeatureIndex = 0;
    } else {
      action = widget.action;
      allowChangeId = false;
      selectedFeatureIndex = widget.features
          .indexWhere((element) => element.id == widget.action.id);
    }
  }

  late bool allowChangeId;
  late FeatureRequest action;
  late int selectedFeatureIndex;
  final JsonFormController _formController = JsonFormController();
  int key = 0;

  @override
  Widget build(BuildContext context) {
    return BootstrapContainer(
      children: [
        BootstrapColumn(
          xxs: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '规则名称',
                  ),
                  value: action.id,
                  onChanged: allowChangeId
                      ? (newValue) {
                          setState(() {
                            action.id = newValue!;
                            selectedFeatureIndex = widget.features.indexWhere(
                                (element) => element.id == newValue);
                          });
                        }
                      : null,
                  items: [
                    for (final feature in widget.features)
                      DropdownMenuItem(
                        value: feature.id,
                        child: Text(feature.name),
                      ),
                  ],
                ),
                Expanded(
                  child: JsonForm(
                    controller: _formController,
                    key: Key((key++).toString()),
                    jsonSchema:
                        widget.features[selectedFeatureIndex].configJsonSchema,
                    jsonData: action.configJson,
                    onFormDataSaved: (data) {
                      setState(() {
                        action.configJson = jsonEncode(data);
                      });
                      widget.onSave(action);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
