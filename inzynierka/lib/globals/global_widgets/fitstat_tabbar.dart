import 'package:flutter/material.dart';

class FitstatTabBar extends StatelessWidget {
  const FitstatTabBar({Key? key, required this.tabs}) : super(key: key);
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        indicatorColor: Theme.of(context).selectedRowColor,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
        tabs: tabs);
  }
}
