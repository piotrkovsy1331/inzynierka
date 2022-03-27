// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:inzynierka/ui/home_screen/home_screen.dart' as _i3;
import 'package:inzynierka/ui/home_search_screen/search_screen.dart' as _i5;
import 'package:inzynierka/ui/home_summary_screen.dart/summary_screen.dart'
    as _i4;
import 'package:inzynierka/ui/home_user_screen.dart/user_screen.dart' as _i6;
import 'package:inzynierka/ui/login_screen/login_screen.dart' as _i1;
import 'package:inzynierka/ui/register_screen.dart/register_screen.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.RegisterScreen());
    },
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    SummaryRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.SummaryScreen());
    },
    SearchRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.SearchScreen());
    },
    UserRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.UserScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i7.RouteConfig(HomeRoute.name, path: '/'),
        _i7.RouteConfig(SummaryRoute.name, path: '/summary-screen'),
        _i7.RouteConfig(SearchRoute.name, path: '/search-screen'),
        _i7.RouteConfig(UserRoute.name, path: '/user-screen')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.SummaryScreen]
class SummaryRoute extends _i7.PageRouteInfo<void> {
  const SummaryRoute() : super(SummaryRoute.name, path: '/summary-screen');

  static const String name = 'SummaryRoute';
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-screen');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i6.UserScreen]
class UserRoute extends _i7.PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: '/user-screen');

  static const String name = 'UserRoute';
}
