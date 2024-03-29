import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';
import '../../../specialized/right_panel_form.dart';

class NotifyTargetAddPanel extends StatelessWidget {
  const NotifyTargetAddPanel({super.key});

  void close(BuildContext context) {
    AppRoutes.notifyTargetAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final notifyDestinations = context
            .read<MainBloc>()
            .state
            .serverFeatureSummary
            ?.supportedNotifyDestinations ??
        [];
    var name = '';
    var description = '';
    var destination =
        notifyDestinations.isNotEmpty ? notifyDestinations.first : '';
    var enabled = true;
    var token = '';

    return BlocConsumer<NetzachBloc, NetzachState>(
      listener: (context, state) {
        if (state is NetzachTargetAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          title: const Text('添加Token'),
          formFields: [
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
            DropdownButtonFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.place),
                border: const OutlineInputBorder(),
                labelText: S.of(context).NOTIFY_TARGET_TYPE,
              ),
              value: destination,
              items: [
                for (final dest in notifyDestinations)
                  DropdownMenuItem(
                    value: dest,
                    child: Text(dest),
                  ),
              ],
              onChanged: (newValue) => destination = newValue!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请选择类型';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (newValue) => token = newValue,
              decoration: const InputDecoration(
                icon: Icon(Icons.key),
                border: OutlineInputBorder(),
                labelText: 'Token',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入Token';
                }
                return null;
              },
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
          errorMsg:
              state is NetzachTargetAddState && state.failed ? state.msg : null,
          onSubmit: () {
            context.read<NetzachBloc>().add(NetzachTargetAddEvent(NotifyTarget(
                  name: name,
                  description: description,
                  destination: destination,
                  status: enabled
                      ? NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE
                      : NotifyTargetStatus.NOTIFY_TARGET_STATUS_SUSPEND,
                  token: token,
                )));
          },
          submitting: state is NetzachTargetAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
