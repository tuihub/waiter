import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';
import '../../../specialized/right_panel_form.dart';

class PorterEditPanel extends StatelessWidget {
  const PorterEditPanel({super.key});

  void close(BuildContext context) {
    AppRoutes.settingsPorterEdit().pop(context);
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
                ? state.porters![state.selectedPorterEditIndex!]
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: porter.name,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: porter.version,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('版本'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: porter.globalName,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '全局名称',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: porter.featureSummary,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('支持功能'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchFormField(
              initialValue: enabled,
              onSaved: (newValue) => enabled = newValue!,
              title: const Text('启用'),
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
