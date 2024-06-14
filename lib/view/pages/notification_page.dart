import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pbenum.dart';

import '../../bloc/netzach/netzach_bloc.dart';
import '../helper/duration_format.dart';
import '../helper/spacing.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<NetzachBloc, NetzachState>(
        builder: (context, state) {
          if (firstBuild) {
            firstBuild = false;
            context.read<NetzachBloc>().add(NetzachSystemNotificationLoadEvent(1));
          }
          final listData = state.systemNotifications ?? [];
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(children: [
                if (state is NetzachSystemNotificationLoadState && state.processing)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (state is NetzachSystemNotificationLoadState && state.failed)
                  Center(
                    child: Text('加载失败: ${state.msg}'),
                  )
                else if (listData.isEmpty)
                  const Center(
                    child: Text('暂无通知'),
                  )
                else
                  ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      final item = listData.elementAt(index);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          margin: EdgeInsets.zero,
                          shadowColor:
                          _systemNotificationLevelColor(item.level),
                          child: InkWell(
                            borderRadius: SpacingHelper.defaultBorderRadius,
                            onTap: null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(children: [
                                SizedBox(
                                  width: 64,
                                  height: 64,
                                  child: _systemNotificationLevelIcon(
                                      item.level),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.id.id.toHexString() + ' · ' + DurationHelper.recentString(
                                          item.createTime.toDateTime()),
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10,
                                          color: Theme.of(context).disabledColor),
                                      maxLines: 2,
                                    ),
                                    Text(item.title),
                                    if (item.message.isNotEmpty)
                                    Text(item.message),
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
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
                context.read<NetzachBloc>().add(NetzachSystemNotificationLoadEvent(1));
              },
              child: const Icon(Icons.refresh),
            ),
          );
        });
  }
}

Color _systemNotificationLevelColor(SystemNotificationLevel level) {
  switch (level) {
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED:
      return Colors.grey;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ONGOING:
      return Colors.green;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_INFO:
      return Colors.blue;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_WARNING:
      return Colors.yellow;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ERROR:
      return Colors.red;
  }
  return Colors.grey;
}

Widget _systemNotificationLevelIcon(SystemNotificationLevel level) {
  switch (level) {
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED:
      return Icon(const FaIcon(FontAwesomeIcons.message).icon);
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ONGOING:
      return Icon(const FaIcon(FontAwesomeIcons.hourglassHalf).icon);
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_INFO:
      return Icon(const FaIcon(FontAwesomeIcons.check).icon);
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_WARNING:
      return Icon(const FaIcon(FontAwesomeIcons.exclamation).icon);
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ERROR:
      return Icon(const FaIcon(FontAwesomeIcons.xmark).icon);
  }
  return Icon(const FaIcon(FontAwesomeIcons.plug).icon);
}
