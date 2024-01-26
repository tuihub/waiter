import '../../l10n/l10n.dart';

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
      return S.current.durationJustNow;
    } else if (minutes < maxMinutes) {
      return S.current.durationMinutes(minutes);
    } else if (hours < maxHours) {
      return S.current.durationHours(hours);
    } else if (days < maxDays) {
      return S.current.durationDays(days);
    } else {
      return S.current.durationMonths(months);
    }
  }
}
