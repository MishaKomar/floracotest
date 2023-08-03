import 'package:floracotest/base/widgets/flora_background.dart';
import 'package:floracotest/pages/1_home/bloc/home_bloc.dart';
import 'package:floracotest/pages/1_home/bloc/home_event.dart';
import 'package:floracotest/pages/1_home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/date_selector_page_argument.dart';
import 'widgets/flora_date_picker.dart';
import 'widgets/flora_title_text.dart';
import 'widgets/flora_year_picker.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class DateSelectorPage extends StatefulWidget {
  final DateSelectorPageArgument arg;

  /// {@macro home_page}
  const DateSelectorPage({required this.arg, super.key});

  @override
  State<DateSelectorPage> createState() => _DateSelectorPageState();
}

class _DateSelectorPageState extends State<DateSelectorPage> {
  late HomeBloc bloc;
  DateTime selectedPeriod = DateTime.now();
  DateTime selectedPregnant = DateTime.now();

  @override
  void initState() {
    bloc = context.read<HomeBloc>();
    if (bloc.state.period != null) {
      selectedPeriod = bloc.state.period!;
    }
    if (bloc.state.pregnant != null) {
      selectedPregnant = bloc.state.pregnant!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloraBackground.date(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloraTitleText(
                    title: widget.arg.isPeriod
                        ? 'Log in your period date'
                        : 'Log in your pregnant date',
                  ),
                  const SizedBox(height: 24),
                  widget.arg.isPeriod
                      ? FloraDatePicker(
                          initialDateTime: selectedPeriod,
                          onDateTimeChanged: (DateTime newDate) =>
                              setState(() => selectedPeriod = newDate),
                        )
                      : FloraYearPicker(
                          initialDateTime: selectedPregnant,
                          onDateTimeChanged: (DateTime newDate) =>
                              setState(() => selectedPregnant = newDate),
                        ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    child: const Text('Log In'),
                    onPressed: () {
                      if (widget.arg.isPeriod) {
                        context
                            .read<HomeBloc>()
                            .add(PeriodDateInput(selectedPeriod));
                      } else {
                        context
                            .read<HomeBloc>()
                            .add(PregnantDateInput(selectedPregnant));
                      }

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
