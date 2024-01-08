import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';

class NotifyTargetEditPage extends StatelessWidget {
  const NotifyTargetEditPage({super.key});

  void close(BuildContext context) {
    AppRoutes.notifyTargetEdit().pop(context);
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
        final formKey = GlobalKey<FormState>();
        final notifyDestinations = context
                .read<MainBloc>()
                .state
                .serverFeatureSummary
                ?.supportedNotifyDestinations ??
            [];

        final target =
            state.notifyTargetEditIndex != null && state.notifyTargets != null
                ? state.notifyTargets![state.notifyTargetEditIndex!]
                : NotifyTarget();
        var name = target.name;
        var description = target.description;
        var enabled =
            target.status == NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE;
        var destination = target.destination;
        var token = target.token;

        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('Token详情'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(state is NetzachTargetEditState && state.failed
                      ? state.msg ?? ''
                      : ''),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          initialValue: target.id.id.toString(),
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
                        const SizedBox(
                          height: 16,
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
                          onSaved: (newValue) => token = newValue!,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.key),
                            border: OutlineInputBorder(),
                            label: Text('Token'),
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
                        const SizedBox(
                          height: 16,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height:
                              state is NetzachTargetEditState && state.failed
                                  ? 48
                                  : 0,
                          child: state is NetzachTargetEditState && state.failed
                              ? Ink(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius:
                                        BorderRadius.circular(kToolbarHeight),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.msg ?? '未知错误',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
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
                      context.read<NetzachBloc>().add(NetzachTargetEditEvent(
                            NotifyTarget(
                              id: target.id,
                              name: name,
                              description: description,
                              destination: destination,
                              status: enabled
                                  ? NotifyTargetStatus
                                      .NOTIFY_TARGET_STATUS_ACTIVE
                                  : NotifyTargetStatus
                                      .NOTIFY_TARGET_STATUS_SUSPEND,
                              token: token,
                            ),
                          ));
                    }
                  },
                  child: state is NetzachTargetEditState && state.processing
                      ? const CircularProgressIndicator()
                      : const Text('应用更改'),
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
