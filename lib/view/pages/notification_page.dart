import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';

import '../../bloc/netzach/netzach_bloc.dart';
import '../../repo/grpc/l10n.dart';
import '../helper/duration_format.dart';
import '../helper/spacing.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<NetzachBloc, NetzachState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<NetzachBloc>().add(NetzachSystemNotificationLoadEvent(1));
      }
      final listData = state.systemNotifications ?? [];
      final filter =
          state.systemNotificationFilter ?? SystemNotificationFilter();
      return Scaffold(
        appBar: AppBar(
          title: const Text('通知'),
          shape: RoundedRectangleBorder(
            borderRadius: SpacingHelper.defaultBorderRadius,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: SpacingHelper.defaultBorderRadius,
                    ),
                    child: MultiSelectDialogField(
                      title: const Text('按通知级别筛选'),
                      buttonText: const Text('级别'),
                      buttonIcon: const Icon(Icons.filter_alt_outlined),
                      items: [
                        MultiSelectItem(
                          SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_ERROR,
                          systemNotificationLevelString(SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_ERROR),
                        ),
                        MultiSelectItem(
                          SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_WARNING,
                          systemNotificationLevelString(SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_WARNING),
                        ),
                        MultiSelectItem(
                          SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_INFO,
                          systemNotificationLevelString(SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_INFO),
                        ),
                        MultiSelectItem(
                          SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_ONGOING,
                          systemNotificationLevelString(SystemNotificationLevel
                              .SYSTEM_NOTIFICATION_LEVEL_ONGOING),
                        ),
                      ],
                      onConfirm: (values) {
                        context.read<NetzachBloc>().add(
                              NetzachSystemNotificationFilterSetEvent(
                                SystemNotificationFilter(
                                  levelFilter:
                                      values.cast<SystemNotificationLevel>(),
                                  typeFilter: filter.typeFilter,
                                ),
                              ),
                            );
                      },
                      decoration: BoxDecoration(
                        borderRadius: SpacingHelper.defaultBorderRadius,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: SpacingHelper.defaultBorderRadius,
                    ),
                    child: MultiSelectDialogField(
                      title: const Text('按通知类型筛选'),
                      buttonText: const Text('类型'),
                      buttonIcon: const Icon(Icons.filter_alt_outlined),
                      items: [
                        MultiSelectItem(
                          SystemNotificationType
                              .SYSTEM_NOTIFICATION_TYPE_SYSTEM,
                          systemNotificationTypeString(SystemNotificationType
                              .SYSTEM_NOTIFICATION_TYPE_SYSTEM),
                        ),
                        MultiSelectItem(
                          SystemNotificationType.SYSTEM_NOTIFICATION_TYPE_USER,
                          systemNotificationTypeString(SystemNotificationType
                              .SYSTEM_NOTIFICATION_TYPE_USER),
                        ),
                      ],
                      onConfirm: (values) {
                        context.read<NetzachBloc>().add(
                              NetzachSystemNotificationFilterSetEvent(
                                SystemNotificationFilter(
                                  levelFilter: filter.levelFilter,
                                  typeFilter:
                                      values.cast<SystemNotificationType>(),
                                ),
                              ),
                            );
                      },
                      decoration: BoxDecoration(
                        borderRadius: SpacingHelper.defaultBorderRadius,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(children: [
                if (state is NetzachSystemNotificationLoadState &&
                    state.processing)
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
                          child: ExpansionTile(
                            leading: _systemNotificationLevelIcon(item.level),
                            title: Text(item.title),
                            subtitle: Text(
                              '${item.id.id.toHexString()} · ${DurationHelper.recentString(item.createTime.toDateTime())}',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10,
                                  color: Theme.of(context).disabledColor),
                              maxLines: 2,
                            ),
                            expandedAlignment: Alignment.centerLeft,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(item.message),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context
                .read<NetzachBloc>()
                .add(NetzachSystemNotificationLoadEvent(1));
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
