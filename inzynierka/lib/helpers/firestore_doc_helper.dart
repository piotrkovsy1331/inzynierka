import 'package:inzynierka/models/meal.dart';
import 'package:inzynierka/models/user_data.dart';

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
  static final emptyUserData = UserData(
      firstName: '',
      secondName: '',
      heightValue: 0,
      weightValue: 0,
      ageValue: 0,
      dailyCaloriesLimit: 0);
}
