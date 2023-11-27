import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class AppPackageAddPage extends StatelessWidget {
  const AppPackageAddPage({super.key});

  void close(BuildContext context) {
    AppRoutes.settingsAppPackageAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    late String name;
    late String description;

    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaAddAppPackageState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('添加应用包'),
        form: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onSaved: (newValue) => name = newValue!,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
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
                onSaved: (newValue) => description = newValue!,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '描述',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height:
                    state is GeburaAddAppPackageState && state.failed ? 48 : 0,
                child: state is GeburaAddAppPackageState && state.failed
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
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<GeburaBloc>().add(GeburaAddAppPackageEvent(
                      AppPackage(
                        name: name,
                        description: description,
                      ),
                    ));
              }
            },
            child: state is GeburaAddAppPackageState && state.processing
                ? const CircularProgressIndicator()
                : const Text('确定'),
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
