import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import '../../frame_page.dart';
import 'app_package_assign_dialog.dart';

class AppPackageEditPanel extends StatefulWidget {
  const AppPackageEditPanel({super.key, required this.appPackage});

  final App appPackage;

  @override
  State<AppPackageEditPanel> createState() => _AppPackageEditPanelState();
}

class _AppPackageEditPanelState extends State<AppPackageEditPanel> {
  late String name;
  late String description;

  @override
  void initState() {
    super.initState();
    name = widget.appPackage.name;
    description = widget.appPackage.description;
  }

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaEditAppPackageState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('应用包详情'),
        formFields: [
          Text('ID: ${widget.appPackage.id.id.toHexString()}'),
          TextFormField(
            initialValue: name,
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
            initialValue: description,
            onSaved: (newValue) => description = newValue!,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '描述',
            ),
            maxLines: null,
          ),
          ElevatedButton(
            onPressed: () {
              unawaited(showDialog<void>(
                context: context,
                builder: (context) => AppPackageAssignDialog(
                  callback: () {},
                  appPackage: widget.appPackage,
                ),
              ));
            },
            child: const Text('绑定应用包'),
          ),
        ],
        errorMsg: state is GeburaEditAppPackageState && state.failed
            ? state.msg
            : null,
        onSubmit: () {
          context.read<GeburaBloc>().add(GeburaEditAppEvent(
                App(
                  id: widget.appPackage.id,
                  name: name,
                  description: description,
                ),
              ));
        },
        submitting: state is GeburaEditAppPackageState && state.processing,
        close: () => close(context),
      );
    });
  }
}
