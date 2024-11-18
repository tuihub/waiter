import 'package:dao/dao.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../components/input_formatters.dart';
import '../../components/pop_alert.dart';
import '../../components/toast.dart';
import '../../layout/bootstrap_container.dart';
import '../../universal/universal.dart';

class GeburaAppLauncherSettingDialog extends StatefulWidget {
  const GeburaAppLauncherSettingDialog(this.launcher, this.navigator,
      {super.key});

  final NavigatorState navigator;
  final LocalAppInstLauncher launcher;

  @override
  State<GeburaAppLauncherSettingDialog> createState() =>
      GeburaAppLauncherSettingDialogState();
}

class GeburaAppLauncherSettingDialogState
    extends State<GeburaAppLauncherSettingDialog> {
  LocalAppInstLaunchCommon? newSetting;
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
        return UniversalDialog(
          title: const Text('本地设置'),
          content: SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _GeburaAppLauncherSettingForm(
                      widget.launcher.uuid,
                      newSetting ?? widget.launcher.common,
                      onChanged: (setting) {
                        setState(() {
                          newSetting = setting;
                        });
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: UniversalElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await widget.navigator.push(
                            UniversalPageRoute(builder: (context) {
                              return _GeburaAppLauncherSettingTestPage(
                                widget.launcher.copyWith(
                                  common: newSetting ?? widget.launcher.common,
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
          actions: [
            UniversalDialogAction(
              onPressed: newSetting != null
                  ? () {
                      context.read<GeburaBloc>().add(
                            GeburaSaveLocalAppInstLaunchSettingEvent(
                                widget.launcher.uuid,
                                commonSetting: newSetting),
                          );
                    }
                  : null,
              isPrimary: true,
              child: const Text('保存'),
            ),
            UniversalDialogAction(
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

class _GeburaAppLauncherSettingTestPage extends StatefulWidget {
  const _GeburaAppLauncherSettingTestPage(this.launcher, this.heroTag);

  final LocalAppInstLauncher launcher;
  final UniqueKey heroTag;

  @override
  State<_GeburaAppLauncherSettingTestPage> createState() =>
      _GeburaAppLauncherSettingTestPageState();
}

class _GeburaAppLauncherSettingTestPageState
    extends State<_GeburaAppLauncherSettingTestPage> {
  int currentStep = 0;
  LocalAppInstLaunchCommon? newSetting;

  void _saveSetting() {
    if (newSetting != null) {
      context.read<GeburaBloc>().add(
            GeburaSaveLocalAppInstLaunchSettingEvent(widget.launcher.uuid,
                commonSetting: newSetting),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopAlert(
      onConfirm: _saveSetting,
      builder: (context, triggerPop) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('调试应用启动设置'),
            shape: UniversalUI.of(context).defaultShape,
            backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
            leading: IconButton(
              icon: Icon(UniversalUI.of(context).icons.arrowBack),
              onPressed: triggerPop,
            ),
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
                    _GeburaAppLauncherSettingForm(
                      widget.launcher.uuid,
                      widget.launcher.common,
                      onChanged: (setting) {
                        newSetting = setting;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    UniversalElevatedButton(
                      onPressed: () async {
                        if (newSetting != null) {
                          _saveSetting();
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
                    final runState = state.runningInsts[widget.launcher.uuid];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UniversalElevatedButton(
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
                                  UniversalElevatedButton(
                                    onPressed: () async {
                                      if (newSetting != null) {
                                        _saveSetting();
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
                                  UniversalElevatedButton(
                                    onPressed: () async {
                                      final setting = widget.launcher.common;
                                      if (setting != null) {
                                        context.read<GeburaBloc>().add(
                                            GeburaLaunchLocalAppEvent(
                                                launcherUUID:
                                                    widget.launcher.uuid));
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
                                    UniversalElevatedButton(
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
                                    UniversalElevatedButton(
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
                                  UniversalElevatedButton(
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
      },
    );
  }
}

class _GeburaAppLauncherSettingForm extends StatefulWidget {
  const _GeburaAppLauncherSettingForm(this.uuid, this.setting,
      {this.onChanged});

  final String uuid;
  final LocalAppInstLaunchCommon? setting;
  final void Function(LocalAppInstLaunchCommon)? onChanged;

  @override
  State<_GeburaAppLauncherSettingForm> createState() =>
      _GeburaAppLauncherSettingFormState();
}

class _GeburaAppLauncherSettingFormState
    extends State<_GeburaAppLauncherSettingForm> {
  @override
  void initState() {
    super.initState();

    pathController.text = widget.setting?.launcherPath ?? '';
    advancedTracing = widget.setting?.advancedTracing ?? false;
    processName = widget.setting?.processName ?? '';
    processPathController.text = widget.setting?.processPath ?? '';
    sleepCount = widget.setting?.sleepCount ?? 10;
  }

  final formKey = GlobalKey<FormState>();

  final TextEditingController pathController = TextEditingController();
  final TextEditingController processPathController = TextEditingController();

  late bool advancedTracing;
  late String processName;
  late int sleepCount;

  void onChanged() {
    final setting = getSetting();
    if (setting != null) {
      widget.onChanged?.call(setting);
    }
  }

  LocalAppInstLaunchCommon? getSetting() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return widget.setting?.copyWith(
            launcherPath: pathController.text,
            advancedTracing: advancedTracing,
            processName: processName,
            processPath: processPathController.text,
            sleepCount: sleepCount,
          ) ??
          LocalAppInstLaunchCommon(
            launcherPath: pathController.text,
            advancedTracing: advancedTracing,
            processName: processName,
            processPath: processPathController.text,
            sleepCount: sleepCount,
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
        children: SpacingHelper.listSpacing(
          height: 16,
          children: [
            UniversalTextFormField(
              controller: pathController,
              suffixIcon: UniversalTextButton(
                onPressed: () async {
                  final initialDirectory = widget.setting?.launcherPath;
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
              labelText: '应用启动路径',
              maxLines: null,
              onChanged: (_) => onChanged,
            ),
            UniversalSwitchFormField(
              onChanged: (newValue) => setState(() {
                advancedTracing = newValue ?? false;
              }),
              title: const Text('高级模式'),
              initialValue: advancedTracing,
            ),
            if (advancedTracing)
              UniversalTextFormField(
                initialValue: processName,
                labelText: '进程名',
                onSaved: (newValue) => processName = newValue ?? '',
                maxLines: null,
                onChanged: (_) => onChanged,
              ),
            if (advancedTracing)
              UniversalTextFormField(
                controller: processPathController,
                suffixIcon: UniversalTextButton(
                  onPressed: () async {
                    final pickResult =
                        await file_picker.FilePicker.platform.pickFiles();
                    if (pickResult != null) {
                      processPathController.text = pickResult.paths.first!;
                      onChanged();
                    }
                  },
                  child: const Text('选择'),
                ),
                labelText: '进程路径',
                maxLines: null,
                onChanged: (_) => onChanged,
              ),
            if (advancedTracing)
              UniversalTextFormField(
                initialValue: sleepCount.toString(),
                labelText: '等待时间（秒）',
                inputFormatters: [IntInputFormatter()],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入等待时间';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  sleepCount = int.parse(newValue);
                  onChanged();
                },
                maxLines: null,
              ),
          ],
        ),
      ),
    );
  }
}
