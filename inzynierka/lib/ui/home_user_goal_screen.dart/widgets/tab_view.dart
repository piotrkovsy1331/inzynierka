import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inzynierka/logics/hubs/meal_day_repository.dart';
import 'package:inzynierka/logics/notifiers/app_theme_notifier.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/meal_day.dart';

import 'package:inzynierka/ui/home_user_goal_screen.dart/widgets/summary_bar_chart.dart';
import 'package:inzynierka/ui/home_user_goal_screen.dart/widgets/summary_doughnut_chart.dart';
import 'package:provider/provider.dart';

import '../../../globals/enums/time_range.dart';
import '../../../models/meal.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key, required this.dateInterwal, required this.days})
      : super(key: key);
  final TimeInterval dateInterwal;
  final int days;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  late final Future<List<MealDay>> mealday;

  @override
  void initState() {
    super.initState();

    mealday = MealDayRepository().getMealDayListByDates(
        widget.dateInterwal.startDate, widget.dateInterwal.endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (constext, appTheme, _) {
      return FutureBuilder(
          future: mealday,
          builder:
              (BuildContext context, AsyncSnapshot<List<MealDay>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  SummaryDougnhutChart(
                    chartData:
                        getDoughnutChartData(snapshot.data!, widget.days),
                    title: 'Średnio dziennie dostarczono   ',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SummaryBarChart(
                    chartData: getCarloriesData(snapshot.data!),
                    title: 'Ilość kalorii',
                    color: Colors.green,
                  ),
                  SummaryBarChart(
                    chartData: getFatData(snapshot.data!),
                    title: 'Ilość Tłuszczu',
                    color: Colors.yellow,
                  ),
                  SummaryBarChart(
                    chartData: getProteinData(snapshot.data!),
                    title: 'Ilość białka',
                    color: Colors.blue,
                  ),
                  SummaryBarChart(
                    chartData: getSugarData(snapshot.data!),
                    title: 'Ilość cukru ',
                    color: Colors.pink,
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

List<DoughnutChartData> getDoughnutChartData(
    List<MealDay> mealDayList, int days) {
  Details details = getDetailsSummed(mealDayList);
  return [
    DoughnutChartData(
        'Kalorie kcal.', details.calories.toDouble() / days, Colors.green),
    DoughnutChartData(
        'Biako g.', details.protein.toDouble() / days, Colors.blue),
    DoughnutChartData(
        'Tłuszcz g.', details.fat.toDouble() / days, Colors.yellow),
    DoughnutChartData("Cukry g.", details.sugar.toDouble() / days, Colors.pink),
  ];
}

Details getDetailsSummed(List<MealDay> mealDayList) {
  List<Details> tmpList = [];
  Details _details =
      Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0);
  for (MealDay mealday in mealDayList) {
    tmpList.add(getDailyProductDetails(mealday.mealList!));
  }
  for (Details meal in tmpList) {
    _details.calories += meal.calories;
    _details.fat += meal.fat;
    _details.protein += meal.protein;
    _details.sugar += meal.protein;
    _details.weight += meal.weight;
  }

  return _details;
}

List<ChartData> getCarloriesData(List<MealDay> mealDayList) {
  List<ChartData> returnArray = [];
  for (MealDay mealday in mealDayList) {
    returnArray.add(ChartData(
        DateFormat('dd.MM')
            .format(DateTime.fromMillisecondsSinceEpoch(mealday.dateAdded))
            .toString(),
        getDailyProductDetails(mealday.mealList!).calories.toDouble()));
  }
  return returnArray;
}

List<ChartData> getSugarData(List<MealDay> mealDayList) {
  List<ChartData> returnArray = [];
  for (MealDay mealday in mealDayList) {
    returnArray.add(ChartData(
        DateFormat('dd.MM')
            .format(DateTime.fromMillisecondsSinceEpoch(mealday.dateAdded))
            .toString(),
        getDailyProductDetails(mealday.mealList!).sugar.toDouble()));
  }
  return returnArray;
}

List<ChartData> getFatData(List<MealDay> mealDayList) {
  List<ChartData> returnArray = [];
  for (MealDay mealday in mealDayList) {
    returnArray.add(ChartData(
        DateFormat('dd.MM')
            .format(DateTime.fromMillisecondsSinceEpoch(mealday.dateAdded))
            .toString(),
        getDailyProductDetails(mealday.mealList!).fat.toDouble()));
  }
  return returnArray;
}

List<ChartData> getProteinData(List<MealDay> mealDayList) {
  List<ChartData> returnArray = [];
  for (MealDay mealday in mealDayList) {
    returnArray.add(ChartData(
        DateFormat('dd.MM')
            .format(DateTime.fromMillisecondsSinceEpoch(mealday.dateAdded))
            .toString(),
        getDailyProductDetails(mealday.mealList!).protein.toDouble()));
  }
  return returnArray;
}
