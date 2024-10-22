import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/client_setting/client_setting_bloc.dart';

enum UIDesign {
  material,
  fluent,
}

class UniversalUI {
  UniversalUI(this.design, this.materialTheme);

  final UIDesign design;
  final material.VisualDensity visualDensity =
      material.VisualDensity.adaptivePlatformDensity;
  final material.ThemeData materialTheme;

  static UniversalUI of(BuildContext context) {
    try {
      if (context.read<ClientSettingBloc>().state.useFluentUI ?? false) {
        return UniversalUI(UIDesign.fluent, material.Theme.of(context));
      }
      return UniversalUI(UIDesign.material, material.Theme.of(context));
    } catch (e) {
      return UniversalUI(UIDesign.material, material.Theme.of(context));
    }
  }

  BorderRadius get defaultBorderRadius => BorderRadius.circular(
        design == UIDesign.material ? 8 : 4,
      );
  RoundedRectangleBorder get defaultShape => RoundedRectangleBorder(
        borderRadius: defaultBorderRadius,
      );
  Color? get appBarBackgroundColor => design == UIDesign.material
      ? materialTheme.appBarTheme.backgroundColor
      : material.Colors.transparent;
}
