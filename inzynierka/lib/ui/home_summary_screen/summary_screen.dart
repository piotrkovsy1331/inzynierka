import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inzynierka/globals/enums/time_range_enum.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_tabbar.dart';

import 'widget/tab_view.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  List<Widget> tabs = [
    const Tab(child: Text('dziś')),
    Tab(
        child: Text(DateFormat('EEEE', 'pl')
            .format(TimeRangeEnum.yesterday.returnTime)
            .toString())),
    Tab(
        child: Text(DateFormat('EEEE', 'pl')
            .format(TimeRangeEnum.dayBeforeYestrday.returnTime)
            .toString())),
    Tab(
        child: Text(DateFormat('EEEE', 'pl')
            .format(TimeRangeEnum.treeDaysEarlier.returnTime)
            .toString())),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const FitstatDrawer(),
        appBar: const FitStatAppBar(title: 'Twoje Posiłki'),
        body: Column(
          children: [
            FitstatTabBar(tabs: tabs),
            Expanded(
                child: TabBarView(children: [
              TabView(date: TimeRangeEnum.today.returnTime),
              TabView(date: TimeRangeEnum.yesterday.returnTime),
              TabView(date: TimeRangeEnum.dayBeforeYestrday.returnTime),
              TabView(date: TimeRangeEnum.treeDaysEarlier.returnTime),
            ])),
          ],
        ),
      ),
    );
  }
}

class FitStatAppBar extends StatelessWidget with PreferredSizeWidget {
  const FitStatAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
