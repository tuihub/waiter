import 'dart:async';

import 'package:file_sizes/file_sizes.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../common/platform.dart';
import '../../../../consts.dart';
import '../../../../l10n/l10n.dart';
import '../../../../service/di_service.dart';
import '../../../helper/app_bar.dart';
import '../../../specialized/theme_presentation.dart';

part 'cache_setting.dart';
part 'chore_setting.dart';
part 'theme_setting.dart';

class ClientSettingPage extends StatelessWidget {
  const ClientSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).clientSetting),
        shape: UniversalUI.of(context).defaultShape,
        backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
        automaticallyImplyLeading: false,
        leading: AppBarHelper.defaultMainLeading(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return ListView(
              children: const [
                ThemeSetting(),
                SizedBox(height: 8),
                CacheSetting(),
                SizedBox(height: 8),
                ChoreSetting(),
              ],
            );
          },
        ),
      ),
    );
  }
}
