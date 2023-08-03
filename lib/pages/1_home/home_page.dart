import 'package:floracotest/base/widgets/flora_background.dart';
import 'package:floracotest/pages/1_home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'widgets/flora_list_tile.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloraBackground.home(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloraListTile(
                    title: 'Track my period',
                    subtitle: 'Contraception and wellbeing',
                    onTap: () => context
                        .read<HomeBloc>()
                        .add(const LoginViaInput(LoginTypes.period)),
                  ),
                  FloraListTile(
                    title: 'Get pragnant',
                    subtitle: 'Learn about reproductive health',
                    onTap: () => context
                        .read<HomeBloc>()
                        .add(const LoginViaInput(LoginTypes.pregnant)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
