import 'package:get_it/get_it.dart';
import 'package:tempbit/component/misc/AppNavigator.dart';
import 'package:tempbit/component/misc/router.dart';

final app = GetIt.instance;

/// Adds all globally available services to the service locator.
void setupServices() {
  //app.registerFactory<RestClient, Dio>((dio) => RestClient(dio));fr

  app
    ..registerLazySingleton(() => AppsRouter())
    ..registerLazySingleton(() => AppsNavigator());
}
