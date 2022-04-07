import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_tabbar.dart';

import 'widget/tab_view.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    super.initState();
    //TODO in initstate download stuff from database
  }

  List<Widget> tabs = const [
    Tab(child: Text('Dziś')),
    Tab(child: Text('Wczoraj ')),
    Tab(child: Text('Przedwczoraj')),
    Tab(child: Text('ZaPrzedwczoraj')),
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
            const Expanded(child: TabView()),
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
