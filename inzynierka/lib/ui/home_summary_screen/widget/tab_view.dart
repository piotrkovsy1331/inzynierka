import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/meal_day_repository.dart';
import 'package:inzynierka/logics/notifiers/app_theme_notifier.dart';
import 'package:inzynierka/models/meal_day.dart';
import 'package:inzynierka/shared/style/fitstat_gradient.dart';
import 'package:inzynierka/ui/home_summary_screen/widget/meal_tile.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/meal_type_enum.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  late final Future<MealDay?> mealday;

  @override
  void initState() {
    super.initState();

    mealday = MealDayRepository().getMealDay(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (constext, appTheme, _) {
      return FutureBuilder(
          future: mealday,
          builder: (BuildContext context, AsyncSnapshot<MealDay?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Dupa'));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MealTile(
                    gradientColor: appTheme.darkTheme
                        ? FitstatGradient.fireDark
                        : FitstatGradient.fire,
                    mealTypeName: MealTypeNameEnum.breakfast,
                    meal: snapshot.data!.mealList![0],
                    date: widget.date,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MealTile(
                    gradientColor: appTheme.darkTheme
                        ? FitstatGradient.mangoDark
                        : FitstatGradient.mango,
                    mealTypeName: MealTypeNameEnum.lunch,
                    meal: snapshot.data!.mealList![1],
                    date: widget.date,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MealTile(
                    gradientColor: appTheme.darkTheme
                        ? FitstatGradient.seaDark
                        : FitstatGradient.sea,
                    mealTypeName: MealTypeNameEnum.dinner,
                    meal: snapshot.data!.mealList![2],
                    date: widget.date,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MealTile(
                    gradientColor: appTheme.darkTheme
                        ? FitstatGradient.skyDark
                        : FitstatGradient.sky,
                    mealTypeName: MealTypeNameEnum.supper,
                    meal: snapshot.data!.mealList![3],
                    date: widget.date,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MealTile(
                    gradientColor: appTheme.darkTheme
                        ? FitstatGradient.sunsetDark
                        : FitstatGradient.sunset,
                    mealTypeName: MealTypeNameEnum.tea,
                    meal: snapshot.data!.mealList![4],
                    date: widget.date,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Error Screen'),
              );
            }
          });
    });
  }
}
