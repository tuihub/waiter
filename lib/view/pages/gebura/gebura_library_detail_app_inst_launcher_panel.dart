part of 'gebura_library_detail.dart';

class GeburaLibraryDetailAppInstLauncherAddPanel extends StatefulWidget {
  const GeburaLibraryDetailAppInstLauncherAddPanel(
      {super.key, required this.uuid, required this.inst});

  final String uuid;
  final LocalAppInst? inst;

  @override
  State<GeburaLibraryDetailAppInstLauncherAddPanel> createState() =>
      _GeburaLibraryDetailAppInstLauncherAddPanelState();
}

class _GeburaLibraryDetailAppInstLauncherAddPanelState
    extends State<GeburaLibraryDetailAppInstLauncherAddPanel> {
  bool submitting = false;
  String? msg;

  TextEditingController launcherPathController = TextEditingController();
  bool advancedTracing = false;
  String processName = '';
  TextEditingController processPathController = TextEditingController();
  int sleepCount = 10;

  void _close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RightPanelForm(
          title: const Text('添加启动项'),
          formFields: [
            UniversalTextFormField(
              labelText: '启动路径',
              controller: launcherPathController,
              suffixIcon: UniversalTextButton(
                onPressed: () async {
                  final path = await FilePicker.platform.getDirectoryPath();
                  if (path != null) {
                    launcherPathController.text = path;
                  }
                },
                child: const Text('选择'),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '不能为空';
                }
                if (!Directory(value).existsSync()) {
                  return '路径不存在';
                }
                if (widget.inst == null ||
                    !widget.inst!.path.startsWith(value)) {
                  return '必须是安装位置的子目录';
                }
                return null;
              },
            ),
            UniversalSwitchFormField(
              title: const Text('高级模式'),
              initialValue: advancedTracing,
              onChanged: (value) => setState(() => advancedTracing = value),
            ),
            if (advancedTracing) ...[
              UniversalTextFormField(
                labelText: '进程名',
                initialValue: processName,
                onChanged: (value) => setState(() => processName = value),
              ),
              UniversalTextFormField(
                labelText: '进程路径',
                controller: processPathController,
                suffixIcon: UniversalTextButton(
                  onPressed: () async {
                    final path = await FilePicker.platform.getDirectoryPath();
                    if (path != null) {
                      processPathController.text = path;
                    }
                  },
                  child: const Text('选择'),
                ),
              ),
              UniversalTextFormField(
                labelText: '等待时间（秒）',
                initialValue: sleepCount.toString(),
                onChanged: (value) =>
                    setState(() => sleepCount = int.parse(value)),
              ),
            ],
          ],
          submitting: submitting,
          onSubmit: widget.inst != null
              ? () async {
                  setState(() {
                    submitting = true;
                    msg = null;
                  });
                  msg =
                      await context.read<GeburaBloc>().addLocalAppInstLauncher(
                            LocalAppInstLauncher(
                              uuid: const Uuid().v1(),
                              appInstUUID: widget.inst!.uuid,
                              launcherType: LocalAppInstLauncherType.common,
                              common: LocalAppInstLaunchCommon(
                                launcherPath: launcherPathController.text,
                                advancedTracing: advancedTracing,
                                processName: processName,
                                processPath: processPathController.text,
                                sleepCount: sleepCount,
                              ),
                            ),
                          );
                  if (msg == null) {
                    _close(context);
                  } else {
                    setState(() {
                      submitting = false;
                    });
                  }
                }
              : null,
          errorMsg: msg,
          close: () => _close(context),
        );
      },
    );
  }
}

class GeburaLibraryDetailAppInstLauncherEditPanel extends StatefulWidget {
  const GeburaLibraryDetailAppInstLauncherEditPanel(
      {super.key, required this.launcher});

  final LocalAppInstLauncher? launcher;

  @override
  State<GeburaLibraryDetailAppInstLauncherEditPanel> createState() =>
      _GeburaLibraryDetailAppInstLauncherEditPanelState();
}

class _GeburaLibraryDetailAppInstLauncherEditPanelState
    extends State<GeburaLibraryDetailAppInstLauncherEditPanel> {
  bool submitting = false;
  String? msg;

  TextEditingController launcherPathController = TextEditingController();
  bool advancedTracing = false;
  String processName = '';
  TextEditingController processPathController = TextEditingController();
  int sleepCount = 10;

  void _close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  void initState() {
    super.initState();
    if (widget.launcher != null && widget.launcher!.common != null) {
      final common = widget.launcher!.common!;
      launcherPathController.text = common.launcherPath;
      advancedTracing = common.advancedTracing;
      processName = common.processName ?? '';
      processPathController.text = common.processPath ?? '';
      sleepCount = common.sleepCount ?? 10;
    }
  }

  LocalAppInstLauncher? get newSetting {
    if (widget.launcher == null) {
      return null;
    }
    return widget.launcher!.copyWith(
      common: widget.launcher!.common?.copyWith(
        launcherPath: launcherPathController.text,
        advancedTracing: advancedTracing,
        processName: processName,
        processPath: processPathController.text,
        sleepCount: sleepCount,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RightPanelForm(
          title: const Text('编辑启动项'),
          formFields: [
            UniversalTextFormField(
              labelText: '启动路径',
              controller: launcherPathController,
              suffixIcon: UniversalTextButton(
                onPressed: () async {
                  final path = await FilePicker.platform.getDirectoryPath();
                  if (path != null) {
                    launcherPathController.text = path;
                  }
                },
                child: const Text('选择'),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '不能为空';
                }
                if (!Directory(value).existsSync()) {
                  return '路径不存在';
                }
                if (!(widget.launcher?.common?.launcherPath.startsWith(value) ??
                    false)) {
                  return '必须是安装位置的子目录';
                }
                return null;
              },
            ),
            UniversalSwitchFormField(
              title: const Text('高级模式'),
              initialValue: advancedTracing,
              onChanged: (value) => setState(() => advancedTracing = value),
            ),
            if (advancedTracing) ...[
              UniversalTextFormField(
                labelText: '进程名',
                initialValue: processName,
                onChanged: (value) => setState(() => processName = value),
              ),
              UniversalTextFormField(
                labelText: '进程路径',
                controller: processPathController,
                suffixIcon: UniversalTextButton(
                  onPressed: () async {
                    final path = await FilePicker.platform.getDirectoryPath();
                    if (path != null) {
                      processPathController.text = path;
                    }
                  },
                  child: const Text('选择'),
                ),
              ),
              UniversalTextFormField(
                labelText: '等待时间（秒）',
                initialValue: sleepCount.toString(),
                onChanged: (value) =>
                    setState(() => sleepCount = int.parse(value)),
              ),
            ],
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: UniversalElevatedButton(
                onPressed: () async {
                  if (newSetting == null) {
                    return;
                  }
                  await Navigator.of(context).push(
                    UniversalPageRoute(builder: (context) {
                      return _GeburaAppLauncherSettingTestPage(
                        newSetting!,
                      );
                    }),
                  );
                  _close(context);
                },
                child: const Text('遇到问题？打开调试窗口'),
              ),
            ),
          ],
          submitting: submitting,
          onSubmit: widget.launcher != null
              ? () async {
                  setState(() {
                    submitting = true;
                    msg = null;
                  });
                  msg = await context
                      .read<GeburaBloc>()
                      .updateLocalAppInstLauncher(
                        widget.launcher!.copyWith(
                          common: LocalAppInstLaunchCommon(
                            launcherPath: launcherPathController.text,
                            advancedTracing: advancedTracing,
                            processName: processName,
                            processPath: processPathController.text,
                            sleepCount: sleepCount,
                          ),
                        ),
                      );
                  if (msg == null) {
                    _close(context);
                  } else {
                    setState(() {
                      submitting = false;
                    });
                  }
                }
              : null,
          errorMsg: msg,
          close: () => _close(context),
        );
      },
    );
  }
}
