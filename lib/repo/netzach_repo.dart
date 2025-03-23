import 'package:dao/dao.dart';
import 'package:fixnum/fixnum.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/netzach.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../model/common_model.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';
import '../service/log_service.dart';

class NetzachRepo {
  final DIProvider<LibrarianService> _api;
  final KVDao _kvDao;
  static const String _imagePath = 'libraryImage';

  static const _kvBucket = 'netzach';

  static const _aggregationLogPageSize = 20;

  NetzachRepo(this._api, this._kvDao);

  Future<List<Log>> loadAggregationLog(
    EventContext context,
    int pageNum,
    List<LogLevel> levelFilter,
    bool includeServerLogs,
  ) async {
    final resp = await _api.get(context.sid).doRequest(
        (client) => client.listSystemNotifications,
        ListSystemNotificationsRequest(
          paging: PagingRequest(
            pageSize: Int64(_aggregationLogPageSize),
            pageNum: Int64(pageNum),
          ),
          levelFilter: _toPBNotificationLevelFilter(levelFilter),
        ));
    switch (resp) {
      case Ok():
        await Logger.cacheServerLogs(
            context.sid,
            resp.v.notifications.map((e) {
              return Log(
                id: e.id.id.toInt(),
                level: _fromPBNotificationLevel(e.level),
                title: e.title,
                message: e.content,
                source: context.sid.toString(),
                occurTime: e.updateTime.toDateTime(),
                logTime: e.updateTime.toDateTime(),
              );
            }).toList());
      case Err():
        if (_api.get(context.sid).connectionStatus ==
            ConnectionStatus.connected) {
          Logger.warning('[API] Failed to download server log',
              message: resp.error, context: context.toString());
        }
    }
    return Logger.queryLogs(
      LogFilter(
        levels: levelFilter,
        limit: _aggregationLogPageSize,
        offset: (pageNum - 1) * _aggregationLogPageSize,
      ),
      serverIDs: includeServerLogs ? [context.sid.toString()] : null,
    );
  }

  List<SystemNotificationLevel>? _toPBNotificationLevelFilter(
      List<LogLevel>? levels) {
    if (levels == null) {
      return null;
    }
    final List<SystemNotificationLevel> result = [];
    for (final level in levels) {
      switch (level) {
        case LogLevel.info:
          result.add(SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_INFO);
        case LogLevel.warning:
          result.add(SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_WARNING);
        case LogLevel.error:
          result.add(SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ERROR);
        case LogLevel.ongoing:
          result.add(SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ONGOING);
        case LogLevel.trace:
        case LogLevel.debug:
      }
    }
    return result;
  }

  LogLevel _fromPBNotificationLevel(SystemNotificationLevel level) {
    switch (level) {
      case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_INFO:
        return LogLevel.info;
      case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_WARNING:
        return LogLevel.warning;
      case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ERROR:
        return LogLevel.error;
      case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ONGOING:
        return LogLevel.ongoing;
      case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED:
        return LogLevel.info;
    }
    return LogLevel.info;
  }
}
