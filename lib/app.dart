import 'package:floracotest/pages/1_home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base/blocs/theme_bloc.dart';
import 'pages/1_home/bloc/home_bloc.dart';

/// {@template app}
/// A [StatelessWidget] that:
/// * uses [bloc](https://pub.dev/packages/bloc) and
/// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// to manage the state of a counter and the app theme.
/// {@endtemplate}
class FloraCoTestApp extends StatelessWidget {
  /// {@macro app}
  const FloraCoTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
