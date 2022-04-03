import 'package:flutter/material.dart';

class FitstatTabBar extends StatelessWidget {
  const FitstatTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(tabs: [
      Tab(child: Text('Dziś')),
      Tab(child: Text('Wczoraj ')),
      Tab(child: Text('')),
      Tab(child: Text('Dziś')),
    ]);
  }
}
