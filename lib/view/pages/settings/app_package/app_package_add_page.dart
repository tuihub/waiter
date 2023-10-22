import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../common/api/api_mixins.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class AppPackageAddPage extends StatefulWidget {
  const AppPackageAddPage({super.key});

  @override
  State<AppPackageAddPage> createState() => _AppPackageAddPageState();
}

class _AppPackageAddPageState extends State<AppPackageAddPage>
    with SingleRequestMixin<AppPackageAddPage, CreateAppPackageResponse> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String description;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      unawaited(doRequest(
        request: (client, option) {
          return client.createAppPackage(
            CreateAppPackageRequest(
              appPackage: AppPackage(
                name: name,
                description: description,
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
    AppRoutes.settingsAppPackageAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return RightPanelForm(
      title: const Text('添加应用包'),
      form: Form(
        key: _formKey,
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
