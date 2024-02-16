import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import 'app_package_assign_dialog.dart';

class AppPackageEditPage extends StatefulWidget {
  const AppPackageEditPage({super.key, required this.appPackage});

  final App appPackage;

  @override
  State<AppPackageEditPage> createState() => _AppPackageEditPageState();
}

class _AppPackageEditPageState extends State<AppPackageEditPage> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String description;

  @override
  void initState() {
    super.initState();
    name = widget.appPackage.name;
    description = widget.appPackage.description;
  }

  void close(BuildContext context) {
    AppRoutes.settingsAppPackageEdit().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaEditAppPackageState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('应用包详情'),
        form: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID: ${widget.appPackage.id.id.toHexString()}'),
              const SizedBox(
                height: 16,
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
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: description,
                onSaved: (newValue) => description = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '描述',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  unawaited(showDialog<void>(
                    context: context,
                    builder: (context) => AppPackageAssignDialog(
                      callback: () {},
                      appPackage: widget.appPackage,
                    ),
                  ));
                },
                child: const Text('绑定应用包'),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height:
                    state is GeburaEditAppPackageState && state.failed ? 48 : 0,
                child: state is GeburaEditAppPackageState && state.failed
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
        actions: [
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<GeburaBloc>().add(GeburaEditAppEvent(
                      App(
                        id: widget.appPackage.id,
                        name: name,
                        description: description,
                      ),
                    ));
              }
            },
            child: state is GeburaEditAppPackageState && state.processing
                ? const CircularProgressIndicator()
                : const Text('应用更改'),
          ),
          ElevatedButton(
            onPressed: () => close(context),
            child: const Text('取消'),
          )
        ],
      );
    });
  }
}
