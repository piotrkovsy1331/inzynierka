import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const FitstatDrawer(),
        appBar: AppBar(
          title: const Center(child: Text('Twoje Posiłki')),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
