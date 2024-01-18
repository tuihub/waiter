import 'package:intl/intl.dart';

import '../pages/yesod/yesod_timeline_page.dart';

class DurationHelper {
  static String recentString(DateTime dateTime) {
    final duration = DateTime.now().difference(dateTime);
    return format(duration);
  }

  static String format(Duration duration) {
    final minutes = duration.inMinutes;
    final hours = duration.inHours;
    final days = duration.inDays;
    final months = duration.inDays ~/ 30;
    const maxMinutes = 60;
    const maxHours = 24;
    const maxDays = 30;

    if (minutes <= 1) {
      return '刚刚';
    } else if (minutes < maxMinutes) {
      return '$minutes 分钟前';
    } else if (hours < maxHours) {
      return '$hours 小时前';
    } else if (days < maxDays) {
      return '$days 天前';
    } else {
      return '$months 个月前';
    }
  }

  static String timeLineString(GroupType config,DateTime dateTime){
    switch (config){
      case GroupType.byDay:
        return DateFormat('yyyy年MM月dd日').format(dateTime);
      case GroupType.byMonth:
        return DateFormat('yyyy年MM月').format(dateTime);
      case GroupType.byYear:
        return DateFormat('yyyy年').format(dateTime);
    }

  }
}
