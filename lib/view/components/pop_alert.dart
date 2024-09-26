import 'package:flutter/material.dart';

class PopAlert extends StatelessWidget {
  const PopAlert({
    super.key,
    required this.child,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.onDeny,
    required this.onCancel,
  });

  final Widget child;
  final String title;
  final String content;
  final void Function() onConfirm;
  final void Function()? onDeny;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).pop(true),
                    onConfirm(),
                  },
                  child: const Text('是'),
                ),
                if (onDeny != null)
                  TextButton(
                    onPressed: () => {
                      Navigator.of(context).pop(true),
                      onDeny!(),
                    },
                    child: const Text('否'),
                  ),
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).pop(false),
                    onCancel(),
                  },
                  child: const Text('点错了'),
                ),
              ],
            );
          },
        );
        return shouldPop ?? false;
      },
      child: child,
    );
  }
}
