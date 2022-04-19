import 'package:inzynierka/models/meal.dart';

class MealDay {
  MealDay(
      {required this.dateAdded, required this.addedBy, required this.mealList});
  final int dateAdded;
  final String addedBy;
  final List<Meal>? mealList;

  MealDay copyWith({
    int? dateAdded,
    String? addedBy,
    List<Meal>? mealList,
  }) {
    return MealDay(
        dateAdded: dateAdded ?? this.dateAdded,
        addedBy: addedBy ?? this.addedBy,
        mealList: mealList ?? this.mealList);
  }
}
