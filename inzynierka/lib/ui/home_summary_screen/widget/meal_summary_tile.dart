import 'package:flutter/material.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/meal.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/models/meal_day.dart';
import 'package:inzynierka/models/product.dart';
import 'package:inzynierka/routes/router.gr.dart';

import '../../../models/enums/meal_type_enum.dart';

class MealSummaryTile extends StatefulWidget {
  const MealSummaryTile({
    Key? key,
    required this.gradientColor,
    required this.mealDay,
  }) : super(key: key);
  final List<Color> gradientColor;
  final MealDay mealDay;
  @override
  State<MealSummaryTile> createState() => _MealSummaryTileState();
}

class _MealSummaryTileState extends State<MealSummaryTile> {
  late Details detailsSummed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailsSummed = getDailyProductDetails(widget.mealDay.mealList!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade600, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Kcal: ',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                  TextSpan(
                      text: detailsSummed.calories.toString(),
                      style: Theme.of(context).textTheme.bodyText2)
                ])),
            RichText(
                text: TextSpan(
                    text: 'Białko: ',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                  TextSpan(
                      text: detailsSummed.protein.toString(),
                      style: Theme.of(context).textTheme.bodyText2)
                ])),
            RichText(
                text: TextSpan(
                    text: 'Tłuszcz: ',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                  TextSpan(
                      text: detailsSummed.fat.toString(),
                      style: Theme.of(context).textTheme.bodyText2)
                ])),
            RichText(
                text: TextSpan(
                    text: 'Cukry: ',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                  TextSpan(
                      text: detailsSummed.sugar.toString(),
                      style: Theme.of(context).textTheme.bodyText2)
                ])),
          ],
        ));
  }

  void onAddTapped(
      BuildContext context, MealTypeNameEnum mealTypeName, DateTime date) {
    AutoRouter.of(context)
        .push(AddProductRoute(mealTypeName: mealTypeName, date: date));
  }

  void onMealTileTapped(BuildContext context, List<Color> gradientColor,
      MealTypeNameEnum mealTypeName, List<Product> productList, DateTime date) {
    AutoRouter.of(context).push(MealDetailsRoute(
        gradientColor: gradientColor,
        mealTypeName: mealTypeName,
        productsList: productList,
        date: date));
  }

  Details getDailyProductDetails(List<Meal> mealList) {
    Details details =
        Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0);
    for (Meal meal in mealList) {
      details.calories += meal.mealDetails.calories;
      details.fat += meal.mealDetails.fat;
      details.protein += meal.mealDetails.protein;
      details.sugar += meal.mealDetails.sugar;
      details.weight += meal.mealDetails.weight;
    }

    return details;
  }
}
