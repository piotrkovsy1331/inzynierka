import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inzynierka/helpers/firestore_doc_helper.dart';
import 'package:inzynierka/logics/firebase_schema/collections.dart';
import 'package:inzynierka/models/dto/meal_day_dto.dart';
import 'package:inzynierka/models/meal.dart';
import 'package:inzynierka/models/meal_day.dart';
import 'package:inzynierka/models/product.dart';

import '../../models/details.dart';

class MealDayRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



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
        List<Meal> mealListToInit = FireStoreDocHelper.emptyMealsList;

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

  Future<MealDay?> getMealDay(DateTime dayAdded) async {
    try {
      CollectionReference _mealDayCollection =
          _firebaseFirestore.collection(Collections.mealDay);
      final DocumentSnapshot snapshot = await _mealDayCollection
          .doc(dayAdded.millisecondsSinceEpoch.toString())
          .get();
      if (snapshot.exists) {
        MealDay mealDay =
            MealDayDto.fromJson(snapshot.data() as Map<String, dynamic>)
                .toModel();
        return mealDay;
      } else {
        MealDayDto mealdayToinit = MealDayDto.fromModel(MealDay(
            dateAdded: dayAdded.millisecondsSinceEpoch,
            addedBy: _firebaseAuth.currentUser!.uid,
            mealList: FireStoreDocHelper.emptyMealsList));
        await _mealDayCollection
            .doc(dayAdded.millisecondsSinceEpoch.toString())
            .set(mealdayToinit.toJson());

        return mealdayToinit.toModel();
      }
    } on FirebaseException catch (e) {
      log(e.toString());
    }

    return null;
  }

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
