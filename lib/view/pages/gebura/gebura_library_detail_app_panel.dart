part of 'gebura_library_detail.dart';

class GeburaLibraryDetailAppPanel extends StatefulWidget {
  const GeburaLibraryDetailAppPanel({super.key, required this.uuid});

  final String uuid;

  @override
  State<GeburaLibraryDetailAppPanel> createState() =>
      _GeburaLibraryDetailAppPanelState();
}

class _GeburaLibraryDetailAppPanelState
    extends State<GeburaLibraryDetailAppPanel> {
  @override
  void initState() {
    super.initState();
    final app = context.read<GeburaBloc>().state.libraryApps[widget.uuid] ??
        LocalApp(uuid: widget.uuid, name: '');
    name = app.name;
    shortDescription = app.shortDescription ?? '';
    iconImageUrl = app.iconImageUrl ?? '';
    iconImagePathController.text = app.iconImagePath ?? '';
    backgroundImageUrl = app.backgroundImageUrl ?? '';
    backgroundImagePathController.text = app.backgroundImagePath ?? '';
    coverImageUrl = app.coverImageUrl ?? '';
    coverImagePathController.text = app.coverImagePath ?? '';
    description = app.description ?? '';
    releaseDate = app.releaseDate ?? '';
    developer = app.developer ?? '';
    publisher = app.publisher ?? '';
  }

  bool submitting = false;
  String? msg;

  late String name;
  late String shortDescription;
  late String iconImageUrl;
  final TextEditingController iconImagePathController = TextEditingController();
  late String backgroundImageUrl;
  final TextEditingController backgroundImagePathController =
      TextEditingController();
  late String coverImageUrl;
  final TextEditingController coverImagePathController =
      TextEditingController();
  late String description;
  late String releaseDate;
  late String developer;
  late String publisher;

  void _close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RightPanelForm(
          title: const Text('设置应用信息'),
          formFields: [
            UniversalTextFormField(
              labelText: '名称',
              initialValue: name,
              onChanged: (value) => setState(() => name = value),
            ),
            UniversalTextFormField(
              labelText: '简介',
              initialValue: shortDescription,
              onChanged: (value) => setState(() => shortDescription = value),
            ),
            UniversalTextFormField(
              labelText: '图标 URL',
              initialValue: iconImageUrl,
              onChanged: (value) => setState(() => iconImageUrl = value),
            ),
            UniversalTextFormField(
              labelText: '图标文件',
              controller: iconImagePathController,
              suffixIcon: UniversalTextButton(
                onPressed: () async {
                  final path = await FilePicker.platform.getDirectoryPath();
                  if (path != null) {
                    iconImagePathController.text = path;
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
                return null;
              },
            ),
            UniversalTextFormField(
              labelText: '背景图 URL',
              initialValue: backgroundImageUrl,
              onChanged: (value) => setState(() => backgroundImageUrl = value),
            ),
            UniversalTextFormField(
              labelText: '背景图文件',
              controller: backgroundImagePathController,
              suffixIcon: UniversalTextButton(
                onPressed: () async {
                  final path = await FilePicker.platform.getDirectoryPath();
                  if (path != null) {
                    backgroundImagePathController.text = path;
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
                return null;
              },
            ),
            UniversalTextFormField(
              labelText: '封面图 URL',
              initialValue: coverImageUrl,
              onChanged: (value) => setState(() => coverImageUrl = value),
            ),
            UniversalTextFormField(
              labelText: '封面图文件',
              controller: coverImagePathController,
              suffixIcon: UniversalTextButton(
                onPressed: () async {
                  final path = await FilePicker.platform.getDirectoryPath();
                  if (path != null) {
                    coverImagePathController.text = path;
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
                return null;
              },
            ),
            UniversalTextFormField(
              labelText: '描述',
              initialValue: description,
              onChanged: (value) => setState(() => description = value),
            ),
            UniversalTextFormField(
              labelText: '发布日期',
              initialValue: releaseDate,
              onChanged: (value) => setState(() => releaseDate = value),
            ),
            UniversalTextFormField(
              labelText: '开发者',
              initialValue: developer,
              onChanged: (value) => setState(() => developer = value),
            ),
            UniversalTextFormField(
              labelText: '发布者',
              initialValue: publisher,
              onChanged: (value) => setState(() => publisher = value),
            ),
          ],
          submitting: submitting,
          onSubmit: () async {
            setState(() {
              submitting = true;
              msg = null;
            });
            msg = await context.read<GeburaBloc>().updateLocalApp(LocalApp(
                  uuid: widget.uuid,
                  name: name,
                  shortDescription: shortDescription,
                  iconImageUrl: iconImageUrl,
                  iconImagePath: iconImagePathController.text,
                  backgroundImageUrl: backgroundImageUrl,
                  backgroundImagePath: backgroundImagePathController.text,
                  coverImageUrl: coverImageUrl,
                  coverImagePath: coverImagePathController.text,
                  description: description,
                  releaseDate: releaseDate,
                  developer: developer,
                  publisher: publisher,
                ));
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
