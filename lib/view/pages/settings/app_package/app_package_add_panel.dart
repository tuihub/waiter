import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import 'package:universal_ui/universal_ui.dart';
import '../../frame_page.dart';

class AppPackageAddPanel extends StatelessWidget {
  const AppPackageAddPanel({super.key});

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    late String name;
    late String description;

    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaAddAppPackageState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('添加应用包'),
        formFields: [
          TextFormField(
            onSaved: (newValue) => name = newValue!,
            decoration: InputDecoration(
              icon: Icon(UniversalUI.of(context).icons.person),
              border: const OutlineInputBorder(),
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
            onSaved: (newValue) => description = newValue!,
            decoration: InputDecoration(
              icon: Icon(UniversalUI.of(context).icons.person),
              border: const OutlineInputBorder(),
              labelText: '描述',
            ),
          ),
        ],
        errorMsg: state is GeburaAddAppPackageState && state.failed
            ? state.msg
            : null,
        onSubmit: () {
          context.read<GeburaBloc>().add(GeburaAddAppEvent(
                App(
                  name: name,
                  description: description,
                ),
              ));
        },
        submitting: state is GeburaAddAppPackageState && state.processing,
        close: () => close(context),
      );
    });
  }
}
