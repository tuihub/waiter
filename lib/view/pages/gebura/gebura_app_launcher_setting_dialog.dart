import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../model/gebura_model.dart';
import '../../form/form_field.dart';
import '../../form/input_formatters.dart';
import '../../layout/bootstrap_container.dart';

class GeburaAppLauncherSettingDialog extends StatefulWidget {
  const GeburaAppLauncherSettingDialog(this.appID, this.setting, {super.key});

  final int appID;
  final LocalAppInstLauncherSetting? setting;

  @override
  State<GeburaAppLauncherSettingDialog> createState() =>
      GeburaAppLauncherSettingDialogState();
}

class GeburaAppLauncherSettingDialogState
    extends State<GeburaAppLauncherSettingDialog> {
  LocalAppInstLauncherSetting? newSetting;
  final heroTag = UniqueKey();

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: heroTag,
                      child: GeburaAppLauncherSettingForm(
                        key: heroTag,
                        widget.appID,
                        newSetting ?? widget.setting,
                        onChanged: (setting) {
                          newSetting = setting;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return GeburaAppLauncherSettingTestPage(
                                widget.appID,
                                newSetting ?? widget.setting,
                                heroTag,
                              );
                            }),
                          );
                        },
                        child: const Text('测试设置'),
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
                            GeburaSetLocalAppInstLauncherSettingEvent(
                                newSetting!),
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
  const GeburaAppLauncherSettingTestPage(this.appID, this.setting, this.heroTag,
      {super.key});

  final int appID;
  final LocalAppInstLauncherSetting? setting;
  final UniqueKey heroTag;

  @override
  State<GeburaAppLauncherSettingTestPage> createState() =>
      _GeburaAppLauncherSettingTestPageState();
}

class _GeburaAppLauncherSettingTestPageState
    extends State<GeburaAppLauncherSettingTestPage> {
  int currentStep = 0;
  LocalAppInstLauncherSetting? newSetting;
  InternalID get appID => InternalID(id: Int64(widget.appID));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('应用启动测试'),
      ),
      body: BootstrapContainer(
        children: [
          BootstrapColumn(
            xxs: 6,
            child: Hero(
              tag: widget.heroTag,
              child: GeburaAppLauncherSettingForm(
                key: widget.heroTag,
                widget.appID,
                widget.setting,
                onChanged: (setting) {
                  newSetting = setting;
                },
              ),
            ),
          ),
          BootstrapColumn(
            xxs: 6,
            child: BlocConsumer<GeburaBloc, GeburaState>(
              listener: (context, state) {
                if (state is GeburaSetAppLauncherSettingState &&
                    state.success) {
                  setState(() {
                    currentStep = 1;
                  });
                }
              },
              builder: (context, state) {
                final runState =
                    state.runState != null && state.runState!.containsKey(appID)
                        ? state.runState![appID]
                        : null;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              const Text('保存您的设置\n请在运行测试之前检查您的应用已经关闭'),
                              ElevatedButton(
                                onPressed: () async {
                                  if (newSetting != null) {
                                    context.read<GeburaBloc>().add(
                                          GeburaSetLocalAppInstLauncherSettingEvent(
                                              newSetting!),
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
                                  final setting = widget.setting;
                                  if (setting != null) {
                                    context
                                        .read<GeburaBloc>()
                                        .add(GeburaRunAppEvent(appID));
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
                          title: const Text('启动阶段测试'),
                          content: Column(
                            children: [
                              const Text('请使您的应用保持运行一段时间'),
                              if (runState?.running ?? false)
                                const Text('运行状态正常')
                              else
                                const Text('运行状态异常，未捕获进程'),
                              if (runState?.running ?? false)
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      currentStep = 3;
                                    });
                                  },
                                  child: const Text('下一步'),
                                )
                              else
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      currentStep = 0;
                                    });
                                  },
                                  child: const Text('重置测试'),
                                ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('关闭阶段测试'),
                          content: Column(
                            children: [
                              const Text('请关闭您的应用'),
                              if (runState?.running ?? false)
                                const Text('未检测到关闭')
                              else
                                const Text('应用已关闭'),
                              if (runState?.running ?? false)
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      currentStep = 0;
                                    });
                                  },
                                  child: const Text('重置测试'),
                                )
                              else
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
                          title: const Text('确认测试结果'),
                          content: Column(
                            children: [
                              Text('启动时间：${runState?.startTime ?? ''}'),
                              Text('停止时间：${runState?.endTime ?? ''}'),
                              ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    currentStep = 0;
                                  });
                                },
                                child: const Text('重置测试'),
                              )
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
  const GeburaAppLauncherSettingForm(this.appID, this.setting,
      {super.key, this.onChanged});

  final int appID;
  final LocalAppInstLauncherSetting? setting;
  final void Function(LocalAppInstLauncherSetting)? onChanged;

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

  LocalAppInstLauncherSetting? getSetting() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return widget.setting?.copyWith(
            appInstID: widget.appID,
            path: pathController.text,
            installPath: installPathController.text,
            advancedTracing: advancedTracing,
            processName: processName,
            realPath: realPathController.text,
            sleepTime: sleepTime,
          ) ??
          LocalAppInstLauncherSetting(
            appInstID: widget.appID,
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
              labelText: '等待时间',
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
