import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';

import '../../bloc/netzach/netzach_bloc.dart';
import '../../model/netzach_model.dart';
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
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('级别'),
                      const SizedBox(width: 8),
                      MultiSelectContainer(
                        prefix: MultiSelectPrefix(
                          selectedPrefix: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                        items: [
                          MultiSelectCard(
                            value: SystemNotificationLevel
                                .SYSTEM_NOTIFICATION_LEVEL_ONGOING,
                            label: systemNotificationLevelString(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_ONGOING),
                            selected: filter.levelFilter.contains(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_ONGOING),
                          ),
                          MultiSelectCard(
                            value: SystemNotificationLevel
                                .SYSTEM_NOTIFICATION_LEVEL_ERROR,
                            label: systemNotificationLevelString(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_ERROR),
                            selected: filter.levelFilter.contains(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_ERROR),
                          ),
                          MultiSelectCard(
                            value: SystemNotificationLevel
                                .SYSTEM_NOTIFICATION_LEVEL_WARNING,
                            label: systemNotificationLevelString(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_WARNING),
                            selected: filter.levelFilter.contains(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_WARNING),
                          ),
                          MultiSelectCard(
                            value: SystemNotificationLevel
                                .SYSTEM_NOTIFICATION_LEVEL_INFO,
                            label: systemNotificationLevelString(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_INFO),
                            selected: filter.levelFilter.contains(
                                SystemNotificationLevel
                                    .SYSTEM_NOTIFICATION_LEVEL_INFO),
                          ),
                        ],
                        onChange: (allSelectedItems, selectedItem) {
                          context.read<NetzachBloc>().add(
                                NetzachSystemNotificationFilterSetEvent(
                                  SystemNotificationFilter(
                                    levelFilter: allSelectedItems,
                                    typeFilter: filter.typeFilter,
                                  ),
                                ),
                              );
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('类型'),
                      const SizedBox(width: 8),
                      MultiSelectContainer(
                        prefix: MultiSelectPrefix(
                          selectedPrefix: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                        items: [
                          MultiSelectCard(
                            value: SystemNotificationType
                                .SYSTEM_NOTIFICATION_TYPE_USER,
                            label: systemNotificationTypeString(
                                SystemNotificationType
                                    .SYSTEM_NOTIFICATION_TYPE_USER),
                            selected: filter.typeFilter.contains(
                                SystemNotificationType
                                    .SYSTEM_NOTIFICATION_TYPE_USER),
                          ),
                          MultiSelectCard(
                            value: SystemNotificationType
                                .SYSTEM_NOTIFICATION_TYPE_SYSTEM,
                            label: systemNotificationTypeString(
                                SystemNotificationType
                                    .SYSTEM_NOTIFICATION_TYPE_SYSTEM),
                            selected: filter.typeFilter.contains(
                                SystemNotificationType
                                    .SYSTEM_NOTIFICATION_TYPE_SYSTEM),
                          ),
                        ],
                        onChange: (allSelectedItems, selectedItem) {
                          context.read<NetzachBloc>().add(
                                NetzachSystemNotificationFilterSetEvent(
                                  SystemNotificationFilter(
                                    levelFilter: filter.levelFilter,
                                    typeFilter: allSelectedItems,
                                  ),
                                ),
                              );
                        },
                      ),
                    ],
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
                  DynMouseScroll(
                    builder: (context, controller, physics) {
                      return ListView.builder(
                        controller: controller,
                        physics: physics,
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
                                leading:
                                    _systemNotificationLevelIcon(item.level),
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
                                    child: Text(item.content),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
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
