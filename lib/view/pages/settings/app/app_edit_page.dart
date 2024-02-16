import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class AppEditPage extends StatefulWidget {
  final AppInfo app;

  const AppEditPage({super.key, required this.app});
  @override
  State<AppEditPage> createState() => _AppEditPageState();
}

class _AppEditPageState extends State<AppEditPage> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String iconImageUrl;
  late String backgroundImageUrl;
  late String coverImageUrl;
  late String shortDescription;
  AppType appType = AppType.APP_TYPE_GAME;
  late bool readOnly;

  @override
  void initState() {
    super.initState();
    name = widget.app.name;
    appType = widget.app.type;
    shortDescription = widget.app.shortDescription;
    iconImageUrl = widget.app.iconImageUrl;
    backgroundImageUrl = widget.app.backgroundImageUrl;
    coverImageUrl = widget.app.coverImageUrl;
    readOnly = !widget.app.internal;
  }

  void close(BuildContext context) {
    AppRoutes.settingsAppEdit().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaEditAppState && state.success) {
        const Toast(title: '', message: '已应用更改').show(context);
        close(context);
      }
    }, builder: (BuildContext context, GeburaState state) {
      return RightPanelForm(
        title: const Text('应用详情'),
        form: Form(
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
                initialValue: widget.app.id.id.toString(),
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
              ),
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
                initialValue: backgroundImageUrl,
                readOnly: readOnly,
                onSaved: (newValue) => backgroundImageUrl = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '背景图片链接',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: coverImageUrl,
                readOnly: readOnly,
                onSaved: (newValue) => coverImageUrl = newValue!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '封面图片链接',
                ),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state is GeburaEditAppState && state.failed ? 48 : 0,
                child: state is GeburaEditAppState && state.failed
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
                        ),
                        child: Center(
                          child: Text(
                            state.msg ?? '未知错误',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
        actions: [
          if (!readOnly)
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<GeburaBloc>().add(GeburaEditAppInfoEvent(
                        AppInfo(
                          id: widget.app.id,
                          source: widget.app.source,
                          sourceAppId: widget.app.sourceAppId,
                          sourceUrl: widget.app.sourceUrl,
                          name: name,
                          type: widget.app.type,
                          shortDescription: shortDescription,
                          iconImageUrl: iconImageUrl,
                          backgroundImageUrl: backgroundImageUrl,
                          coverImageUrl: coverImageUrl,
                          details: widget.app.details,
                        ),
                      ));
                }
              },
              child: state is GeburaEditAppState && state.processing
                  ? const CircularProgressIndicator()
                  : const Text('应用更改'),
            )
          else
            Text('数据来自${appSourceString(widget.app.source)}，无法修改'),
          ElevatedButton(
            onPressed: () => close(context),
            child: const Text('取消'),
          )
        ],
      );
    });
  }
}
