import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempbit/component/common/Application_cubit.dart';

class GlobalProvider extends StatelessWidget {
  final Widget child;
  const GlobalProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ApplicationCubit())],
      child: child,
    );
  }
}
