import 'package:flutter/material.dart';

import 'layout.dart';

class BootstrapToast {
  const BootstrapToast({
    required this.title,
    required this.message,
    this.action,
    this.showCloseIcon = false,
  });

  final String title;
  final String message;
  final SnackBarAction? action;
  final bool showCloseIcon;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    final List<Widget> maybeActionAndIcon = <Widget>[
      if (action != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextButtonTheme(
            data: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            child: action!,
          ),
        ),
      if (showCloseIcon)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextButtonTheme(
            data: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            child: TextButton(
              onPressed: () => ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss),
              child: const Text('关闭'),
            ),
          ),
        ),
    ];

    return BootstrapContainer(
      alignment: Alignment.centerRight,
      children: [
        const BootstrapColumn(xs: 0, sm: 6, md: 8, child: SizedBox()),
        Expanded(
          child: BootstrapColumn(
            xs: 12,
            sm: 6,
            md: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceTint,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (title.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Text(message),
                  if (maybeActionAndIcon.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [...maybeActionAndIcon],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
