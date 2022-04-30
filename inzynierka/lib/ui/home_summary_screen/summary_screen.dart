import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inzynierka/helpers/time_range_helper.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_tabbar.dart';

import 'widget/tab_view.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
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
                  .format(TimeRangeHelper.returnCurrentDate(currentDate))
                  .toString())),
      Tab(
          child: Text(DateFormat('EEEE', 'pl')
              .format(TimeRangeHelper.returnYestardayDate(currentDate))
              .toString())),
      Tab(
          child: Text(DateFormat('EEEE', 'pl')
              .format(TimeRangeHelper.returnTwoDaysBeforeDate(currentDate))
              .toString())),
      Tab(
          child: Text(DateFormat('EEEE', 'pl')
              .format(TimeRangeHelper.returnTreeDaysBeforeDate(currentDate))
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
              TabView(date: TimeRangeHelper.returnCurrentDate(currentDate)),
              TabView(date: TimeRangeHelper.returnYestardayDate(currentDate)),
              TabView(
                  date: TimeRangeHelper.returnTwoDaysBeforeDate(currentDate)),
              TabView(
                  date: TimeRangeHelper.returnTreeDaysBeforeDate(currentDate)),
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

class FitStatAppBar extends StatelessWidget with PreferredSizeWidget {
  const FitStatAppBar({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);
  final String title;
  final Widget? trailing;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: trailing != null ? [trailing!] : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
