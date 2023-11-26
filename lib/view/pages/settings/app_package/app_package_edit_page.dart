import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../repo/grpc/api_mixins.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import 'app_package_assign_dialog.dart';

class AppPackageEditPage extends StatefulWidget {
  const AppPackageEditPage({super.key, required this.appPackage});

  final AppPackage appPackage;

  @override
  State<AppPackageEditPage> createState() => _AppPackageEditPageState();
}

class _AppPackageEditPageState extends State<AppPackageEditPage>
    with SingleRequestMixin<AppPackageEditPage, UpdateAppPackageResponse> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String description;

  @override
  void initState() {
    super.initState();
    name = widget.appPackage.name;
    description = widget.appPackage.description;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      unawaited(doRequest(
        request: (client, option) {
          return client.updateAppPackage(
            UpdateAppPackageRequest(
              appPackage: AppPackage(
                id: widget.appPackage.id,
                source: widget.appPackage.source,
                name: name,
                description: description,
              ),
            ),
            options: option,
          );
        },
      ).then((value) {
        if (isSuccess) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      }));
    }
  }

  void close(BuildContext context) {
    AppRoutes.settingsAppPackageEdit().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return RightPanelForm(
      title: const Text('应用包详情'),
      form: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ID: ${widget.appPackage.id.id.toHexString()}'),
            Text('Source: ${appPackageSourceString(widget.appPackage.source)}'),
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
          child:
              loading ? const CircularProgressIndicator() : const Text('应用更改'),
        ),
        ElevatedButton(
          onPressed: () => close(context),
          child: const Text('取消'),
        )
      ],
    );
  }
}
