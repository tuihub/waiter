import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import '../../frame_page.dart';

class AppAddPanel extends StatelessWidget {
  const AppAddPanel({super.key});

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String iconImageUrl = '';
    String backgroundImageUrl = '';
    String coverImageUrl = '';
    String shortDescription = '';
    const appType = AppType.APP_TYPE_GAME;

    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaAddAppState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('添加应用'),
        formFields: [
          TextFormField(
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
          TextFormField(
            onSaved: (newValue) => shortDescription = newValue!,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '描述',
            ),
          ),
          TextFormField(
            onSaved: (newValue) => iconImageUrl = newValue!,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '图标链接',
            ),
            maxLines: null,
          ),
          TextFormField(
            onSaved: (newValue) => backgroundImageUrl = newValue!,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '背景图片链接',
            ),
            maxLines: null,
          ),
          TextFormField(
            onSaved: (newValue) => coverImageUrl = newValue!,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '封面图片链接',
            ),
            maxLines: null,
          ),
        ],
        errorMsg: state is GeburaAddAppState && state.failed ? state.msg : null,
        onSubmit: () {
          context.read<GeburaBloc>().add(GeburaAddAppInfoEvent(
                AppInfo(
                  name: name,
                  type: appType,
                  shortDescription: shortDescription,
                  iconImageUrl: iconImageUrl,
                  backgroundImageUrl: backgroundImageUrl,
                  coverImageUrl: coverImageUrl,
                ),
              ));
        },
        submitting: state is GeburaAddAppState && state.processing,
        close: () => close(context),
      );
    });
  }
}
