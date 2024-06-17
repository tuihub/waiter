import 'package:flutter/material.dart';

import '../layout/bootstrap_breakpoints.dart';

class Toast {
  const Toast({
    required this.title,
    required this.message,
    this.action,
  });

  final String title;
  final String message;
  final SnackBarAction? action;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      BuildContext context) {
    final left = calculateColumnWidth(
      xxs: 0,
      sm: 6,
      md: 8,
      xl: 10,
      containerWidth: MediaQuery.of(context).size.width,
    );
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        margin: EdgeInsets.only(left: left),
        behavior: SnackBarBehavior.floating,
        hitTestBehavior: HitTestBehavior.deferToChild,
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
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
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
          IconButton(
            icon: const Icon(Icons.close),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () => ScaffoldMessenger.of(context)
                .hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss),
          ),
        ],
      ),
    );
  }
}
