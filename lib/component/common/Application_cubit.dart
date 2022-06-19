import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempbit/page/landing/landing.dart';
import 'package:tempbit/component/misc/AppNavigator.dart';
import 'package:tempbit/core/serviceLocator.dart';

enum ApplicationState {
  uninitialized,
  initialized,
}

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState.uninitialized) {
    _initialize();
  }

  Future<void> _initialize() async {
    app<AppsNavigator>().pushReplacementNamed(LandingScreen.route);

    emit(ApplicationState.initialized);
  }
}
