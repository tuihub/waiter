import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class AppAddPage extends StatelessWidget {
  const AppAddPage({super.key});

  void close(BuildContext context) {
    AppRoutes.settingsAppAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String name = '';
    String iconImageUrl = '';
    String heroImageUrl = '';
    String shortDescription = '';
    const appType = AppType.APP_TYPE_GAME;

    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaAddAppState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('添加应用'),
        form: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
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
                onSaved: (newValue) => shortDescription = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '描述',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: (newValue) => iconImageUrl = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '图标链接',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: (newValue) => heroImageUrl = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '图片链接',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state is GeburaAddAppState && state.failed ? 48 : 0,
                child: state is GeburaAddAppState && state.failed
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
                context.read<GeburaBloc>().add(GeburaAddAppEvent(
                      App(
                        name: name,
                        type: appType,
                        shortDescription: shortDescription,
                        iconImageUrl: iconImageUrl,
                        heroImageUrl: heroImageUrl,
                      ),
                    ));
              }
            },
            child: state is GeburaAddAppState && state.processing
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
