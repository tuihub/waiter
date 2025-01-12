import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../components/toast.dart';

class AppPackageAssignDialog extends StatelessWidget {
  const AppPackageAssignDialog(
      {super.key, required this.appPackage, required this.callback});

  final void Function() callback;
  final App appPackage;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    late int appID;

    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaAssignAppPackageState && state.success) {
        const Toast(title: '', message: '绑定成功').show(context);
        callback();
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return UniversalDialog(
        title: const Text('绑定应用'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Name: ${appPackage.name}'),
                Text('ID: ${appPackage.id.id.toHexString()}'),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onSaved: (newValue) => appID = int.parse(newValue!),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '应用ID',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入应用ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: state is GeburaAssignAppPackageState && state.failed
                      ? 48
                      : 0,
                  child: state is GeburaAssignAppPackageState && state.failed
                      ? Ink(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
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
        ),
        actions: [
          UniversalDialogAction(
            onPressed: () {
              context.read<GeburaBloc>().add(GeburaAssignAppEvent(
                    appPackage.id,
                    InternalID(id: $fixnum.Int64(appID)),
                  ));
            },
            isPrimary: true,
            child: state is GeburaAssignAppPackageState && state.failed
                ? const CircularProgressIndicator()
                : const Text('应用更改'),
          ),
          UniversalDialogAction(
            onPressed: () {
              Navigator.pop(context); //close Dialog
            },
            child: const Text('取消'),
          )
        ],
      );
    });
  }
}
