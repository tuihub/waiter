import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

import 'card.dart';
import 'progress.dart';

class UniversalToast {
  static void show(
    BuildContext context, {
    String? title,
    required String message,
    Widget? icon,
    bool showProgressBar = true,
  }) {
    toastification.showCustom(
      context: context, // optional if you use ToastificationWrapper
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomRight,
      builder: (BuildContext context, ToastificationItem holder) {
        return MouseRegion(
          onEnter: (event) {
            holder.pause();
          },
          onExit: (event) {
            holder.start();
          },
          child: UniversalCard(
            margin: const EdgeInsets.all(4),
            child: Row(
              children: [
                if (icon != null) icon,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      Text(message),
                      if (showProgressBar)
                        ToastTimerAnimationBuilder(
                          item: holder,
                          builder: (context, value, _) {
                            return UniversalLinearProgressIndicator(
                                value: value);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
