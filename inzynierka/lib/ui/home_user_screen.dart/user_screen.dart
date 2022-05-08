import 'package:flutter/material.dart';
import 'package:inzynierka/globals/enums/time_range.dart';
import 'package:inzynierka/ui/home_user_screen.dart/widgets/tab_view.dart';

import '../../globals/fitstat_appbar.dart';
import '../../globals/global_widgets/fitstat_drawer.dart';
import '../../globals/global_widgets/fitstat_tabbar.dart';

class UserScoresScreen extends StatefulWidget {
  const UserScoresScreen({Key? key}) : super(key: key);

  @override
  State<UserScoresScreen> createState() => _UserScoresScreenState();
}

class _UserScoresScreenState extends State<UserScoresScreen> {
  DateTime currentDate = DateTime.now();
  DateTime yesterday = DateTime.now();
  late DateTime twoDaysBefore;
  late DateTime treeDaysBefore;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = const [
      Tab(
        child: Text('Ten tydzień '),
      ),
      Tab(
        child: Text('Zeszły tydzień'),
      ),
      Tab(
        child: Text('Ten miesiąc'),
      ),
      Tab(
        child: Text('Zeszły miesiąc '),
      ),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const FitstatDrawer(),
        appBar: const FitStatAppBar(
          title: 'Twoje Posiłki',
        ),
        body: Column(
          children: [
            FitstatTabBar(tabs: tabs),
            Expanded(
                child: TabBarView(children: [
              TabView(
                  dateInterwal: TimeRangeEnum.currentWeek.returnTimeRange,
                  days: 7),
              TabView(
                dateInterwal: TimeRangeEnum.previousWeek.returnTimeRange,
                days: 7,
              ),
              TabView(
                dateInterwal: TimeRangeEnum.currentMonth.returnTimeRange,
                days: 30,
              ),
              TabView(
                dateInterwal: TimeRangeEnum.previousMonth.returnTimeRange,
                days: 30,
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
