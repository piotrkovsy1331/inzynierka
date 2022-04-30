import 'package:jiffy/jiffy.dart';



class TimeRangeHelper {
  static DateTime returnCurrentDate(DateTime date) {
    return date;
  }

  static DateTime returnYestardayDate( DateTime date) {
    return Jiffy(date).subtract(days: 1).endOf(Units.DAY).dateTime.toUtc();
  }

  static DateTime returnTwoDaysBeforeDate(DateTime date) {
    return Jiffy(date).subtract(days: 2).endOf(Units.DAY).dateTime.toUtc();
  }

  static DateTime returnTreeDaysBeforeDate(DateTime date) {
    return Jiffy(date).subtract(days: 3).endOf(Units.DAY).dateTime.toUtc();
  }
}
