import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/product.dart';

class Meal {
  Meal(this.mealId, this.mealDetails, this.productList);

  int mealId;
  Details mealDetails;
  List<Product> productList;
}
