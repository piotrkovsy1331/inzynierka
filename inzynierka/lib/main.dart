import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inzynierka/logics/hubs/authentication_service.dart';
import 'package:inzynierka/logics/hubs/hdd_hub.dart';
import 'package:inzynierka/logics/notifiers/app_theme_notifier.dart';
import 'package:inzynierka/logics/notifiers/user_data_notifier.dart';
import 'package:inzynierka/routes/router.gr.dart';
import 'package:provider/provider.dart';

import 'shared/style/fitstat_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HddHub().initHddHub();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AppRouter _appRouter = AppRouter();
  final AppThemeNotifier _appThemeNotifier = AppThemeNotifier();
  @override
  void initState() {
    super.initState();
    _appThemeNotifier.darkTheme = _appThemeNotifier.darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDataNotifier>(
          create: (_) => UserDataNotifier(),
        ),
        ChangeNotifierProvider<AppThemeNotifier>(
          create: (_) => AppThemeNotifier(),
        ),
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: Consumer<AppThemeNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp.router(
            theme:
                FitstatStyles.themeData(AppThemeNotifier().darkTheme, context),
            darkTheme: ThemeData.dark(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('pl'),
            ],
            title: 'FitStatApp',
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
