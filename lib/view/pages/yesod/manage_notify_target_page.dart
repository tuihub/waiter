import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonschema_builder/flutter_jsonschema_builder.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/netzach/netzach_bloc.dart';
import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../repo/grpc/l10n.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../form/form_field.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class NotifyTargetPage extends StatelessWidget {
  const NotifyTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetzachBloc, NetzachState>(builder: (context, state) {
      final listData = state.notifyTargets ?? [];
      return ListManagePage(
        title: S.of(context).notifyTargetManage,
        processing: state is NetzachTargetLoadState && state.processing,
        msg: state is NetzachTargetLoadState && state.failed ? state.msg : '',
        onRefresh: () {
          context.read<NetzachBloc>().add(NetzachTargetLoadEvent());
        },
        onAdd: () {
          const YesodFunctionRoute(YesodFunctions.notifyTargetManage,
                  action: YesodActions.notifyTargetAdd)
              .go(context);
          FramePage.of(context)?.openDrawer();
        },
        children: [
          for (final item in listData)
            ListTile(
              title: Text(item.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.description),
                  Text('状态: ${notifyTargetStatusString(item.status)}'),
                ],
              ),
              onTap: () {
                YesodFunctionRoute(YesodFunctions.notifyTargetManage,
                        action: YesodActions.notifyTargetEdit,
                        $extra: listData.indexOf(item))
                    .go(context);
                FramePage.of(context)?.openDrawer();
              },
              trailing: const Icon(Icons.edit),
            ),
        ],
      );
    });
  }
}

class NotifyTargetAddPanel extends StatelessWidget {
  const NotifyTargetAddPanel({super.key});

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final notifyDestinations = context
            .read<MainBloc>()
            .state
            .serverFeatureSummary
            ?.notifyDestinations ??
        [];
    var name = '';
    var description = '';
    FeatureRequest destination = FeatureRequest();
    var enabled = true;
    final jsonFormController = JsonFormController();

    return BlocConsumer<NetzachBloc, NetzachState>(
      listener: (context, state) {
        if (state is NetzachTargetAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          title: Text(S.of(context).notifyTargetAdd),
          formFields: [
            TextFormField(
              onChanged: (newValue) => name = newValue,
              decoration: const InputDecoration(
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
            TextFormField(
              onChanged: (newValue) => description = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '备注',
              ),
            ),
            FeatureRequestFormField(
              featureFlags: notifyDestinations,
              jsonFormController: jsonFormController,
              onChanged: (v) => destination = v,
              getFeatureProvider: context
                  .read<TipherethBloc>()
                  .state
                  .getNotifyDestinationProvider,
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
            if (jsonFormController.submit()) {
              context
                  .read<NetzachBloc>()
                  .add(NetzachTargetAddEvent(NotifyTarget(
                    name: name,
                    description: description,
                    destination: destination,
                    status: enabled
                        ? NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE
                        : NotifyTargetStatus.NOTIFY_TARGET_STATUS_SUSPEND,
                  )));
            }
          },
          submitting: state is NetzachTargetAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class NotifyTargetEditPanel extends StatelessWidget {
  const NotifyTargetEditPanel({super.key, required this.index});

  final int? index;

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final notifyDestinations = context
            .read<MainBloc>()
            .state
            .serverFeatureSummary
            ?.notifyDestinations ??
        [];
    return BlocConsumer<NetzachBloc, NetzachState>(
      listener: (context, state) {
        if (state is NetzachTargetEditState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        final target = index != null && state.notifyTargets != null
            ? state.notifyTargets![index!]
            : NotifyTarget();
        var name = target.name;
        var description = target.description;
        var destination = target.destination;
        var enabled =
            target.status == NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE;
        final configJson = target.destination.configJson;
        final jsonFormController = JsonFormController();

        return RightPanelForm(
          title: Text(S.of(context).notifyTargetEdit),
          formFields: [
            TextReadOnlyFormField(
              label: S.of(context).id,
              value: target.id.id.toString(),
            ),
            TextFormField(
              initialValue: name,
              onSaved: (newValue) => name = newValue!,
              decoration: const InputDecoration(
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
                border: OutlineInputBorder(),
                label: Text('备注'),
              ),
            ),
            FeatureRequestFormField(
              featureFlags: notifyDestinations,
              jsonFormController: jsonFormController,
              onChanged: (v) => destination = v,
              getFeatureProvider: context
                  .read<TipherethBloc>()
                  .state
                  .getNotifyDestinationProvider,
              initialValue: destination,
              flagReadOnly: true,
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
            if (jsonFormController.submit()) {
              context.read<NetzachBloc>().add(NetzachTargetEditEvent(
                    NotifyTarget(
                      id: target.id,
                      name: name,
                      description: description,
                      destination: destination,
                      status: enabled
                          ? NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE
                          : NotifyTargetStatus.NOTIFY_TARGET_STATUS_SUSPEND,
                    ),
                  ));
            }
          },
          submitting: state is NetzachTargetEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
