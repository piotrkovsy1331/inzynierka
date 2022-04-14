import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/product.dart';

class Meal {
  Meal(
      {required this.mealTypeName,
      required this.mealDetails,
      required this.productList});

  String mealTypeName;
  Details mealDetails;
  List<Product> productList;
}
