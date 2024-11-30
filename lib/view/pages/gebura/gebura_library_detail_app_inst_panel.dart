part of 'gebura_library_detail.dart';

class GeburaLibraryDetailAppInstAddPanel extends StatefulWidget {
  const GeburaLibraryDetailAppInstAddPanel({super.key, required this.uuid});

  final String uuid;

  @override
  State<GeburaLibraryDetailAppInstAddPanel> createState() =>
      _GeburaLibraryDetailAppInstAddPanelState();
}

class _GeburaLibraryDetailAppInstAddPanelState
    extends State<GeburaLibraryDetailAppInstAddPanel> {
  @override
  void initState() {
    super.initState();
    name = '';
    path = '';
    version = '';
  }

  bool submitting = false;
  String? msg;

  late String name;
  late String path;
  late String version;

  void _close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RightPanelForm(
          title: const Text('添加安装位置'),
          formFields: [
            UniversalTextFormField(
              labelText: '名称',
              initialValue: name,
              onChanged: (value) => setState(() => name = value),
            ),
            UniversalTextFormField(
              labelText: '路径',
              initialValue: path,
              onChanged: (value) => setState(() => path = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '不能为空';
                }
                if (!Directory(value).existsSync()) {
                  return '路径不存在';
                }
                return null;
              },
            ),
            UniversalTextFormField(
              labelText: '版本',
              initialValue: version,
              onChanged: (value) => setState(() => version = value),
            ),
          ],
          submitting: submitting,
          onSubmit: () async {
            setState(() {
              submitting = true;
              msg = null;
            });
            msg = await context.read<GeburaBloc>().addLocalAppInst(
                  LocalAppInst(
                    uuid: const Uuid().v1(),
                    appUUID: widget.uuid,
                    name: name,
                    path: path,
                    version: version,
                  ),
                );
            if (msg == null) {
              _close(context);
            } else {
              setState(() {
                submitting = false;
              });
            }
          },
          errorMsg: msg,
          close: () => _close(context),
        );
      },
    );
  }
}

class GeburaLibraryDetailAppInstEditPanel extends StatefulWidget {
  const GeburaLibraryDetailAppInstEditPanel(
      {super.key, required this.initialValue});

  final LocalAppInst? initialValue;

  @override
  State<GeburaLibraryDetailAppInstEditPanel> createState() =>
      _GeburaLibraryDetailAppInstEditPanelState();
}

class _GeburaLibraryDetailAppInstEditPanelState
    extends State<GeburaLibraryDetailAppInstEditPanel> {
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      final app = widget.initialValue!;
      name = app.name ?? '';
      path = app.path;
      version = app.version;
    }
  }

  bool submitting = false;
  String? msg;

  late String name;
  late String path;
  late String version;

  void _close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RightPanelForm(
          title: const Text('设置安装位置'),
          formFields: [
            TextReadOnlyFormField(
              label: '路径',
              value: path,
            ),
            UniversalTextFormField(
              labelText: '名称',
              initialValue: name,
              onChanged: (value) => setState(() => name = value),
            ),
            UniversalTextFormField(
              labelText: '版本',
              initialValue: version,
              onChanged: (value) => setState(() => version = value),
            ),
          ],
          submitting: submitting,
          onSubmit: widget.initialValue != null
              ? () async {
                  setState(() {
                    submitting = true;
                    msg = null;
                  });
                  msg = await context
                      .read<GeburaBloc>()
                      .updateLocalAppInst(widget.initialValue!.copyWith(
                        name: name,
                        version: version,
                      ));
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
