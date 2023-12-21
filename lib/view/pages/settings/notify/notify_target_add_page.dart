import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';

import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';

class NotifyTargetAddPage extends StatelessWidget {
  const NotifyTargetAddPage({super.key});

  void close(BuildContext context) {
    AppRoutes.notifyTargetAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var name = '';
    var description = '';
    var type = NotifyTargetType.NOTIFY_TARGET_TYPE_TELEGRAM;
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
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('添加Token'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
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
                          value: type,
                          items: [
                            DropdownMenuItem(
                              value:
                                  NotifyTargetType.NOTIFY_TARGET_TYPE_TELEGRAM,
                              child: Text(
                                  S.of(context).NOTIFY_TARGET_TYPE_TELEGRAM),
                            ),
                          ],
                          onChanged: (newValue) => type = newValue!,
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
                        const SizedBox(
                          height: 16,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: state is NetzachTargetAddState && state.failed
                              ? 48
                              : 0,
                          child: state is NetzachTargetAddState && state.failed
                              ? Ink(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
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
                        const SizedBox(
                          height: 32,
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
                      context
                          .read<NetzachBloc>()
                          .add(NetzachTargetAddEvent(NotifyTarget(
                            name: name,
                            description: description,
                            type: type,
                            status: enabled
                                ? NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE
                                : NotifyTargetStatus
                                    .NOTIFY_TARGET_STATUS_SUSPEND,
                            token: token,
                          )));
                    }
                  },
                  child: state is NetzachTargetAddState && state.processing
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
