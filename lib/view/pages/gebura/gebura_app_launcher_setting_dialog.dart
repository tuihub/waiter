import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../model/gebura_model.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';

class GeburaAppLauncherSettingDialog extends StatelessWidget {
  const GeburaAppLauncherSettingDialog(this.appID, this.setting, {super.key});

  final int appID;
  final AppLauncherSetting? setting;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController pathController = TextEditingController();
    pathController.text = setting?.path ?? '';
    final TextEditingController installPathController = TextEditingController();
    installPathController.text = setting?.installPath ?? '';
    bool advancedTracing = setting?.advancedTracing ?? false;
    String processName = setting?.processName ?? '';
    final TextEditingController realPathController = TextEditingController();
    realPathController.text = setting?.realPath ?? '';
    int sleepTime = setting?.sleepTime ?? 10;

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
                      labelText: '应用启动路径',
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: installPathController,
                    decoration: InputDecoration(
                      suffixIcon: TextButton(
                        onPressed: () async {
                          final pickResult = await file_picker
                              .FilePicker.platform
                              .getDirectoryPath();
                          if (pickResult != null) {
                            installPathController.text = pickResult;
                          }
                        },
                        child: const Text('选择'),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: '应用安装路径',
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SwitchFormField(
                    onSaved: (newValue) => advancedTracing = newValue ?? false,
                    title: const Text('高级模式'),
                    initialValue: advancedTracing,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: processName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '进程名',
                    ),
                    onSaved: (newValue) => processName = newValue ?? '',
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: realPathController,
                    decoration: InputDecoration(
                      suffixIcon: TextButton(
                        onPressed: () async {
                          final pickResult =
                              await file_picker.FilePicker.platform.pickFiles();
                          if (pickResult != null) {
                            realPathController.text = pickResult.paths.first!;
                          }
                        },
                        child: const Text('选择'),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: '进程路径',
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: sleepTime.toString(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '等待时间',
                    ),
                    inputFormatters: [IntInputFormatter()],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入等待时间';
                      }
                      return null;
                    },
                    onChanged: (newValue) => sleepTime = int.parse(newValue),
                    maxLines: null,
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
                        setting?.copyWith(
                              appInstID: appID,
                              path: pathController.text,
                              installPath: installPathController.text,
                              advancedTracing: advancedTracing,
                              processName: processName,
                              realPath: realPathController.text,
                              sleepTime: sleepTime,
                            ) ??
                            AppLauncherSetting(
                              appInstID: appID,
                              path: pathController.text,
                              installPath: installPathController.text,
                              advancedTracing: advancedTracing,
                              processName: processName,
                              realPath: realPathController.text,
                              sleepTime: sleepTime,
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
