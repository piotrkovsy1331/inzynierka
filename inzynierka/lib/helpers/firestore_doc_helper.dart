import 'package:inzynierka/models/meal.dart';

import '../models/details.dart';
import '../models/enums/meal_type_enum.dart';

class FireStoreDocHelper {
  static final emptyMealsList = [
    Meal(
        mealTypeName: MealTypeNameEnum.breakfast.displayName,
        mealDetails:
            Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0),
        productList: []),
    Meal(
        mealTypeName: MealTypeNameEnum.lunch.displayName,
        mealDetails:
            Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0),
        productList: []),
    Meal(
        mealTypeName: MealTypeNameEnum.dinner.displayName,
        mealDetails:
            Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0),
        productList: []),
    Meal(
        mealTypeName: MealTypeNameEnum.supper.displayName,
        mealDetails:
            Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0),
        productList: []),
    Meal(
        mealTypeName: MealTypeNameEnum.tea.displayName,
        mealDetails:
            Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0),
        productList: []),
  ];


}
