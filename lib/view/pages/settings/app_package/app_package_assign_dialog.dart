import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../common/api/api_mixins.dart';
import '../../../../common/api/l10n.dart';

class AppPackageAssignDialog extends StatefulWidget {
  final void Function() callback;
  final AppPackage appPackage;

  const AppPackageAssignDialog(
      {super.key, required this.appPackage, required this.callback});
  @override
  State<AppPackageAssignDialog> createState() => _AppPackageAssignDialogState();
}

class _AppPackageAssignDialogState extends State<AppPackageAssignDialog>
    with SingleRequestMixin<AppPackageAssignDialog, AssignAppPackageResponse> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  late int appID;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
        request: (client, option) {
          return client.assignAppPackage(
            AssignAppPackageRequest(
              appId: InternalID(id: $fixnum.Int64(appID)),
              appPackageId: widget.appPackage.id,
            ),
            options: option,
          );
        },
      ).then((value) {
        widget.callback();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('绑定应用'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Name: ${widget.appPackage.name}'),
              Text('ID: ${widget.appPackage.id.id.toHexString()}'),
              Text(
                  'Source: ${appPackageSourceString(widget.appPackage.source)}'),
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
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isError && !loading ? 48 : 0,
                child: isError && !loading
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            Text(response.error ?? '未知错误'),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: submit,
          child:
              loading ? const CircularProgressIndicator() : const Text('应用更改'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('取消'),
        )
      ],
    );
  }
}
