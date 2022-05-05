import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/ui/add_meal_screen/add_product_screen.dart';
import 'package:inzynierka/ui/home_screen/home_screen.dart';
import 'package:inzynierka/ui/home_search_screen/search_screen.dart';
import 'package:inzynierka/ui/home_summary_screen/summary_screen.dart';
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart';
import 'package:inzynierka/ui/login_screen/login_screen.dart';
import 'package:inzynierka/ui/meal_details_screen/meal_details_screen.dart';
import 'package:inzynierka/ui/profile_page.dart/profile_page.dart';
import 'package:inzynierka/ui/register_screen.dart/register_screen.dart';
import 'package:inzynierka/theme_example.dart';

import '../ui/wrapper.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WrapperScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: SummaryScreen),
    AutoRoute(page: SearchScreen),
    AutoRoute(page: UserScoresScreen),
    AutoRoute(page: ThemeExampleScreen),
    AutoRoute(page: AddProductScreen),
    AutoRoute(page: MealDetailsScreen),
    AutoRoute(page: ProfilePageScreen),
  ],
)
class $AppRouter {}
