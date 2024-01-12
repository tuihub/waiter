import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';

class SessionEditPage extends StatelessWidget {
  const SessionEditPage({super.key});

  void close(BuildContext context) {
    AppRoutes.settingsSessionEdit().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethEditSessionState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      buildWhen: (previous, current) =>
          previous.selectedSessionEditIndex != current.selectedSessionEditIndex,
      builder: (context, state) {
        final formKey = GlobalKey<FormState>();
        final session =
            state.sessions != null && state.selectedSessionEditIndex != null
                ? state.sessions![state.selectedSessionEditIndex!]
                : UserSession();

        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('设备详情'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(state is TipherethEditSessionState && state.failed
                      ? state.msg ?? ''
                      : ''),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          initialValue: session.id.id.toString(),
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
                          initialValue: '${session.deviceInfo.deviceModel} ',
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '设备名',
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          initialValue: '${session.deviceInfo.systemVersion} ',
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('操作系统'),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          initialValue:
                              '${session.deviceInfo.clientName} ${session.deviceInfo.clientVersion}',
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '客户端',
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          initialValue: session.createTime
                              .toDateTime(toLocal: true)
                              .toIso8601String(),
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('最后登录'),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height:
                              state is TipherethEditSessionState && state.failed
                                  ? 48
                                  : 0,
                          child: state is TipherethEditSessionState &&
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
                          .add(TipherethEditSessionEvent(
                            session.id,
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: state is TipherethEditSessionState && state.processing
                      ? const CircularProgressIndicator()
                      : const Text(
                          '注销该设备',
                          style: TextStyle(color: Colors.white),
                        ),
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
