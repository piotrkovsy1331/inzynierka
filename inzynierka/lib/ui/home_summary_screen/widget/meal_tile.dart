import 'package:flutter/material.dart';
import 'package:inzynierka/models/meal.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/models/product.dart';
import 'package:inzynierka/routes/router.gr.dart';

import '../../../models/enums/meal_type_enum.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    Key? key,
    required this.gradientColor,
    required this.mealTypeName,
    required this.meal,
    required this.date,
  }) : super(key: key);
  final List<Color> gradientColor;
  final MealTypeNameEnum mealTypeName;
  final Meal meal;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMealTileTapped(
        context,
        gradientColor,
        mealTypeName,
        meal.productList,
      ),
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        mealTypeName.displayName,
                        style: Theme.of(context).textTheme.headline2,
                      )),
                  InkWell(
                      onTap: () => onAddTapped(context, mealTypeName, date),
                      child: const SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.add_circle,
                          size: 30,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Kcal: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: meal.mealDetails.calories.toString(),
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Białko: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: meal.mealDetails.protein.toString(),
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Tłuszcz: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: meal.mealDetails.fat.toString(),
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Cukry: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: meal.mealDetails.sugar.toString(),
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                ],
              )
            ],
          )),
    );
  }

  void onAddTapped(
      BuildContext context, MealTypeNameEnum mealTypeName, DateTime date) {
    AutoRouter.of(context)
        .push(AddProductRoute(mealTypeName: mealTypeName, date: date));
  }

  void onMealTileTapped(BuildContext context, List<Color> gradientColor,
      MealTypeNameEnum mealTypeName, List<Product> productList) {
    AutoRouter.of(context).push(MealDetailsRoute(
        gradientColor: gradientColor,
        mealTypeName: mealTypeName,
        productsList: productList));
  }
}
