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
}
