// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:inzynierka/theme_example.dart' as _i8;
import 'package:inzynierka/ui/home_screen/home_screen.dart' as _i4;
import 'package:inzynierka/ui/home_search_screen/search_screen.dart' as _i6;
import 'package:inzynierka/ui/home_summary_screen.dart/summary_screen.dart'
    as _i5;
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart' as _i7;
import 'package:inzynierka/ui/login_screen/login_screen.dart' as _i2;
import 'package:inzynierka/ui/register_screen.dart/register_screen.dart' as _i3;
import 'package:inzynierka/ui/wrapper.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    WrapperRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.WrapperScreen());
    },
    LoginRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    SummaryRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.SummaryScreen());
    },
    SearchRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.SearchScreen());
    },
    UserRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.UserScreen());
    },
    ThemeExampleRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ThemeExampleScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(WrapperRoute.name, path: '/'),
        _i9.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i9.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i9.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i9.RouteConfig(SummaryRoute.name, path: '/summary-screen'),
        _i9.RouteConfig(SearchRoute.name, path: '/search-screen'),
        _i9.RouteConfig(UserRoute.name, path: '/user-screen'),
        _i9.RouteConfig(ThemeExampleRoute.name, path: '/theme-example-screen')
      ];
}

/// generated route for
/// [_i1.WrapperScreen]
class WrapperRoute extends _i9.PageRouteInfo<void> {
  const WrapperRoute() : super(WrapperRoute.name, path: '/');

  static const String name = 'WrapperRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.SummaryScreen]
class SummaryRoute extends _i9.PageRouteInfo<void> {
  const SummaryRoute() : super(SummaryRoute.name, path: '/summary-screen');

  static const String name = 'SummaryRoute';
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-screen');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.UserScreen]
class UserRoute extends _i9.PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: '/user-screen');

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i8.ThemeExampleScreen]
class ThemeExampleRoute extends _i9.PageRouteInfo<void> {
  const ThemeExampleRoute()
      : super(ThemeExampleRoute.name, path: '/theme-example-screen');

  static const String name = 'ThemeExampleRoute';
}
