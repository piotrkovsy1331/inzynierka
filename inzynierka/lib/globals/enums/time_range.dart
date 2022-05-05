import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';

enum TimeRange {
  currentWeek,
  previousWeek,
  currentMonth,
  previousMonth,
}

extension TimeRangeExtension on TimeRange {
  String get name => describeEnum(this);
  TimeInterval get returnTimeRange {
    switch (this) {
      case TimeRange.currentWeek:
        return TimeInterval(
          startDate:
              Jiffy().subtract(days: 6).startOf(Units.DAY).dateTime.toUtc(),
          endDate: Jiffy().endOf(Units.DAY).dateTime.toUtc(),
        );
      case TimeRange.previousWeek:
        return TimeInterval(
          startDate:
              Jiffy().subtract(days: 13).startOf(Units.DAY).dateTime.toUtc(),
          endDate:
              Jiffy().subtract(days: 6).startOf(Units.DAY).dateTime.toUtc(),
        );
      case TimeRange.currentMonth:
        return TimeInterval(
          startDate:
              Jiffy().subtract(months: 1).startOf(Units.DAY).dateTime.toUtc(),
          endDate: Jiffy().endOf(Units.DAY).dateTime.toUtc(),
        );
      case TimeRange.previousMonth:
        return TimeInterval(
          startDate:
              Jiffy().subtract(months: 2).startOf(Units.DAY).dateTime.toUtc(),
          endDate:
              Jiffy().subtract(months: 1).startOf(Units.DAY).dateTime.toUtc(),
        );
    }
  }
}

class TimeInterval {
  TimeInterval({required this.startDate, required this.endDate});
  DateTime startDate;
  DateTime endDate;
}
