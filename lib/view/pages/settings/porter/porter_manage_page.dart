import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../helper/spacing.dart';
import '../../frame_page.dart';

class PorterManagePage extends StatelessWidget {
  const PorterManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<TipherethBloc>().add(TipherethLoadPortersEvent());
      }
      final listData = state.porters ?? [];
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Stack(children: [
            if (state is TipherethLoadPortersState && state.processing)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is TipherethLoadPortersState && state.failed)
              Center(
                child: Text('加载失败: ${state.msg}'),
              )
            else
              ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  final item = listData.elementAt(index);

                  void openEditPage() {
                    context
                        .read<TipherethBloc>()
                        .add(TipherethSetPorterEditIndexEvent(index));
                    const SettingsFunctionRoute(SettingsFunctions.porter,
                            action: SettingsActions.porterEdit)
                        .go(context);
                    FramePage.of(context)?.openDrawer();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      margin: EdgeInsets.zero,
                      shadowColor:
                          _porterConnectionStatusColor(item.connectionStatus),
                      child: InkWell(
                        borderRadius: SpacingHelper.defaultBorderRadius,
                        onTap: openEditPage,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(children: [
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: _porterConnectionStatusIcon(
                                  item.connectionStatus),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.id.id.toHexString(),
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 10,
                                      color: Theme.of(context).disabledColor),
                                  maxLines: 2,
                                ),
                                Text(item.name),
                                Text(item.version),
                                Text(porterConnectionStatusString(
                                    item.connectionStatus)),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: IconButton(
                                onPressed: openEditPage,
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TipherethBloc>().add(TipherethLoadPortersEvent());
          },
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}

Color _porterConnectionStatusColor(PorterConnectionStatus status) {
  switch (status) {
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_UNSPECIFIED:
      return Colors.grey;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_CONNECTED:
      return Colors.green;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DISCONNECTED:
      return Colors.yellow;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVE:
      return Colors.blue;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVATION_FAILED:
      return Colors.red;
  }
  return Colors.grey;
}

Widget _porterConnectionStatusIcon(PorterConnectionStatus status) {
  switch (status) {
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_UNSPECIFIED:
      return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_CONNECTED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCirclePlus).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DISCONNECTED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleXmark).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVE:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleCheck).icon);
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVATION_FAILED:
      return Icon(const FaIcon(FontAwesomeIcons.plugCircleExclamation).icon);
  }
  return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
}
