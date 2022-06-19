import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tempbit/page/landing/landing.dart';
import 'package:tempbit/page/setting/setting.dart';
import 'package:tempbit/component/misc/router_constant.dart';

class AppsRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        path: '/',
        redirect: (state) => state.namedLocation(
          landingRouteName,
          params: {'tab': 'home'},
        ),
      ),
      GoRoute(
        name: landingRouteName,
        path: 'landing',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: LandingScreen(),
          );
        },
        routes: [
          GoRoute(
            name: settingRouteName,
            path: 'setting',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const SettingScreen(),
            ),
          )
        ],
      ),
      GoRoute(
        path: '/home',
        redirect: (state) => state.namedLocation(
          landingRouteName,
          params: {'tab': 'home'},
        ),
      ),
      GoRoute(
        path: '/dashboard',
        redirect: (state) => state.namedLocation(
          landingRouteName,
          params: {'tab': 'dashboard'},
        ),
      ),
      GoRoute(
        path: '/profile',
        redirect: (state) => state.namedLocation(
          landingRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        name: profileSettingRouteName,
        path: '/profile-setting',
        redirect: (state) => state.namedLocation(
          settingRouteName,
          params: {'tab': 'profile'},
        ),
      ),
    ],
  );
}
