import 'package:flutter/foundation.dart';

enum MealTypeName { breakfast, lunch, dinner, supper, tea }

extension MealTypeNameExtension on MealTypeName {
  String get name => describeEnum(this);
  String get displayName {
    switch (this) {
      case MealTypeName.breakfast:
        return 'śniadanie';
      case MealTypeName.lunch:
        return 'luch';
      case MealTypeName.dinner:
        return 'obiad';
      case MealTypeName.supper:
        return 'kolacja';
      case MealTypeName.tea:
        return 'podwieczorek';
      default:
        return 'Selected Title is null';
    }
  }
}
