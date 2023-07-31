import 'package:floracotest/pages/1_home/bloc/home_bloc.dart';
import 'package:floracotest/pages/1_home/bloc/home_event.dart';
import 'package:floracotest/pages/1_home/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_selector_page_argument.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class DateSelectorPage extends StatelessWidget {
  final DateSelectorPageArgument arg;

  /// {@macro home_page}
  const DateSelectorPage({required this.arg, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/date.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              final type = arg.isPeriod ? 'period' : 'pregnant';
              final initialDate = arg.isPeriod ? state.period : state.pregnant;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Log in your $type date'),
                  SizedBox(
                    height: 100,
                    child: CupertinoDatePicker(
                      initialDateTime: initialDate ?? DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newDate) {
                        final event = arg.isPeriod
                            ? PeriodDateInput(newDate)
                            : PregnantDateInput(newDate);

                        context.read<HomeBloc>().add(event);
                      },
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Log In'),
                    onPressed: () {
                      final event = arg.isPeriod
                          ? PeriodDateInput(DateTime.now())
                          : PregnantDateInput(DateTime.now());

                      context.read<HomeBloc>().add(event);
                      Navigator.pop(context);
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
