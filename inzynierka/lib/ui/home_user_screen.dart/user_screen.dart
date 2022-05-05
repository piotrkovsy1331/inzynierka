import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../globals/fitstat_appbar.dart';
import '../../globals/global_widgets/fitstat_drawer.dart';
import '../../globals/global_widgets/fitstat_tabbar.dart';
import '../../helpers/time_helper.dart';
import '../home_summary_screen/widget/tab_view.dart';

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
    List<Widget> tabs = [
      Tab(
          child: (currentDate.day == DateTime.now().day)
              ? const Text('dziś')
              : Text(DateFormat('EEEE', 'pl')
                  .format(TimeHelper.returnCurrentDate(currentDate))
                  .toString())),
      Tab(
          child: Text(DateFormat('EEEE', 'pl')
              .format(TimeHelper.returnYestardayDate(currentDate))
              .toString())),
      Tab(
          child: Text(DateFormat('EEEE', 'pl')
              .format(TimeHelper.returnTwoDaysBeforeDate(currentDate))
              .toString())),
      Tab(
          child: Text(DateFormat('EEEE', 'pl')
              .format(TimeHelper.returnTreeDaysBeforeDate(currentDate))
              .toString())),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const FitstatDrawer(),
        appBar: FitStatAppBar(
          title: 'Twoje Posiłki',
          trailing: IconButton(
            onPressed: () => _onCalendarPressed(context),
            icon: const Icon(
              Icons.calendar_month,
            ),
          ),
        ),
        body: Column(
          children: [
            FitstatTabBar(tabs: tabs),
            Expanded(
                child: TabBarView(children: [
              TabView(date: TimeHelper.returnCurrentDate(currentDate)),
              TabView(date: TimeHelper.returnYestardayDate(currentDate)),
              TabView(
                  date: TimeHelper.returnTwoDaysBeforeDate(currentDate)),
              TabView(
                  date: TimeHelper.returnTreeDaysBeforeDate(currentDate)),
            ])),
          ],
        ),
      ),
    );
  }

  void _onCalendarPressed(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
      helpText: 'Wybierz dzień',
      cancelText: 'Anuluj',
      locale: const Locale('pl'),
    );
    if (picked == null ||
        (currentDate.year == picked.year &&
            currentDate.month == picked.month &&
            currentDate.day == picked.day)) return;
    setState(() {
      currentDate = picked;
    });
  }
}
