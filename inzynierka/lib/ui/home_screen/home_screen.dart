import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';
import 'package:inzynierka/ui/home_search_screen/search_screen.dart';
import 'package:inzynierka/ui/home_summary_screen.dart/summary_screen.dart';
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  static const List<Widget> _bottomBArItemList = [
    SummaryScreen(),
    SearchScreen(),
    UserScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const FitstatDrawer(),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        children: _bottomBArItemList,
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Posiłki",
        labels: const [
          "Posiłki",
          "Szukaj",
          "Moje Wyniki",
        ],
        icons: const [
          Icons.home,
          Icons.search,
          Icons.person,
        ],
        tabSize: 40,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: const Color(0xFF00C853),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: const Color.fromARGB(255, 7, 133, 59),
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color(0xFFAFAFAF),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = value;
          });
        },
      ),
    );
  }
}
