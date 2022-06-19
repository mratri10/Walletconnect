import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tempbit/component/misc/AppNavigator.dart';
import 'package:tempbit/component/misc/global_provider.dart';
import 'package:tempbit/component/misc/router.dart';
import 'package:tempbit/core/serviceLocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServices();
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stack) => print("Error APP $error"),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: buildNavigator(),
    );
  }
}

Widget buildNavigator() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: app<AppsNavigator>().key,
    navigatorObservers: [
      routeObserver,
    ],
    onGenerateRoute: onGenerateRoute,
  );
}

Widget buildRouter() {
  final router = app<AppsRouter>().router;
  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'SuperApps',
    routeInformationParser: router.routeInformationParser,
    routerDelegate: router.routerDelegate,
  );
}
