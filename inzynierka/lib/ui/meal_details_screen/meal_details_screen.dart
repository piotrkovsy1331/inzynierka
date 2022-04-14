import 'package:flutter/material.dart';
import 'package:inzynierka/ui/home_summary_screen/summary_screen.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_tile.dart';

import '../../models/enums/meat_type_enum.dart';
import '../../models/product.dart';

class MealDetailsScreen extends StatefulWidget {
  MealDetailsScreen(
      {Key? key, required this.gradientColor, required this.mealTypeName})
      : super(key: key);
  final MealTypeName mealTypeName;
  final List<Color> gradientColor;
  final List<Product> productsList = [];
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitStatAppBar(
        title: widget.mealTypeName.displayName,
      ),
      body: ListView.builder(
        itemCount: widget.productsList.length,
        itemBuilder: (context, index) {
          return ProductTile(
            product: widget.productsList[index],
            gradientColor: widget.gradientColor,
          );
        },
      ),
    );
  }
}
