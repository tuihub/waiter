import 'package:dao/dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/netzach.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../bloc/netzach/netzach_bloc.dart';
import '../../common/bloc_event_status_mixin.dart';
import '../../l10n/librarian.dart';
import '../helper/duration_format.dart';
import '../layout/infinite_list_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _pageController = InfiniteListPage.defaultPagingController<Log>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetzachBloc, NetzachState>(listener: (context, state) {
      if (state is NetzachAggregationLogFilterSetState) {
        if (state.statusCode == EventStatus.success) {
          _pageController.refresh();
        }
      }
    }, builder: (context, state) {
      final levelFilter = state.logLevelFilter;
      return InfiniteListPage<Log>(
        title: '通知',
        pagingController: _pageController,
        loadPage: (pageNum) async {
          final items = await context
              .read<NetzachBloc>()
              .loadAggregationLog(null, pageNum);
          return (items, items.isEmpty);
        },
        topWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('级别'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: MultiSelectContainer(
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
                          value: LogLevel.ongoing,
                          label: systemNotificationLevelString(
                              SystemNotificationLevel
                                  .SYSTEM_NOTIFICATION_LEVEL_ONGOING),
                          selected: levelFilter.contains(LogLevel.ongoing),
                        ),
                        MultiSelectCard(
                          value: LogLevel.error,
                          label: systemNotificationLevelString(
                              SystemNotificationLevel
                                  .SYSTEM_NOTIFICATION_LEVEL_ERROR),
                          selected: levelFilter.contains(LogLevel.error),
                        ),
                        MultiSelectCard(
                          value: LogLevel.warning,
                          label: systemNotificationLevelString(
                              SystemNotificationLevel
                                  .SYSTEM_NOTIFICATION_LEVEL_WARNING),
                          selected: levelFilter.contains(LogLevel.warning),
                        ),
                        MultiSelectCard(
                          value: LogLevel.info,
                          label: systemNotificationLevelString(
                              SystemNotificationLevel
                                  .SYSTEM_NOTIFICATION_LEVEL_INFO),
                          selected: levelFilter.contains(LogLevel.info),
                        ),
                      ],
                      onChange: (allSelectedItems, selectedItem) {
                        context.read<NetzachBloc>().add(
                              NetzachAggregationLogFilterSetEvent(
                                null,
                                allSelectedItems,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
                height: 8,
              ),
              // Row(
              //   children: [
              //     const Text('类型'),
              //     const SizedBox(width: 8),
              //     Expanded(
              //       child: MultiSelectContainer(
              //         prefix: MultiSelectPrefix(
              //           selectedPrefix: const Padding(
              //             padding: EdgeInsets.only(right: 5),
              //             child: Icon(
              //               Icons.check,
              //               color: Colors.white,
              //               size: 14,
              //             ),
              //           ),
              //         ),
              //         items: [
              //           MultiSelectCard(
              //             value: SystemNotificationType
              //                 .SYSTEM_NOTIFICATION_TYPE_USER,
              //             label: systemNotificationTypeString(
              //                 SystemNotificationType
              //                     .SYSTEM_NOTIFICATION_TYPE_USER),
              //             selected: filter.typeFilter.contains(
              //                 SystemNotificationType
              //                     .SYSTEM_NOTIFICATION_TYPE_USER),
              //           ),
              //           MultiSelectCard(
              //             value: SystemNotificationType
              //                 .SYSTEM_NOTIFICATION_TYPE_SYSTEM,
              //             label: systemNotificationTypeString(
              //                 SystemNotificationType
              //                     .SYSTEM_NOTIFICATION_TYPE_SYSTEM),
              //             selected: filter.typeFilter.contains(
              //                 SystemNotificationType
              //                     .SYSTEM_NOTIFICATION_TYPE_SYSTEM),
              //           ),
              //         ],
              //         onChange: (allSelectedItems, selectedItem) {
              //           context.read<NetzachBloc>().add(
              //                 NetzachAggregationLogFilterSetEvent(
              //                   null,
              //                   SystemNotificationFilter(
              //                     levelFilter: filter.levelFilter,
              //                     typeFilter: allSelectedItems,
              //                   ),
              //                 ),
              //               );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        itemBuilder: (context, item, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _logLevelColor(item.level),
                    width: 1,
                  ),
                ),
                borderRadius: UniversalUI.of(context).defaultBorderRadius,
              ),
              child: UniversalExpansionTile(
                leading: _logLevelIcon(item.level),
                title: Text(item.title),
                subtitle: Text(
                  '${item.id} · ${DurationHelper.recentString(item.occurTime ?? item.logTime)}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10,
                      color: Theme.of(context).disabledColor),
                  maxLines: 2,
                ),
                children: [
                  if (item.message != null)
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(item.message ?? ''),
                    ),
                  if (item.stackTrace != null)
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(item.stackTrace ?? ''),
                    ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

Color _logLevelColor(LogLevel level) {
  switch (level) {
    case LogLevel.trace:
    case LogLevel.debug:
      return Colors.grey;
    case LogLevel.ongoing:
      return Colors.green;
    case LogLevel.info:
      return Colors.blue;
    case LogLevel.warning:
      return Colors.yellow;
    case LogLevel.error:
      return Colors.red;
  }
}

Widget _logLevelIcon(LogLevel level) {
  switch (level) {
    case LogLevel.trace:
    case LogLevel.debug:
      return Icon(const FaIcon(FontAwesomeIcons.message).icon);
    case LogLevel.ongoing:
      return Icon(const FaIcon(FontAwesomeIcons.hourglassHalf).icon);
    case LogLevel.info:
      return Icon(const FaIcon(FontAwesomeIcons.check).icon);
    case LogLevel.warning:
      return Icon(const FaIcon(FontAwesomeIcons.exclamation).icon);
    case LogLevel.error:
      return Icon(const FaIcon(FontAwesomeIcons.xmark).icon);
  }
}
