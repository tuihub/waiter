import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../model/gebura_model.dart';
import '../../components/form_field.dart';
import '../../components/input_formatters.dart';
import '../../components/toast.dart';
import '../../layout/bootstrap_container.dart';

class GeburaAppLauncherSettingDialog extends StatefulWidget {
  const GeburaAppLauncherSettingDialog(this.appInst, {super.key});

  final LocalTrackedAppInst appInst;

  @override
  State<GeburaAppLauncherSettingDialog> createState() =>
      GeburaAppLauncherSettingDialogState();
}

class GeburaAppLauncherSettingDialogState
    extends State<GeburaAppLauncherSettingDialog> {
  LocalCommonAppInstLaunchSetting? newSetting;
  final heroTag = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaSaveLocalAppInstLaunchSettingState &&
            state.success) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text('本地设置'),
          content: SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GeburaAppLauncherSettingForm(
                      widget.appInst.uuid,
                      newSetting ?? widget.appInst.commonLaunchSetting,
                      onChanged: (setting) {
                        setState(() {
                          newSetting = setting;
                        });
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return GeburaAppLauncherSettingTestPage(
                                widget.appInst.copyWith(
                                  commonLaunchSetting: newSetting,
                                ),
                                heroTag,
                              );
                            }),
                          );
                        },
                        child: const Text('遇到问题？打开调试窗口'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: newSetting != null
                  ? () {
                      context.read<GeburaBloc>().add(
                            GeburaSaveLocalAppInstLaunchSettingEvent(
                                widget.appInst.uuid,
                                commonSetting: newSetting),
                          );
                    }
                  : null,
              child: const Text('保存'),
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

class GeburaAppLauncherSettingTestPage extends StatefulWidget {
  const GeburaAppLauncherSettingTestPage(this.appInst, this.heroTag,
      {super.key});

  final LocalTrackedAppInst appInst;
  final UniqueKey heroTag;

  @override
  State<GeburaAppLauncherSettingTestPage> createState() =>
      _GeburaAppLauncherSettingTestPageState();
}

class _GeburaAppLauncherSettingTestPageState
    extends State<GeburaAppLauncherSettingTestPage> {
  int currentStep = 0;
  LocalCommonAppInstLaunchSetting? newSetting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('调试应用启动设置'),
      ),
      body: BootstrapContainer(
        children: [
          BootstrapColumn(
            xxs: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('本窗口会帮助您测试您的启动设置，在下方更改您的设置，之后根据右侧的引导执行测试'),
                const SizedBox(
                  height: 16,
                ),
                GeburaAppLauncherSettingForm(
                  widget.appInst.uuid,
                  widget.appInst.commonLaunchSetting,
                  onChanged: (setting) {
                    newSetting = setting;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (newSetting != null) {
                      context.read<GeburaBloc>().add(
                            GeburaSaveLocalAppInstLaunchSettingEvent(
                                widget.appInst.uuid,
                                commonSetting: newSetting),
                          );
                    } else {
                      const Toast(title: '', message: '没有需要保存的更改')
                          .show(context);
                    }
                  },
                  child: const Text('保存'),
                ),
              ],
            ),
          ),
          BootstrapColumn(
            xxs: 6,
            child: BlocConsumer<GeburaBloc, GeburaState>(
              listener: (context, state) {
                if (state is GeburaSaveLocalAppInstLaunchSettingState &&
                    state.success) {
                  const Toast(title: '', message: '保存成功').show(context);
                  setState(() {
                    currentStep = 1;
                  });
                }
              },
              builder: (context, state) {
                final runState = state.runningInsts?[widget.appInst.uuid];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentStep = 0;
                        });
                      },
                      child: const Text('重置测试'),
                    ),
                    Stepper(
                      currentStep: currentStep,
                      controlsBuilder: (context, _) {
                        return Container();
                      },
                      steps: [
                        Step(
                          title: const Text('保存应用启动设置'),
                          content: Column(
                            children: [
                              const Text(
                                '请在运行测试之前检查您的应用已经关闭',
                                style: TextStyle(color: Colors.red),
                              ),
                              const Text('点击确定将会保存您当前的设置'),
                              ElevatedButton(
                                onPressed: () async {
                                  if (newSetting != null) {
                                    context.read<GeburaBloc>().add(
                                          GeburaSaveLocalAppInstLaunchSettingEvent(
                                              widget.appInst.uuid,
                                              commonSetting: newSetting),
                                        );
                                  } else {
                                    setState(() {
                                      currentStep = 1;
                                    });
                                  }
                                },
                                child: const Text('确认'),
                              ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('启动应用'),
                          content: Column(
                            children: [
                              const Text(
                                  '点击启动按钮启动应用\n如果您的应用有启动器，请在您设置的等待时间内完成实际应用的启动'),
                              ElevatedButton(
                                onPressed: () async {
                                  final setting =
                                      widget.appInst.commonLaunchSetting;
                                  if (setting != null) {
                                    context.read<GeburaBloc>().add(
                                        GeburaLaunchLocalAppEvent(
                                            widget.appInst.appUUID));
                                    setState(() {
                                      currentStep = 2;
                                    });
                                  }
                                },
                                child: const Text('启动'),
                              ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('启动阶段'),
                          content: Column(
                            children: [
                              const Text('请使您的应用保持运行一段时间'),
                              if (runState == null)
                                const Text('运行状态正常')
                              else
                                const Text(
                                  '运行状态异常，未捕获进程',
                                  style: TextStyle(color: Colors.red),
                                ),
                              if (runState == null)
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      currentStep = 3;
                                    });
                                  },
                                  child: const Text('下一步'),
                                ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('关闭阶段'),
                          content: Column(
                            children: [
                              const Text('请关闭您的应用'),
                              if (runState == null)
                                const Text(
                                  '等待应用关闭',
                                  style: TextStyle(color: Colors.red),
                                )
                              else
                                const Text('应用已关闭'),
                              if (!(runState == null))
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      currentStep = 4;
                                    });
                                  },
                                  child: const Text('下一步'),
                                ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('检查结果'),
                          content: Column(
                            children: [
                              Text('启动时间：${runState?.startTime ?? ''}'),
                              Text('停止时间：${runState?.endTime ?? ''}'),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('关闭本窗口'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GeburaAppLauncherSettingForm extends StatefulWidget {
  const GeburaAppLauncherSettingForm(this.uuid, this.setting,
      {super.key, this.onChanged});

  final String uuid;
  final LocalCommonAppInstLaunchSetting? setting;
  final void Function(LocalCommonAppInstLaunchSetting)? onChanged;

  @override
  State<GeburaAppLauncherSettingForm> createState() =>
      _GeburaAppLauncherSettingFormState();
}

class _GeburaAppLauncherSettingFormState
    extends State<GeburaAppLauncherSettingForm> {
  @override
  void initState() {
    super.initState();

    pathController.text = widget.setting?.path ?? '';
    installPathController.text = widget.setting?.installPath ?? '';
    advancedTracing = widget.setting?.advancedTracing ?? false;
    processName = widget.setting?.processName ?? '';
    realPathController.text = widget.setting?.realPath ?? '';
    sleepTime = widget.setting?.sleepTime ?? 10;
  }

  final formKey = GlobalKey<FormState>();

  final TextEditingController pathController = TextEditingController();
  final TextEditingController installPathController = TextEditingController();
  final TextEditingController realPathController = TextEditingController();

  late bool advancedTracing;
  late String processName;
  late int sleepTime;

  void onChanged() {
    final setting = getSetting();
    if (setting != null) {
      widget.onChanged?.call(setting);
    }
  }

  LocalCommonAppInstLaunchSetting? getSetting() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return widget.setting?.copyWith(
            path: pathController.text,
            installPath: installPathController.text,
            advancedTracing: advancedTracing,
            processName: processName,
            realPath: realPathController.text,
            sleepTime: sleepTime,
          ) ??
          LocalCommonAppInstLaunchSetting(
            path: pathController.text,
            installPath: installPathController.text,
            advancedTracing: advancedTracing,
            processName: processName,
            realPath: realPathController.text,
            sleepTime: sleepTime,
          );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: pathController,
            decoration: InputDecoration(
              suffixIcon: TextButton(
                onPressed: () async {
                  final initialDirectory = widget.setting?.installPath;
                  final pickResult =
                      await file_picker.FilePicker.platform.pickFiles(
                    type: file_picker.FileType.custom,
                    allowedExtensions: ['exe'],
                    allowMultiple: false,
                    initialDirectory: initialDirectory,
                  );
                  if (pickResult != null) {
                    pathController.text = pickResult.paths.first!;
                    onChanged();
                  }
                },
                child: const Text('选择'),
              ),
              border: const OutlineInputBorder(),
              labelText: '应用启动路径',
            ),
            maxLines: null,
            onChanged: (_) => onChanged,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: installPathController,
            decoration: InputDecoration(
              suffixIcon: TextButton(
                onPressed: () async {
                  final pickResult =
                      await file_picker.FilePicker.platform.getDirectoryPath();
                  if (pickResult != null) {
                    installPathController.text = pickResult;
                    onChanged();
                  }
                },
                child: const Text('选择'),
              ),
              border: const OutlineInputBorder(),
              labelText: '应用安装路径',
            ),
            maxLines: null,
            onChanged: (_) => onChanged,
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
            onChanged: (_) => onChanged,
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
                    onChanged();
                  }
                },
                child: const Text('选择'),
              ),
              border: const OutlineInputBorder(),
              labelText: '进程路径',
            ),
            maxLines: null,
            onChanged: (_) => onChanged,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: sleepTime.toString(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '等待时间（秒）',
            ),
            inputFormatters: [IntInputFormatter()],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入等待时间';
              }
              return null;
            },
            onChanged: (newValue) {
              sleepTime = int.parse(newValue);
              onChanged();
            },
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
