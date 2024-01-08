import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../helper/duration_format.dart';

class LinkAccountDialog extends StatelessWidget {
  const LinkAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final platforms = context
            .read<MainBloc>()
            .state
            .serverFeatureSummary
            ?.supportedAccountPlatforms ??
        [];

    String platform = platforms.isNotEmpty ? platforms.first : '';
    late String platformAccountID;

    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethLinkAccountState && state.success) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return AlertDialog(
        title: const Text('添加绑定'),
        content: SizedBox(
          width: 600,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.place),
                    border: OutlineInputBorder(),
                    labelText: '平台',
                  ),
                  value: platform,
                  items: [
                    for (final p in platforms)
                      DropdownMenuItem(
                        value: p,
                        child: Text(p),
                      ),
                  ],
                  onChanged: (newValue) => platform = newValue!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请选择平台';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onSaved: (newValue) => platformAccountID = newValue!,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: 'ID',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: state is TipherethLinkAccountState && state.failed
                      ? 48
                      : 0,
                  child: state is TipherethLinkAccountState && state.failed
                      ? Ink(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(kToolbarHeight),
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
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<TipherethBloc>().add(
                    TipherethLinkAccountEvent(platform, platformAccountID));
              }
            },
            child: state is TipherethLinkAccountState && state.processing
                ? const CircularProgressIndicator()
                : const Text('确定'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); //close Dialog
            },
            child: const Text('取消'),
          )
        ],
      );
    });
  }
}

class UnLinkAccountDialog extends StatelessWidget {
  const UnLinkAccountDialog({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethUnLinkAccountState && state.success) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return AlertDialog(
        title: const Text('账户详情'),
        content: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
                initialValue: account.platformAccountId,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '平台',
                ),
                initialValue: account.platform,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '用户名',
                ),
                initialValue: account.name,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '上次更新时间',
                ),
                initialValue: DurationHelper.recentString(
                    account.latestUpdateTime.toDateTime()),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state is TipherethUnLinkAccountState && state.failed
                    ? 48
                    : 0,
                child: state is TipherethUnLinkAccountState && state.failed
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
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
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read<TipherethBloc>().add(TipherethUnLinkAccountEvent(
                    account.platform,
                    account.platformAccountId,
                  ));
            },
            child: state is TipherethUnLinkAccountState && state.processing
                ? const CircularProgressIndicator()
                : const Text('解绑'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); //close Dialog
            },
            child: const Text('关闭'),
          )
        ],
      );
    });
  }
}
