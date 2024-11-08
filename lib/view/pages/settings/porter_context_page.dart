import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonschema_builder/flutter_jsonschema_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../route.dart';
import '../../../repo/grpc/l10n.dart';
import '../../components/form_field.dart';
import '../../components/toast.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/right_panel_form.dart';
import '../../universal/button.dart';
import '../../universal/list_tile.dart';
import '../../universal/universal.dart';
import '../frame_page.dart';

class PorterContextManagePage extends StatelessWidget {
  const PorterContextManagePage({super.key});

  Widget buildPorterGroup(
      BuildContext context, PorterGroup group, List<PorterContext> contexts) {
    final activeCount = contexts
        .where((e) =>
            e.handleStatus ==
            PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_ACTIVE)
        .length;
    final enabledCount = contexts
        .where(
            (e) => e.status == PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE)
        .length;

    void openEditPanel(PorterContext porterContext) {
      SettingsFunctionRoute(
        SettingsFunctions.porterContext,
        action: SettingsActions.porterContextEdit,
        $extra: porterContext,
      ).go(context);
      ModuleFramePage.of(context)?.openDrawer();
    }

    return UniversalExpansionTile(
      title: Text(group.binarySummary.name.isNotEmpty
          ? group.binarySummary.name
          : group.globalName),
      subtitle: Text(S.of(context).pluginWorkingProportion(
            activeCount,
            enabledCount,
            contexts.length,
          )),
      initiallyExpanded: true,
      trailing: OutlinedButton.icon(
        label: Text(S.of(context).add),
        onPressed: () {
          SettingsFunctionRoute(
            SettingsFunctions.porterContext,
            action: SettingsActions.porterContextAdd,
            $extra: group,
          ).go(context);
          ModuleFramePage.of(context)?.openDrawer();
        },
      ),
      children: [
        for (final ctx in contexts)
          UniversalListTile(
            title: Text(ctx.name),
            subtitle: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _porterContextHandleStatusColor(ctx.handleStatus),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                ),
                Text(porterContextHandleStatusString(ctx.handleStatus)),
              ],
            ),
            leading: _porterContextHandleStatusIcon(ctx.handleStatus),
            onTap: () {
              openEditPanel(ctx);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: ctx.status ==
                      PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE,
                  onChanged: (_) {
                    openEditPanel(ctx);
                  },
                ),
                UniversalIconButton(
                  icon: Icon(UniversalUI.of(context).icons.edit),
                  onPressed: () {
                    openEditPanel(ctx);
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipherethBloc, TipherethState>(
      builder: (context, state) {
        final porterGroups = state.porterGroups ?? [];
        final porterContexts = state.porterContexts ?? [];
        return ListManagePage(
          title: S.of(context).pluginContextManage,
          processing:
              state is TipherethLoadPorterContextsState && state.processing,
          msg: state is TipherethLoadPorterContextsState ? state.msg : '',
          onRefresh: () {
            context
                .read<TipherethBloc>()
                .add(TipherethLoadPorterContextsEvent());
          },
          children: [
            for (final group in porterGroups)
              buildPorterGroup(
                context,
                group,
                porterContexts
                    .where((e) => e.globalName == group.globalName)
                    .toList(),
              ),
          ],
        );
      },
    );
  }
}

class PorterContextAddPanel extends StatelessWidget {
  const PorterContextAddPanel({super.key, required this.porterGroup});

  final PorterGroup porterGroup;

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    String region = '';
    String contextJson = '';
    String name = '';
    String description = '';
    PorterContextStatus status =
        PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE;
    final jsonFormController = JsonFormController();
    var buildCounter = 0;

    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethAddPorterContextState && state.success) {
          const Toast(title: '', message: '已添加环境').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          title: Text('添加${porterGroup.binarySummary.name}环境'),
          formFields: [
            Text('插件名称: ${porterGroup.binarySummary.name}'),
            Text('插件介绍: ${porterGroup.binarySummary.description}'),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '区域',
              ),
              onSaved: (newValue) => region = newValue!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
              onSaved: (newValue) => name = newValue!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
              ),
              onSaved: (newValue) => description = newValue!,
            ),
            if (porterGroup.contextJsonSchema.isNotEmpty)
              JsonForm(
                key: ValueKey(buildCounter++),
                controller: jsonFormController,
                jsonSchema: porterGroup.contextJsonSchema,
                jsonData: contextJson,
                onFormDataSaved: (data) {
                  contextJson = jsonEncode(data);
                },
                jsonFormSchemaUiConfig: JsonFormSchemaUiConfig(
                  expandGenesis: true,
                  headerTitleBuilder: (_, __) => Container(),
                  submitButtonBuilder: (_) => Container(),
                ),
              ),
            SwitchFormField(
              initialValue:
                  status == PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE,
              onSaved: (newValue) => status = newValue!
                  ? PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE
                  : PorterContextStatus.PORTER_CONTEXT_STATUS_DISABLED,
              title: const Text('启用'),
            ),
          ],
          errorMsg: state is TipherethAddPorterContextState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            if (jsonFormController.submit()) {
              context.read<TipherethBloc>().add(TipherethAddPorterContextEvent(
                    PorterContext(
                      globalName: porterGroup.globalName,
                      region: region,
                      contextJson: contextJson,
                      name: name,
                      description: description,
                      status: status,
                    ),
                  ));
            }
          },
          submitting:
              state is TipherethAddPorterContextState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class PorterContextEditPanel extends StatelessWidget {
  const PorterContextEditPanel({super.key, required this.porterContext});

  final PorterContext porterContext;

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    String region = porterContext.region;
    String contextJson = porterContext.contextJson;
    String name = porterContext.name;
    String description = porterContext.description;
    PorterContextStatus status = porterContext.status;
    final jsonFormController = JsonFormController();
    var buildCounter = 0;

    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethEditPorterContextState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        final porterGroup = state.porterGroups?.firstWhere(
                (element) => element.globalName == porterContext.globalName) ??
            PorterGroup();
        return RightPanelForm(
          title: const Text('编辑环境'),
          formFields: [
            Text('插件名称: ${porterGroup.binarySummary.name}'),
            Text('插件介绍: ${porterGroup.binarySummary.description}'),
            TextReadOnlyFormField(
              label: S.of(context).id,
              value: porterContext.id.id.toString(),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '区域',
              ),
              initialValue: region,
              onSaved: (newValue) => region = newValue!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
              initialValue: name,
              onSaved: (newValue) => name = newValue!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
              ),
              initialValue: description,
              onSaved: (newValue) => description = newValue!,
            ),
            if (porterGroup.contextJsonSchema.isNotEmpty)
              JsonForm(
                key: ValueKey(buildCounter++),
                controller: jsonFormController,
                jsonSchema: porterGroup.contextJsonSchema,
                jsonData: contextJson,
                onFormDataSaved: (data) {
                  contextJson = jsonEncode(data);
                },
                jsonFormSchemaUiConfig: JsonFormSchemaUiConfig(
                  expandGenesis: true,
                  headerTitleBuilder: (_, __) => Container(),
                  submitButtonBuilder: (_) => Container(),
                ),
              ),
            SwitchFormField(
              initialValue:
                  status == PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE,
              onSaved: (newValue) => status = newValue!
                  ? PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE
                  : PorterContextStatus.PORTER_CONTEXT_STATUS_DISABLED,
              title: const Text('启用'),
            ),
          ],
          errorMsg: state is TipherethEditPorterState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            if (jsonFormController.submit()) {
              context
                  .read<TipherethBloc>()
                  .add(TipherethEditPorterContextEvent(PorterContext(
                    id: porterContext.id,
                    globalName: porterContext.globalName,
                    region: region,
                    contextJson: contextJson,
                    name: name,
                    description: description,
                    status: status,
                  )));
            }
          },
          submitting: state is TipherethEditPorterState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

Color _porterContextHandleStatusColor(PorterContextHandleStatus status) {
  switch (status) {
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_UNSPECIFIED:
      return Colors.grey;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_QUEUEING:
      return Colors.green;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_DOWNGRADED:
      return Colors.yellow;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_ACTIVE:
      return Colors.blue;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_BLOCKED:
      return Colors.red;
  }
  return Colors.grey;
}

Widget _porterContextHandleStatusIcon(PorterContextHandleStatus status) {
  switch (status) {
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_UNSPECIFIED:
      return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_QUEUEING:
      return Icon(const FaIcon(FontAwesomeIcons.plugCirclePlus).icon);
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_BLOCKED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleXmark).icon);
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_ACTIVE:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleCheck).icon);
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_DOWNGRADED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleExclamation).icon);
  }
  return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
}
