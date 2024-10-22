import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../components/form_field.dart';
import '../../../components/toast.dart';
import '../../../layout/card_list_page.dart';
import '../../../specialized/right_panel_form.dart';
import '../../../universal/list.dart';
import '../../frame_page.dart';

class PorterManagePage extends StatelessWidget {
  const PorterManagePage({super.key});

  Widget buildPorterGroup(BuildContext context, List<Porter> porters) {
    final activeCount = porters
        .where((e) =>
            e.connectionStatus ==
            PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVE)
        .length;
    final enabledCount =
        porters.where((e) => e.status == UserStatus.USER_STATUS_ACTIVE).length;
    void openEditPanel(int index) {
      context
          .read<TipherethBloc>()
          .add(TipherethSetPorterEditIndexEvent(index));
      const SettingsFunctionRoute(SettingsFunctions.porter,
              action: SettingsActions.porterEdit)
          .go(context);
      ModuleFramePage.of(context)?.openDrawer();
    }

    return UniversalExpansionTile(
      title: Text(porters.firstOrNull?.binarySummary.name ?? ''),
      subtitle: Text(S
          .of(context)
          .pluginWorkingProportion(activeCount, enabledCount, porters.length)),
      initiallyExpanded: true,
      children: [
        for (final porter in porters)
          UniversalListTile(
            title: Text(porter.binarySummary.name),
            subtitle: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _porterConnectionStatusColor(porter.connectionStatus),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                ),
                Text(porterConnectionStatusString(porter.connectionStatus)),
              ],
            ),
            leading: _porterConnectionStatusIcon(porter.connectionStatus),
            onTap: () {
              openEditPanel(porter.id.id.toInt());
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: porter.status == UserStatus.USER_STATUS_ACTIVE,
                  onChanged: (_) {
                    openEditPanel(porter.id.id.toInt());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    openEditPanel(porter.id.id.toInt());
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
        final porters = state.porters ?? [];
        final porterGroup = <String, List<Porter>>{};
        for (final porter in porters) {
          if (porterGroup.containsKey(porter.globalName)) {
            porterGroup[porter.globalName]!.add(porter);
          } else {
            porterGroup[porter.globalName] = [porter];
          }
        }
        return ListManagePage(
          title: S.of(context).pluginManage,
          processing: state is TipherethLoadPortersState && state.processing,
          msg: state is TipherethLoadPortersState ? state.msg : '',
          onRefresh: () {
            context.read<TipherethBloc>().add(TipherethLoadPortersEvent());
          },
          children: [
            for (final value in porterGroup.values)
              buildPorterGroup(context, value),
          ],
        );
      },
    );
  }
}

class PorterEditPanel extends StatelessWidget {
  const PorterEditPanel({super.key});

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethEditPorterState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      buildWhen: (previous, current) =>
          previous.selectedPorterEditIndex != current.selectedPorterEditIndex,
      builder: (context, state) {
        final porter =
            state.porters != null && state.selectedPorterEditIndex != null
                ? state.porters!.firstWhere(
                    (e) => e.id.id == state.selectedPorterEditIndex,
                    orElse: Porter.new)
                : Porter();

        var enabled = porter.status == UserStatus.USER_STATUS_ACTIVE;

        return RightPanelForm(
          title: const Text('插件详情'),
          formFields: [
            TextFormField(
              initialValue: porter.id.id.toString(),
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
            ),
            TextFormField(
              initialValue: porter.binarySummary.name,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            TextFormField(
              initialValue: porter.binarySummary.version,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('版本'),
              ),
            ),
            TextFormField(
              initialValue: porter.globalName,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '全局名称',
              ),
            ),
            SwitchFormField(
              initialValue: enabled,
              onSaved: (newValue) => enabled = newValue!,
              title: const Text('启用'),
            ),
            TextFormMessage(
              title: '支持功能',
              message: porter.featureSummary.toString(),
            ),
          ],
          errorMsg: state is TipherethEditPorterState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context.read<TipherethBloc>().add(TipherethEditPorterEvent(
                  porter.id,
                  enabled
                      ? UserStatus.USER_STATUS_ACTIVE
                      : UserStatus.USER_STATUS_BLOCKED,
                ));
          },
          submitting: state is TipherethEditPorterState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

Color _porterConnectionStatusColor(PorterConnectionStatus status) {
  switch (status) {
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_UNSPECIFIED:
      return Colors.grey;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_CONNECTED:
      return Colors.green;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DISCONNECTED:
      return Colors.yellow;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVE:
      return Colors.blue;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVATION_FAILED:
      return Colors.red;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DOWNGRADED:
      return Colors.orange;
  }
  return Colors.grey;
}

Widget _porterConnectionStatusIcon(PorterConnectionStatus status) {
  switch (status) {
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_UNSPECIFIED:
      return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_CONNECTED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCirclePlus).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DISCONNECTED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleXmark).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVE:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleCheck).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVATION_FAILED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleExclamation).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DOWNGRADED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleMinus).icon);
  }
  return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
}
