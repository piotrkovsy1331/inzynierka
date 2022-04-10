import 'package:inzynierka/models/enums/meal.dart';

class MealDay {
  MealDay(this.dateAdded, this.addedBy, this.mealList);
  DateTime dateAdded;
  String addedBy;
  List<Meal> mealList;
}
