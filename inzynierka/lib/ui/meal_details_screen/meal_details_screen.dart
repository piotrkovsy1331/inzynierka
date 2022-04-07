import 'package:flutter/material.dart';
import 'package:inzynierka/ui/home_summary_screen/summary_screen.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_tile.dart';

import '../../models/product.dart';

class MealDetailsScreen extends StatefulWidget {
  MealDetailsScreen(
      {Key? key, required this.gradientColor, required this.mealName})
      : super(key: key);
  final String mealName;
  final List<Color> gradientColor;
  final List<Product> productsList = [
    Product(
        'Dynia',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
    Product(
        'Cukinia',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
    Product(
        'Marchewka',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
    Product(
        'Cola',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
    Product(
        'Kebab',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
    Product(
        'Chipsy',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
    Product(
        'Pierś z kurczaka',
        'https://makebentonotwar.com/wp-content/uploads/2021/11/Meal-prep-blog-z-przepisami.jpg',
        300,
        100,
        299,
        2,
        3),
  ];
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitStatAppBar(
        title: widget.mealName,
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
