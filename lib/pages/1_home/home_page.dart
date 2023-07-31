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
                  ListTile(
                    title: const Text('Track my period'),
                    subtitle: const Text('Contraception and wellbeing'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
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
                  ListTile(
                    title: const Text('Get pragnant'),
                    subtitle: const Text('Learn about reproductive health'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
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
                  ListTile(
                    title: const Text('Check statistics'),
                    subtitle: const Text('More here...'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
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
