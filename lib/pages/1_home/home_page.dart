import 'package:floracotest/pages/2_date_selector/date_selector_page.dart';
import 'package:floracotest/pages/2_date_selector/date_selector_page_argument.dart';
import 'package:floracotest/pages/3_statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
// import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Log period'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DateSelectorPage(
                            arg: DateSelectorPageArgument(isPeriod: true),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    child: const Text('Log pragnant'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DateSelectorPage(
                            arg: DateSelectorPageArgument(isPeriod: false),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    child: const Text('Check stats'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StatisticsPage(),
                        ),
                      );
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
