import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/common/const/gebura.dart';

class AppUpdateDialog extends StatefulWidget {
  final void Function() callback;
  final App app;

  const AppUpdateDialog({super.key, required this.app, required this.callback});
  @override
  State<AppUpdateDialog> createState() => _AppUpdateDialogState();
}

class _AppUpdateDialogState extends State<AppUpdateDialog>
    with SingleRequestMixin<AppUpdateDialog, UpdateAppResponse> {
  @override
  void initState() {
    super.initState();
    name = widget.app.name;
    appType = widget.app.type;
    shortDescription = widget.app.shortDescription;
    iconImageUrl = widget.app.iconImageUrl;
    heroImageUrl = widget.app.heroImageUrl;
    readOnly = widget.app.source != AppSource.APP_SOURCE_INTERNAL;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
        request: (client, option) {
          return client.updateApp(
            UpdateAppRequest(
              app: App(
                id: widget.app.id,
                source: widget.app.source,
                sourceAppId: widget.app.sourceAppId,
                sourceUrl: widget.app.sourceUrl,
                name: name,
                type: widget.app.type,
                shortDescription: shortDescription,
                iconImageUrl: iconImageUrl,
                heroImageUrl: heroImageUrl,
                details: widget.app.details,
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
  late bool readOnly;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('应用详情'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID: ${widget.app.id.id.toHexString()}'),
              Text('Source: ${appSourceString(widget.app.source)}'),
              Text('SourceUrl: ${widget.app.sourceUrl}'),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: name,
                readOnly: readOnly,
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
                initialValue: shortDescription,
                readOnly: readOnly,
                onSaved: (newValue) => shortDescription = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '描述',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: iconImageUrl,
                readOnly: readOnly,
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
                initialValue: heroImageUrl,
                readOnly: readOnly,
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
        !readOnly
            ? TextButton(
                onPressed: submit,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('应用更改'),
              )
            : Text('数据来自${appSourceString(widget.app.source)}，无法修改'),
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
