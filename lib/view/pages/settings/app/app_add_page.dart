import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../common/api/api_mixins.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class AppAddPage extends StatefulWidget {
  const AppAddPage({super.key});

  @override
  State<AppAddPage> createState() => _AppAddPageState();
}

class _AppAddPageState extends State<AppAddPage>
    with SingleRequestMixin<AppAddPage, CreateAppResponse> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String iconImageUrl;
  late String heroImageUrl;
  late String shortDescription;
  AppType appType = AppType.APP_TYPE_GAME;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      unawaited(doRequest(
        request: (client, option) {
          return client.createApp(
            CreateAppRequest(
              app: App(
                name: name,
                type: appType,
                shortDescription: shortDescription,
                iconImageUrl: iconImageUrl,
                heroImageUrl: heroImageUrl,
              ),
            ),
            options: option,
          );
        },
      ).then((value) {
        if (isSuccess) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      }));
    }
  }

  void close(BuildContext context) {
    AppRoutes.settingsAppAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return RightPanelForm(
      title: const Text('添加应用'),
      form: Form(
        key: _formKey,
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
              height: isError && !loading ? 48 : 0,
              child: isError && !loading
                  ? Ink(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(kToolbarHeight),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(response.error ?? '未知错误'),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: submit,
          child: loading ? const CircularProgressIndicator() : const Text('确定'),
        ),
        ElevatedButton(
          onPressed: () => close(context),
          child: const Text('取消'),
        )
      ],
    );
  }
}
