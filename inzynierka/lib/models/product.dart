import 'package:inzynierka/models/details.dart';

class Product {
  Product({required this.name, this.photoUrl, required this.productDetails});
  String name;
  String? photoUrl;
  Details productDetails;
}
