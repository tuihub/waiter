import 'package:flutter/material.dart';

import 'package:universal_ui/universal_ui.dart';

class PopAlert extends StatelessWidget {
  const PopAlert({
    super.key,
    required this.builder,
    this.title = '保存更改？',
    this.content = '是否保存更改再退出',
    required this.onConfirm,
    this.onDeny,
    this.onCancel,
  });

  final Widget Function(BuildContext context, void Function() triggerPop)
      builder;
  final String title;
  final String content;
  final void Function() onConfirm;
  final void Function()? onDeny;
  final void Function()? onCancel;

  Future<bool?> _showDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return UniversalDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            UniversalDialogAction(
              onPressed: () => {
                Navigator.of(context).pop(true),
                onConfirm(),
              },
              isPrimary: true,
              child: const Text('是'),
            ),
            UniversalDialogAction(
              onPressed: () => {
                Navigator.of(context).pop(true),
                onDeny?.call(),
              },
              child: const Text('否'),
            ),
            UniversalDialogAction(
              onPressed: () => {
                Navigator.of(context).pop(false),
                onCancel?.call(),
              },
              child: const Text('点错了'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await _showDialog(context);
        return shouldPop ?? false;
      },
      child: builder(context, () async {
        final shouldPop = await _showDialog(context);
        if (shouldPop ?? false) {
          Navigator.of(context).pop();
        }
      }),
    );
  }
}
