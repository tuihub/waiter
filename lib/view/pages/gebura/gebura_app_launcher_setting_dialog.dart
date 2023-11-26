import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../model/gebura_model.dart';

class GeburaAppLauncherSettingDialog extends StatelessWidget {
  const GeburaAppLauncherSettingDialog(this.appID, this.setting, {super.key});

  final int appID;
  final AppLauncherSetting? setting;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController pathController = TextEditingController();
    pathController.text = setting?.path ?? '';

    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaSetAppLauncherSettingState && state.success) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text('本地设置'),
          content: SizedBox(
            width: 600,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: pathController,
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context
                      .read<GeburaBloc>()
                      .add(GeburaSetAppLauncherSettingEvent(
                        setting?.copyWith(path: pathController.text) ??
                            AppLauncherSetting(
                              appID: appID,
                              path: pathController.text,
                            ),
                      ));
                }
              },
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
      },
    );
  }
}
