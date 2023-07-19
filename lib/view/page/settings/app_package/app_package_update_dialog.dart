import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/common/const/gebura.dart';
import 'package:waitress/view/page/settings/app_package/app_package_assign_dialog.dart';

class AppPackageUpdateDialog extends StatefulWidget {
  final void Function() callback;
  final AppPackage appPackage;

  const AppPackageUpdateDialog(
      {super.key, required this.appPackage, required this.callback});
  @override
  State<AppPackageUpdateDialog> createState() => _AppPackageUpdateDialogState();
}

class _AppPackageUpdateDialogState extends State<AppPackageUpdateDialog>
    with SingleRequestMixin<AppPackageUpdateDialog, UpdateAppPackageResponse> {
  @override
  void initState() {
    super.initState();
    name = widget.appPackage.name;
    description = widget.appPackage.description;
  }

  final _formKey = GlobalKey<FormState>();

  late String name;
  late String description;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
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
        widget.callback();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('应用包详情'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID: ${widget.appPackage.id.id.toHexString()}'),
              Text(
                  'Source: ${appPackageSourceString(widget.appPackage.source)}'),
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
                // The validator receives the text that the user has entered.
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
                            Text(response.error ?? "未知错误"),
                          ],
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
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AppPackageAssignDialog(
                callback: () {
                  widget.callback();
                },
                appPackage: widget.appPackage,
              ),
            );
          },
          child: const Text('绑定应用包'),
        ),
        Expanded(child: SizedBox()),
        TextButton(
          onPressed: submit,
          child:
              loading ? const CircularProgressIndicator() : const Text('应用更改'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('取消'),
        )
      ],
    );
  }
}
