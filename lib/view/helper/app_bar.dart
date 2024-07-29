import 'package:flutter/material.dart';

import '../layout/overlapping_panels.dart';
import 'spacing.dart';

class AppBarHelper {
  static RoundedRectangleBorder defaultShape = RoundedRectangleBorder(
    borderRadius: SpacingHelper.defaultBorderRadius,
  );
  static Widget? defaultMainLeading(BuildContext context,
      {void Function()? onPressed}) {
    if (OverlappingPanels.of(context) != null || onPressed != null) {
      return IconButton(
        onPressed: onPressed ??
            () {
              OverlappingPanels.of(context)?.reveal(RevealSide.left);
            },
        icon: const Icon(Icons.arrow_back),
      );
    }
    return null;
  }
}
