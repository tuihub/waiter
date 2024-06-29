import 'package:flutter/material.dart';

import '../../common/platform.dart';
import '../helper/spacing.dart';
import '../layout/overlapping_panels.dart';

class AppBarHelper {
  static RoundedRectangleBorder defaultShape = RoundedRectangleBorder(
    borderRadius: SpacingHelper.defaultBorderRadius,
  );
  static Widget? defaultMainLeading(BuildContext context,
      {void Function()? onPressed}) {
    if (PlatformHelper.isAndroid() || onPressed != null) {
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
