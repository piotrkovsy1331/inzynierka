// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:inzynierka/models/enums/meal_type_enum.dart' as _i13;
import 'package:inzynierka/theme_example.dart' as _i8;
import 'package:inzynierka/ui/add_meal_screen/add_product_screen.dart' as _i9;
import 'package:inzynierka/ui/home_screen/home_screen.dart' as _i4;
import 'package:inzynierka/ui/home_search_screen/search_screen.dart' as _i6;
import 'package:inzynierka/ui/home_summary_screen/summary_screen.dart' as _i5;
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart' as _i7;
import 'package:inzynierka/ui/login_screen/login_screen.dart' as _i2;
import 'package:inzynierka/ui/meal_details_screen/meal_details_screen.dart'
    as _i10;
import 'package:inzynierka/ui/register_screen.dart/register_screen.dart' as _i3;
import 'package:inzynierka/ui/wrapper.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    WrapperRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.WrapperScreen());
    },
    LoginRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    HomeRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    SummaryRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.SummaryScreen());
    },
    SearchRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.SearchScreen());
    },
    UserRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.UserScreen());
    },
    ThemeExampleRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ThemeExampleScreen());
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.AddProductScreen(
              key: args.key, mealTypeName: args.mealTypeName));
    },
    MealDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MealDetailsRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.MealDetailsScreen(
              key: args.key,
              gradientColor: args.gradientColor,
              mealTypeName: args.mealTypeName));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(WrapperRoute.name, path: '/'),
        _i11.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i11.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i11.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i11.RouteConfig(SummaryRoute.name, path: '/summary-screen'),
        _i11.RouteConfig(SearchRoute.name, path: '/search-screen'),
        _i11.RouteConfig(UserRoute.name, path: '/user-screen'),
        _i11.RouteConfig(ThemeExampleRoute.name, path: '/theme-example-screen'),
        _i11.RouteConfig(AddProductRoute.name, path: '/add-product-screen'),
        _i11.RouteConfig(MealDetailsRoute.name, path: '/meal-details-screen')
      ];
}

/// generated route for
/// [_i1.WrapperScreen]
class WrapperRoute extends _i11.PageRouteInfo<void> {
  const WrapperRoute() : super(WrapperRoute.name, path: '/');

  static const String name = 'WrapperRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.SummaryScreen]
class SummaryRoute extends _i11.PageRouteInfo<void> {
  const SummaryRoute() : super(SummaryRoute.name, path: '/summary-screen');

  static const String name = 'SummaryRoute';
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i11.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-screen');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.UserScreen]
class UserRoute extends _i11.PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: '/user-screen');

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i8.ThemeExampleScreen]
class ThemeExampleRoute extends _i11.PageRouteInfo<void> {
  const ThemeExampleRoute()
      : super(ThemeExampleRoute.name, path: '/theme-example-screen');

  static const String name = 'ThemeExampleRoute';
}

/// generated route for
/// [_i9.AddProductScreen]
class AddProductRoute extends _i11.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({_i12.Key? key, required _i13.MealTypeNameEnum mealTypeName})
      : super(AddProductRoute.name,
            path: '/add-product-screen',
            args: AddProductRouteArgs(key: key, mealTypeName: mealTypeName));

  static const String name = 'AddProductRoute';
}

class AddProductRouteArgs {
  const AddProductRouteArgs({this.key, required this.mealTypeName});

  final _i12.Key? key;

  final _i13.MealTypeNameEnum mealTypeName;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, mealTypeName: $mealTypeName}';
  }
}

/// generated route for
/// [_i10.MealDetailsScreen]
class MealDetailsRoute extends _i11.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute(
      {_i12.Key? key,
      required List<_i12.Color> gradientColor,
      required _i13.MealTypeNameEnum mealTypeName})
      : super(MealDetailsRoute.name,
            path: '/meal-details-screen',
            args: MealDetailsRouteArgs(
                key: key,
                gradientColor: gradientColor,
                mealTypeName: mealTypeName));

  static const String name = 'MealDetailsRoute';
}

class MealDetailsRouteArgs {
  const MealDetailsRouteArgs(
      {this.key, required this.gradientColor, required this.mealTypeName});

  final _i12.Key? key;

  final List<_i12.Color> gradientColor;

  final _i13.MealTypeNameEnum mealTypeName;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{key: $key, gradientColor: $gradientColor, mealTypeName: $mealTypeName}';
  }
}
