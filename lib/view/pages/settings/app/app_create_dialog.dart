import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import '../../../../common/api/api_mixins.dart';

class AppCreateDialog extends StatefulWidget {
  final void Function() callback;

  const AppCreateDialog({super.key, required this.callback});
  @override
  State<AppCreateDialog> createState() => _AppCreateDialogState();
}

class _AppCreateDialogState extends State<AppCreateDialog>
    with SingleRequestMixin<AppCreateDialog, CreateAppResponse> {
  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
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
        widget.callback();
        Navigator.of(context).pop();
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  late String name;
  late String iconImageUrl;
  late String heroImageUrl;
  late String shortDescription;
  AppType appType = AppType.APP_TYPE_GAME;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加应用'),
      content: SizedBox(
        width: 600,
        child: Form(
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
      ),
      actions: <Widget>[
        TextButton(
          onPressed: submit,
          child: loading ? const CircularProgressIndicator() : const Text('确定'),
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
