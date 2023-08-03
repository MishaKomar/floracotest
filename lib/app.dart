import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base/navigation/flora_router_delegate.dart';
import 'pages/1_home/bloc/home_bloc.dart';

/// {@template app}
/// A [StatelessWidget] that:
/// * uses [bloc](https://pub.dev/packages/bloc) and
/// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// {@endtemplate}
class FloraCoTestApp extends StatelessWidget {
  /// {@macro app}
  const FloraCoTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        home: Router(
          routerDelegate: FloraCoRouterDelegate(),
        ),
      ),
    );
  }
}
