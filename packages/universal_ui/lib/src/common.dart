import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

part 'icons.dart';

enum UIDesign {
  material,
  fluent,
}

class UIDesignProvider extends InheritedWidget {
  const UIDesignProvider({
    required this.design,
    required super.child,
    super.key,
  });

  final UIDesign design;

  static UIDesign of(BuildContext context) {
    final UIDesignProvider? provider =
        context.dependOnInheritedWidgetOfExactType<UIDesignProvider>();
    return provider?.design ?? UIDesign.material;
  }

  @override
  bool updateShouldNotify(covariant UIDesignProvider oldWidget) {
    return oldWidget.design != design;
  }
}

class UniversalUI {
  UniversalUI(this.design, this.materialTheme);

  final UIDesign design;
  final material.VisualDensity visualDensity =
      material.VisualDensity.adaptivePlatformDensity;
  final material.ThemeData materialTheme;

  static UniversalUI of(BuildContext context) {
    try {
      return UniversalUI(
          UIDesignProvider.of(context), material.Theme.of(context));
    } catch (e) {
      return UniversalUI(UIDesign.material, material.Theme.of(context));
    }
  }

  BorderRadius get defaultBorderRadius => BorderRadius.circular(
        design == UIDesign.material ? 8 : 4,
      );
  double get defaultPadding => design == UIDesign.material ? 16 : 8;
  RoundedRectangleBorder get defaultShape => RoundedRectangleBorder(
        borderRadius: defaultBorderRadius,
      );
  Color? get appBarBackgroundColor => design == UIDesign.material
      ? materialTheme.appBarTheme.backgroundColor
      : material.Colors.transparent;

  UniversalIcon get icons => UniversalIcon(design);
}
