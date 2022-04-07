import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/routes/router.gr.dart';

class MealTile extends StatelessWidget {
  const MealTile(
      {Key? key, required this.gradientColor, required this.mealName})
      : super(key: key);
  final List<Color> gradientColor;
  final String mealName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMealTileTapped(context, gradientColor),
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
                        mealName,
                        style: Theme.of(context).textTheme.headline2,
                      )),
                  InkWell(
                      onTap: () => onAddTapped(context),
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
                            text: '100',
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Kcal: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: '100',
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Kcal: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: '100',
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Kcal: ',
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                        TextSpan(
                            text: '100',
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                ],
              )
            ],
          )),
    );
  }

  void onAddTapped(BuildContext context) {
    AutoRouter.of(context).push(AddMealRoute());
  }

  void onMealTileTapped(BuildContext context, List<Color> gradientColor) {
    AutoRouter.of(context).push(
        MealDetailsRoute(gradientColor: gradientColor, mealName: mealName));
  }
}
