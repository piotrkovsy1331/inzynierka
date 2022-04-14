import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inzynierka/logics/firebase_schema/collections.dart';
import 'package:inzynierka/models/dto/meal_day_dto.dart';
import 'package:inzynierka/models/meal.dart';
import 'package:inzynierka/models/meal_day.dart';
import 'package:inzynierka/models/product.dart';

// class FirebaseHub {
//   FirebaseHub._internal();

//   factory FirebaseHub() {
//     return _FirebaseHub;
//   }
//   static final FirebaseHub _FirebaseHub = FirebaseHub._internal();
//   late FirebaseFirestore _firestore;
//   void initFirebaseHub() {
//     _firestore = FirebaseFirestore.instance;
//   }

//   Future<void> addProduct(
//       String mealTypeNAme, Product product, DateTime dayAdded) async {

//         MealDay _mealDayToSent = MealDay(dateAdded: dateAdded, addedBy: addedBy, mealList: mealList)
//     try {
//       CollectionReference _mealDay = _firestore.collection(Collections.mealDay);
//       // await _mealDay.add(MealDayDto.fromModel(mealDay.copyWith(
//       //         dateAdded: Jiffy()
//       //             .startOf(Units.DAY)
//       //             .dateTime
//       //             .toUtc()
//       //             .microsecondsSinceEpoch))
//       //     .toJson());
//       await _mealDay.doc(dayAdded.toIso8601String()).set(MealDayDto.fromModel())

//     } catch (e) {
//       print(e.toString());
//     }
//   }

// //   Future<Either<Failure,MealDay>> getMealDay(int dateStart , dayEnd) async {

// // try{
// //     CollectionReference _mealday = _firestore.collection(Collections.mealDay);
// //     final snapshot = await _mealday.where('dateAdded', );
// //     // return Right(snapshot.);

// // }
// //     return mealDay;
// //   }
// }

class FireBaseHub {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  FireBaseHub(this._firebaseAuth, this._firebaseFirestore);

  Future<void> addProduct(
      String mealTypeName, Product product, DateTime dayAdded) async {
    List<Meal> mealListToSend = [];
    // mealListToSend.add(Meal(mealTypeName: mealTypeName, mealDetails: mealDetails, productList: productList))
    // MealDay _mealDayToSend = MealDay(dateAdded: dayAdded.millisecondsSinceEpoch, addedBy: _firebaseAuth.currentUser!.uid, mealList:) )
    try {
      CollectionReference _mealDay =
          _firebaseFirestore.collection(Collections.mealDay);
      // await _mealDay.add(MealDayDto.fromModel(mealDay.copyWith(
      //         dateAdded: Jiffy()
      //             .startOf(Units.DAY)
      //             .dateTime
      //             .toUtc()
      //             .microsecondsSinceEpoch))
      //     .toJson());
      final DocumentSnapshot snapshot =
          await _mealDay.doc(dayAdded.toIso8601String()).get();

      ///TODO jeeli istnieje to do pobranego Mealday dodaj podsiłek  dodaj jeszcze wyszukiwanie po adddedBy
      if (snapshot.exists) {
        MealDay mealTmp = MealDayDto.fromDocument(snapshot).toModel();

        ///TODO JEeli dokument z Tego dnia nie istnieje To dodaj Mealday który jest zupełnie nowy z nowym produktem dodany prze zalogowanego uytkownika
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
