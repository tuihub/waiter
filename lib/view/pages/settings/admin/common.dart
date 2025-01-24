import 'package:flutter/material.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../../l10n/l10n.dart';

class AdminAreaWarning extends StatelessWidget {
  const AdminAreaWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return UniversalListTile(
      leading: Icon(UniversalUI.of(context).icons.warning),
      title: Text(S.of(context).adminAreaWarning('')),
    );
  }
}
