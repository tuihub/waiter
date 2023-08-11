import 'dart:async';

import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../model/gebura_model.dart';
import '../../../repo/gebura/gebura_repo.dart';

class GeburaAppLauncherSettingDialog extends StatefulWidget {
  final int appID;

  const GeburaAppLauncherSettingDialog({super.key, required this.appID});
  @override
  State<GeburaAppLauncherSettingDialog> createState() =>
      _GeburaAppLauncherSettingDialogState();
}

class _GeburaAppLauncherSettingDialogState
    extends State<GeburaAppLauncherSettingDialog> {
  @override
  void initState() {
    super.initState();
    unawaited(load());
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    unawaited(GetIt.I<GeburaRepo>()
        .saveLauncherSetting(AppLauncherSetting(
      appID: widget.appID,
      path: path,
    ))
        .then((value) {
      Navigator.of(context).pop();
    }));
  }

  Future<void> load() async {
    final setting =
        await GetIt.I<GeburaRepo>().getLauncherSetting(widget.appID);
    if (setting != null) {
      pathController.text = setting.path;
    }
  }

  final _formKey = GlobalKey<FormState>();

  late String path;
  final TextEditingController pathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('本地设置'),
      content: SizedBox(
        width: 600,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: pathController,
                onSaved: (newValue) => path = newValue!,
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () async {
                      final pickResult =
                          await file_picker.FilePicker.platform.pickFiles();
                      if (pickResult != null) {
                        pathController.text = pickResult.paths.first!;
                      }
                    },
                    child: const Text('选择'),
                  ),
                  border: const OutlineInputBorder(),
                  labelText: '应用路径',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: submit,
          child: const Text('确定'),
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
