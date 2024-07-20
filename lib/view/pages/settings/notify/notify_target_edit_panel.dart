import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';
import '../../../specialized/right_panel_form.dart';
import '../../frame_page.dart';

class NotifyTargetEditPanel extends StatelessWidget {
  const NotifyTargetEditPanel({super.key});

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetzachBloc, NetzachState>(
      listener: (context, state) {
        if (state is NetzachTargetEditState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      buildWhen: (previous, current) =>
          previous.notifyTargetEditIndex != current.notifyTargetEditIndex,
      builder: (context, state) {
        final notifyDestinations = context
                .read<MainBloc>()
                .state
                .serverFeatureSummary
                ?.notifyDestinations ??
            [];

        final target =
            state.notifyTargetEditIndex != null && state.notifyTargets != null
                ? state.notifyTargets![state.notifyTargetEditIndex!]
                : NotifyTarget();
        var name = target.name;
        var description = target.description;
        var enabled =
            target.status == NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE;
        final destination = target.destination;

        return RightPanelForm(
          title: const Text('Token详情'),
          formFields: [
            TextFormField(
              initialValue: target.id.id.toString(),
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
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
            TextFormField(
              initialValue: description,
              onSaved: (newValue) => description = newValue!,
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                border: OutlineInputBorder(),
                label: Text('备注'),
              ),
            ),
            SwitchFormField(
              initialValue: enabled,
              onSaved: (newValue) => enabled = newValue!,
              title: const Text('启用'),
            ),
          ],
          errorMsg: state is NetzachTargetEditState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context.read<NetzachBloc>().add(NetzachTargetEditEvent(
                  NotifyTarget(
                    id: target.id,
                    name: name,
                    description: description,
                    destination: FeatureRequest(
                      id: destination.id,
                    ),
                    status: enabled
                        ? NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE
                        : NotifyTargetStatus.NOTIFY_TARGET_STATUS_SUSPEND,
                  ),
                ));
          },
          submitting: state is NetzachTargetEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
