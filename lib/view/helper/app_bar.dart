import 'package:flutter/material.dart';

import '../layout/overlapping_panels.dart';
import '../universal/button.dart';

class AppBarHelper {
  static RoundedRectangleBorder defaultShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  static Widget? defaultMainLeading(
    BuildContext context, {
    void Function()? onPressed,
  }) {
    if (OverlappingPanels.of(context) == null) {
      return null;
    }
    return _defaultLeading(
      context,
      onPressed ??
          () {
            OverlappingPanels.of(context)?.reveal(RevealSide.left);
          },
    );
  }

  static Widget? defaultRightLeading(
    BuildContext context, {
    void Function()? onPressed,
  }) {
    if (OverlappingPanels.of(context) == null) {
      return null;
    }
    return _defaultLeading(
      context,
      onPressed ??
          () {
            OverlappingPanels.of(context)?.reveal(RevealSide.main);
          },
    );
  }

  static Widget? _defaultLeading(
    BuildContext context,
    void Function()? onPressed,
  ) {
    if (onPressed != null) {
      return UniversalIconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
      );
    }
    return null;
  }
}
