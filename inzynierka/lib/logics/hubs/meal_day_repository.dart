import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inzynierka/logics/firebase_schema/collections.dart';
import 'package:inzynierka/models/dto/meal_day_dto.dart';
import 'package:inzynierka/models/enums/meal_type_enum.dart';
import 'package:inzynierka/models/meal.dart';
import 'package:inzynierka/models/meal_day.dart';
import 'package:inzynierka/models/product.dart';
import '../../models/details.dart';

class MealDayRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // MealDayRepository(this._firebaseAuth, this._firebaseFirestore);

  Future<void> addProduct(
      String mealTypeName, Product product, DateTime dayAdded) async {
    try {
      CollectionReference _mealDayCollection =
          _firebaseFirestore.collection(Collections.mealDay);
      final DocumentSnapshot snapshot = await _mealDayCollection
          .doc(dayAdded.millisecondsSinceEpoch.toString())
          .get();
      if (snapshot.exists) {
        MealDay mealToMerge =
            MealDayDto.fromJson(snapshot.data() as Map<String, dynamic>)
                .toModel();

        log(mealToMerge.toString());
        MealDayDto mealDayToSend = MealDayDto.fromModel(
          MealDay(
              dateAdded: mealToMerge.dateAdded,
              addedBy: mealToMerge.addedBy,
              mealList: mealToMerge.mealList!.map<Meal>((mealListElement) {
                Meal mealTmp = Meal(
                    mealTypeName: mealListElement.mealTypeName,
                    mealDetails:
                        sumMealDetails(mealListElement, product, mealTypeName),
                    productList: mealListElement.productList);
                if (mealListElement.mealTypeName == mealTypeName) {
                  mealTmp.productList.add(product);

                  return mealTmp;
                } else {
                  return mealTmp;
                }
              }).toList()),
        );
        log(mealDayToSend.toJson().toString());

        final jsonToSend = mealDayToSend.toJson();
        _mealDayCollection
            .doc(mealToMerge.dateAdded.toString())
            .set(jsonToSend, SetOptions(merge: false));
      } else {
        ///every ignited mealday document needs to have list of 5 meals
        List<Meal> mealListToInit = [
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

        /// Looking for meal in which product shoukd be added
        for (Meal meal in mealListToInit) {
          if (mealTypeName == meal.mealTypeName) {
            meal.mealTypeName = mealTypeName;
            meal.mealDetails = sumMealDetails(meal, product, mealTypeName);
            meal.productList.add(product);
          }
        }
        MealDayDto mealdayToinit = MealDayDto.fromModel(MealDay(
            dateAdded: dayAdded.millisecondsSinceEpoch,
            addedBy: _firebaseAuth.currentUser!.uid,
            mealList: mealListToInit));
        await _mealDayCollection
            .doc(dayAdded.millisecondsSinceEpoch.toString())
            .set(mealdayToinit.toJson());
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }


     
// Future<MealDay>getMEalDay() async{



// }
  Details sumMealDetails(Meal meal, Product product, String mealTypeName) {
    if (meal.mealTypeName == mealTypeName) {
      return Details(
        calories: meal.mealDetails.calories + product.productDetails.calories,
        fat: meal.mealDetails.fat + product.productDetails.fat,
        protein: meal.mealDetails.protein + product.productDetails.protein,
        sugar: meal.mealDetails.sugar + product.productDetails.sugar,
        weight: meal.mealDetails.weight + product.productDetails.weight,
      );
    } else {
      return meal.mealDetails;
    }
  }
}
