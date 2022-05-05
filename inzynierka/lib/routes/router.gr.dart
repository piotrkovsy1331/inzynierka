// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:inzynierka/models/enums/meal_type_enum.dart' as _i14;
import 'package:inzynierka/models/product.dart' as _i15;
import 'package:inzynierka/theme_example.dart' as _i8;
import 'package:inzynierka/ui/add_meal_screen/add_product_screen.dart' as _i9;
import 'package:inzynierka/ui/home_screen/home_screen.dart' as _i4;
import 'package:inzynierka/ui/home_search_screen/search_screen.dart' as _i6;
import 'package:inzynierka/ui/home_summary_screen/summary_screen.dart' as _i5;
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart' as _i7;
import 'package:inzynierka/ui/login_screen/login_screen.dart' as _i2;
import 'package:inzynierka/ui/meal_details_screen/meal_details_screen.dart'
    as _i10;
import 'package:inzynierka/ui/profile_page.dart/profile_page.dart' as _i11;
import 'package:inzynierka/ui/register_screen.dart/register_screen.dart' as _i3;
import 'package:inzynierka/ui/wrapper.dart' as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    WrapperRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.WrapperScreen());
    },
    LoginRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    HomeRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    SummaryRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.SummaryScreen());
    },
    SearchRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.SearchScreen());
    },
    UserScoresRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.UserScoresScreen());
    },
    ThemeExampleRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ThemeExampleScreen());
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.AddProductScreen(
              key: args.key, mealTypeName: args.mealTypeName, date: args.date));
    },
    MealDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MealDetailsRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.MealDetailsScreen(
              key: args.key,
              gradientColor: args.gradientColor,
              mealTypeName: args.mealTypeName,
              productsList: args.productsList,
              date: args.date));
    },
    ProfilePageRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.ProfilePageScreen());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(WrapperRoute.name, path: '/'),
        _i12.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i12.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i12.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i12.RouteConfig(SummaryRoute.name, path: '/summary-screen'),
        _i12.RouteConfig(SearchRoute.name, path: '/search-screen'),
        _i12.RouteConfig(UserScoresRoute.name, path: '/user-scores-screen'),
        _i12.RouteConfig(ThemeExampleRoute.name, path: '/theme-example-screen'),
        _i12.RouteConfig(AddProductRoute.name, path: '/add-product-screen'),
        _i12.RouteConfig(MealDetailsRoute.name, path: '/meal-details-screen'),
        _i12.RouteConfig(ProfilePageRoute.name, path: '/profile-page-screen')
      ];
}

/// generated route for
/// [_i1.WrapperScreen]
class WrapperRoute extends _i12.PageRouteInfo<void> {
  const WrapperRoute() : super(WrapperRoute.name, path: '/');

  static const String name = 'WrapperRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.SummaryScreen]
class SummaryRoute extends _i12.PageRouteInfo<void> {
  const SummaryRoute() : super(SummaryRoute.name, path: '/summary-screen');

  static const String name = 'SummaryRoute';
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i12.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-screen');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.UserScoresScreen]
class UserScoresRoute extends _i12.PageRouteInfo<void> {
  const UserScoresRoute()
      : super(UserScoresRoute.name, path: '/user-scores-screen');

  static const String name = 'UserScoresRoute';
}

/// generated route for
/// [_i8.ThemeExampleScreen]
class ThemeExampleRoute extends _i12.PageRouteInfo<void> {
  const ThemeExampleRoute()
      : super(ThemeExampleRoute.name, path: '/theme-example-screen');

  static const String name = 'ThemeExampleRoute';
}

/// generated route for
/// [_i9.AddProductScreen]
class AddProductRoute extends _i12.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute(
      {_i13.Key? key,
      required _i14.MealTypeNameEnum mealTypeName,
      required DateTime date})
      : super(AddProductRoute.name,
            path: '/add-product-screen',
            args: AddProductRouteArgs(
                key: key, mealTypeName: mealTypeName, date: date));

  static const String name = 'AddProductRoute';
}

class AddProductRouteArgs {
  const AddProductRouteArgs(
      {this.key, required this.mealTypeName, required this.date});

  final _i13.Key? key;

  final _i14.MealTypeNameEnum mealTypeName;

  final DateTime date;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, mealTypeName: $mealTypeName, date: $date}';
  }
}

/// generated route for
/// [_i10.MealDetailsScreen]
class MealDetailsRoute extends _i12.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute(
      {_i13.Key? key,
      required List<_i13.Color> gradientColor,
      required _i14.MealTypeNameEnum mealTypeName,
      required List<_i15.Product> productsList,
      required DateTime date})
      : super(MealDetailsRoute.name,
            path: '/meal-details-screen',
            args: MealDetailsRouteArgs(
                key: key,
                gradientColor: gradientColor,
                mealTypeName: mealTypeName,
                productsList: productsList,
                date: date));

  static const String name = 'MealDetailsRoute';
}

class MealDetailsRouteArgs {
  const MealDetailsRouteArgs(
      {this.key,
      required this.gradientColor,
      required this.mealTypeName,
      required this.productsList,
      required this.date});

  final _i13.Key? key;

  final List<_i13.Color> gradientColor;

  final _i14.MealTypeNameEnum mealTypeName;

  final List<_i15.Product> productsList;

  final DateTime date;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{key: $key, gradientColor: $gradientColor, mealTypeName: $mealTypeName, productsList: $productsList, date: $date}';
  }
}

/// generated route for
/// [_i11.ProfilePageScreen]
class ProfilePageRoute extends _i12.PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(ProfilePageRoute.name, path: '/profile-page-screen');

  static const String name = 'ProfilePageRoute';
}
