import 'package:flutter/foundation.dart';

enum MealTypeNameEnum { breakfast, lunch, dinner, supper, tea }

extension MealTypeNameEnumExtension on MealTypeNameEnum {
  String get name => describeEnum(this);
  String get displayName {
    switch (this) {
      case MealTypeNameEnum.breakfast:
        return 'śniadanie';
      case MealTypeNameEnum.lunch:
        return 'lunch';
      case MealTypeNameEnum.dinner:
        return 'obiad';
      case MealTypeNameEnum.supper:
        return 'kolacja';
      case MealTypeNameEnum.tea:
        return 'podwieczorek';
      default:
        return 'Selected Title is null';
    }
  }
}
