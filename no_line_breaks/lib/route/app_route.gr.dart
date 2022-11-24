// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../ui/home/home_screen.dart' as _i1;
import '../ui/settings/settings_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.HomeScreen(),
          transitionsBuilder: _i3.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    SettingsScreenRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.SettingsScreen(),
          transitionsBuilder: _i3.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i3.RouteConfig(HomeScreenRoute.name, path: '/home'),
        _i3.RouteConfig(SettingsScreenRoute.name, path: '/settings')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.SettingsScreen]
class SettingsScreenRoute extends _i3.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(SettingsScreenRoute.name, path: '/settings');

  static const String name = 'SettingsScreenRoute';
}
