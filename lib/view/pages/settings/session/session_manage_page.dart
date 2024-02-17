import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../model/common_model.dart';
import '../../../../route.dart';
import '../../../helper/duration_format.dart';
import '../../../helper/spacing.dart';

class SessionManagePage extends StatelessWidget {
  const SessionManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<TipherethBloc>().add(TipherethLoadSessionsEvent());
      }
      final listData = state.sessions ?? [];
      final deviceInfo = context.read<MainBloc>().state.deviceInfo ??
          const ClientDeviceInfo('', '');
      return Scaffold(
        body: Stack(children: [
          if (state is TipherethLoadSessionsState && state.processing)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (state is TipherethLoadSessionsState && state.failed)
            Center(
              child: Text(S.of(context).loadFailed(state.msg.toString())),
            )
          else
            ListView(children: [
              Card(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.only(bottom: 8),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 36, 8, 36),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).currentDevice,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              maxLines: 2,
                            ),
                            Text(
                              deviceInfo.deviceName.isNotEmpty ||
                                      deviceInfo.systemVersion.isNotEmpty
                                  ? '${deviceInfo.deviceName} ${deviceInfo.systemVersion}'
                                  : S.of(context).unknownDevice,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              ListView.builder(
                itemCount: listData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = listData.elementAt(index);

                  void openEditPage() {
                    context
                        .read<TipherethBloc>()
                        .add(TipherethSetSessionEditIndexEvent(index));
                    AppRoutes.settingsSessionEdit().go(context);
                  }

                  if (item.deviceInfo.deviceId ==
                      context.read<MainBloc>().state.currentDeviceId) {
                    return const SizedBox();
                  }

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      borderRadius: SpacingHelper.defaultBorderRadius,
                      onTap: openEditPage,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(children: [
                          SizedBox(
                            width: 64,
                            height: 64,
                            child: _systemIcon(item.deviceInfo.systemType),
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
                              Text(
                                item.deviceInfo.deviceName.isNotEmpty ||
                                        item.deviceInfo.systemVersion.isNotEmpty
                                    ? '${item.deviceInfo.deviceName} ${item.deviceInfo.systemVersion}'
                                    : S.of(context).unknownDevice,
                              ),
                              Text(
                                item.deviceInfo.clientName.isNotEmpty ||
                                        item.deviceInfo.clientVersion.isNotEmpty
                                    ? '${item.deviceInfo.clientName} ${item.deviceInfo.clientVersion}'
                                    : S.of(context).unknownClient,
                              ),
                              Text(
                                '${DurationHelper.recentString(
                                  item.createTime.toDateTime(toLocal: true),
                                )}${item.expireTime.toDateTime(
                                      toLocal: true,
                                    ).isBefore(
                                      DateTime.now(),
                                    ) ? ' · ${S.of(context).loginExpired}' : ''}',
                              ),
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
                  );
                },
              ),
            ]),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TipherethBloc>().add(TipherethLoadSessionsEvent());
          },
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}

Widget _systemIcon(SystemType type) {
  switch (type) {
    case SystemType.SYSTEM_TYPE_UNSPECIFIED:
      return Icon(const FaIcon(FontAwesomeIcons.question).icon);
    case SystemType.SYSTEM_TYPE_ANDROID:
      return Icon(const FaIcon(FontAwesomeIcons.android).icon);
    case SystemType.SYSTEM_TYPE_IOS:
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(const FaIcon(FontAwesomeIcons.apple).icon, size: 12),
          Icon(const FaIcon(FontAwesomeIcons.mobileScreenButton).icon,
              size: 32),
        ],
      );
    case SystemType.SYSTEM_TYPE_WINDOWS:
      return Icon(const FaIcon(FontAwesomeIcons.windows).icon);
    case SystemType.SYSTEM_TYPE_MACOS:
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(const FaIcon(FontAwesomeIcons.apple).icon, size: 12),
          Icon(const FaIcon(FontAwesomeIcons.laptop).icon),
        ],
      );
    case SystemType.SYSTEM_TYPE_LINUX:
      return Icon(const FaIcon(FontAwesomeIcons.linux).icon);
    case SystemType.SYSTEM_TYPE_WEB:
      return Icon(const FaIcon(FontAwesomeIcons.chrome).icon);
  }
  return Icon(const FaIcon(FontAwesomeIcons.question).icon);
}
