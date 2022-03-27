import 'package:flutter/material.dart';
import 'package:inzynierka/logics/notifiers/app_theme_notifier.dart';
import 'package:inzynierka/shared/style/fitstat_colors.dart';
import 'package:provider/provider.dart';

import '../../shared/style/fitstat_gradient.dart';

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
    return Consumer<AppThemeNotifier>(
      builder: (context, appTheme, _) {
        return ListView(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: appTheme.darkTheme
                          ? FitstatGradient.skyDark
                          : FitstatGradient.sky)),
              child: Center(
                child: Text('FitstatGradient.skyDark',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: appTheme.darkTheme
                          ? FitstatGradient.sunsetDark
                          : FitstatGradient.sunset)),
              child: Center(
                child: Text('FitstatGradient.sunsetDark',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: appTheme.darkTheme
                          ? FitstatGradient.seaDark
                          : FitstatGradient.sea)),
              child: Center(
                child: Text('FitstatGradient.seaDark',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: appTheme.darkTheme
                          ? FitstatGradient.mangoDark
                          : FitstatGradient.mango)),
              child: Center(
                child: Text('FitstatGradient.mangoDark',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: appTheme.darkTheme
                          ? FitstatGradient.fireDark
                          : FitstatGradient.fire)),
              child: Center(
                child: Text('FitstatGradient.fireDark',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 40,
              decoration:
                  const BoxDecoration(color: FitStatColors.buttonColorDark),
              child: Center(
                child: Text('buttonColorDark',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(overflow: TextOverflow.fade)),
              ),
            ),
            Container(
              height: 40,
              decoration:
                  const BoxDecoration(color: FitStatColors.primaryColorDark),
              child: Center(
                child: Text('primaryColorDark',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(overflow: TextOverflow.fade)),
              ),
            ),
          ],
        );
      },
    );
  }
}
