import 'dart:async';

import 'package:dao/dao.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../common/bloc_event_status_mixin.dart';
import '../../../../l10n/l10n.dart';

import '../../../layout/bootstrap_container.dart';
import '../../../layout/card_list_page.dart';

part 'server_select_manual_add_dialog.dart';
part 'server_select_login_page.dart';
part 'server_select_link_add_dialog.dart';

class ServerSelectPage extends StatelessWidget {
  const ServerSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return ListManagePage(
          title: '服务端选择',
          processing: false,
          onAdd: () async {
            final navigator = Navigator.of(context);
            await showDialog(
              context: context,
              builder: (context) {
                return ServerManualAddDialog(navigator);
              },
            );
          },
          children: [
            for (final server in state.knownServers.values)
              UniversalListTile(
                title: Text('${server.host}:${server.port}'),
                subtitle: Text(server.username),
                trailing: UniversalToolBar(
                  mainAxisAlignment: MainAxisAlignment.end,
                  primaryItems: [
                    if (server.serverID == state.currentServer)
                      UniversalToolBarItem(
                        icon: UniversalIcon(context).check,
                        label: const Text('当前'),
                      )
                    else
                      UniversalToolBarItem(
                        icon: UniversalIcon(context).arrowRight,
                        label: const Text('切换'),
                        onPressed: () async {
                          context
                              .read<MainBloc>()
                              .add(MainLoginEvent(null, serverConfig: server));
                        },
                      ),
                  ],
                  secondaryItems: [
                    UniversalToolBarItem(
                      icon: UniversalIcon(context).edit,
                      label: const Text('编辑'),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return _TipherethServerEditDialog(server: server);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _TipherethServerEditDialog extends StatelessWidget {
  const _TipherethServerEditDialog({required this.server});

  final ServerConfig server;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('服务器信息'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${server.host}:${server.port}'),
          Text(server.username),
        ],
      ),
    );
  }
}
