import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';

enum TimeRangeEnum {
  today,
  yesterday,
  dayBeforeYestrday,
  treeDaysEarlier,
}

extension TimeRangeExtension on TimeRangeEnum {
  String get name => describeEnum(this);

  DateTime get returnTime {
    switch (this) {
      case TimeRangeEnum.today:
        return Jiffy().endOf(Units.DAY).dateTime.toUtc();

      case TimeRangeEnum.yesterday:
        return Jiffy().subtract(days: 1).endOf(Units.DAY).dateTime.toUtc();

      case TimeRangeEnum.dayBeforeYestrday:
        return Jiffy().subtract(days: 3).endOf(Units.DAY).dateTime.toUtc();

      case TimeRangeEnum.treeDaysEarlier:
        return Jiffy().subtract(days: 2).endOf(Units.DAY).dateTime.toUtc();
    }
  }
}
