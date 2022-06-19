import 'package:flutter/material.dart';
import 'package:tempbit/page/landing/landing.dart';
import 'package:tempbit/page/setting/setting.dart';
import 'package:tempbit/component/misc/faderoute.dart';

enum RouteType {
  defaultRoute,
  fade,
}

final routeObserver = RouteObserver<ModalRoute<dynamic>>();

class AppsNavigator {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  NavigatorState? get state => key.currentState;

  void pop<T extends Object>([T? result]) => state?.pop<T>(result);

  Future<T?>? push<T>(Route<T> route) => state?.push<T>(route);

  void pushReplacementNamed(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    state?.pushReplacementNamed<void, void>(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }

  void pushName(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    state?.pushNamed<void>(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;

  final arguments =
      settings.arguments as Map<String, dynamic>? ?? <String, dynamic>{};

  final routeType =
      arguments['routeType'] as RouteType? ?? RouteType.defaultRoute;

  Widget screen;

  switch (routeName) {
    case LandingScreen.route:
      screen = LandingScreen();
      break;
    case SettingScreen.route:
      screen = const SettingScreen();
      break;
    default:
      screen = LandingScreen();
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    case RouteType.defaultRoute:
      return MaterialPageRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
  }
}
