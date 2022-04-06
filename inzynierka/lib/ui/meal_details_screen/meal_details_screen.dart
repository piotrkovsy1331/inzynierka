import 'package:flutter/material.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_tile.dart';

class MealDetailsScreen extends StatefulWidget {
  MealDetailsScreen({Key? key}) : super(key: key);

//  final  List<Product> productsList;
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nazwa posiłku'),
      ),
      body: ListView(
        children: const [
          ProductTile(),
          ProductTile(),
          ProductTile(),
          ProductTile(),
          ProductTile(),
        ],
      ),
    );
  }
}
