import 'package:flutter/material.dart';
import 'package:inzynierka/logics/notifiers/app_theme_notifier.dart';
import 'package:inzynierka/models/enums/meat_type_enum.dart';

import 'package:inzynierka/shared/style/fitstat_gradient.dart';
import 'package:inzynierka/ui/home_summary_screen/widget/meal_tile.dart';
import 'package:provider/provider.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (constext, appTheme, _) {
      return ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          MealTile(
              gradientColor: appTheme.darkTheme
                  ? FitstatGradient.fireDark
                  : FitstatGradient.fire,
              mealTypeName: MealTypeName.breakfast),
          const SizedBox(
            height: 10,
          ),
          MealTile(
            gradientColor: appTheme.darkTheme
                ? FitstatGradient.mangoDark
                : FitstatGradient.mango,
            mealTypeName: MealTypeName.lunch,
          ),
          const SizedBox(
            height: 10,
          ),
          MealTile(
            gradientColor: appTheme.darkTheme
                ? FitstatGradient.seaDark
                : FitstatGradient.sea,
            mealTypeName: MealTypeName.dinner,
          ),
          const SizedBox(
            height: 10,
          ),
          MealTile(
            gradientColor: appTheme.darkTheme
                ? FitstatGradient.skyDark
                : FitstatGradient.sky,
            mealTypeName: MealTypeName.supper,
          ),
          const SizedBox(
            height: 10,
          ),
          MealTile(
            gradientColor: appTheme.darkTheme
                ? FitstatGradient.sunsetDark
                : FitstatGradient.sunset,
            mealTypeName: MealTypeName.tea,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    });
  }
}
