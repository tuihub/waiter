import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/client_setting/client_setting_bloc.dart';

enum UIDesign {
  material,
  fluent,
}

class UniversalUI {
  UniversalUI(this.design);

  final UIDesign design;

  static UniversalUI of(BuildContext context) {
    try {
      if (context.read<ClientSettingBloc>().state.useFluentUI ?? false) {
        return UniversalUI(UIDesign.fluent);
      }
      return UniversalUI(UIDesign.material);
    } catch (e) {
      return UniversalUI(UIDesign.material);
    }
  }
}
