import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../form/form_field.dart';

class PorterEditPage extends StatelessWidget {
  const PorterEditPage({super.key});

  void close(BuildContext context) {
    AppRoutes.notifyTargetEdit().pop(context);
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
        final formKey = GlobalKey<FormState>();
        final porter =
            state.porters != null && state.selectedPorterEditIndex != null
                ? state.porters![state.selectedPorterEditIndex!]
                : Porter();

        var enabled = porter.status == UserStatus.USER_STATUS_ACTIVE;

        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('插件详情'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(state is TipherethEditPorterState && state.failed
                      ? state.msg ?? ''
                      : ''),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
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
                        const SizedBox(
                          height: 16,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height:
                              state is TipherethEditPorterState && state.failed
                                  ? 48
                                  : 0,
                          child: state is TipherethEditPorterState &&
                                  state.failed
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
                      context
                          .read<TipherethBloc>()
                          .add(TipherethEditPorterEvent(
                            porter.id,
                            enabled
                                ? UserStatus.USER_STATUS_ACTIVE
                                : UserStatus.USER_STATUS_BLOCKED,
                          ));
                    }
                  },
                  child: state is TipherethEditPorterState && state.processing
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
