import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/ui/home_screen/home_screen.dart';
import 'package:inzynierka/ui/home_search_screen/search_screen.dart';
import 'package:inzynierka/ui/home_summary_screen.dart/summary_screen.dart';
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart';
import 'package:inzynierka/ui/login_screen/login_screen.dart';
import 'package:inzynierka/ui/register_screen.dart/register_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginScreen,
    ),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: SummaryScreen),
    AutoRoute(page: SearchScreen),
    AutoRoute(page: UserScreen),
  ],
)
class $AppRouter {}
