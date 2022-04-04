import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile(
      {Key? key, required this.gradientColor, required this.mealName})
      : super(key: key);
  final List<Color> gradientColor;
  final String mealName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onMealTileTapped,
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
                      onTap: onAddTapped, child: const Icon(Icons.add_circle))
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

  void onAddTapped() {}

  void onMealTileTapped() {}
}
