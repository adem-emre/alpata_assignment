// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../features/auth/views/login/login_view.dart' as _i2;
import '../features/auth/views/splash/splash_view.dart' as _i1;
import '../features/stock_market/views/stock_market_home/stock_market_home_view.dart'
    as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    LoginViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    StockMarketHomeViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StockMarketHomeView());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashViewRoute.name, path: '/'),
        _i4.RouteConfig(LoginViewRoute.name, path: '/login-view'),
        _i4.RouteConfig(StockMarketHomeViewRoute.name,
            path: '/stock-market-home-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashViewRoute extends _i4.PageRouteInfo<void> {
  const SplashViewRoute() : super(SplashViewRoute.name, path: '/');

  static const String name = 'SplashViewRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginViewRoute extends _i4.PageRouteInfo<void> {
  const LoginViewRoute() : super(LoginViewRoute.name, path: '/login-view');

  static const String name = 'LoginViewRoute';
}

/// generated route for
/// [_i3.StockMarketHomeView]
class StockMarketHomeViewRoute extends _i4.PageRouteInfo<void> {
  const StockMarketHomeViewRoute()
      : super(StockMarketHomeViewRoute.name, path: '/stock-market-home-view');

  static const String name = 'StockMarketHomeViewRoute';
}
