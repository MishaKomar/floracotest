import 'package:floracotest/base/widgets/flora_background.dart';
import 'package:floracotest/pages/1_home/bloc/home_bloc.dart';
import 'package:floracotest/pages/1_home/bloc/home_event.dart';
import 'package:floracotest/pages/1_home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class StatisticsPage extends StatelessWidget {
  /// {@macro home_page}
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloraBackground.statistics(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isPeriod)
                    Text(
                      'Period: ${state.periodLabel}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  if (state.isPregnant)
                    Text(
                      'Pregnant: ${state.pregnantLabel}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    child: const Text('Clear'),
                    onPressed: () {
                      context.read<HomeBloc>().add(ClearInput());
                    },
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
