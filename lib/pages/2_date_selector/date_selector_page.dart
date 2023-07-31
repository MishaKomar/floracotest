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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.arg.isPeriod) ...[
                    Text(
                      'Log in your period date',
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 200,
                      child: CupertinoDatePicker(
                        initialDateTime: selectedPeriod,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newPeriodDate) {
                          setState(() {
                            selectedPeriod = newPeriodDate;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ] else ...[
                    Text(
                      'Log in your pregnant date',
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 200,
                      child: CupertinoPicker(
                        useMagnifier: true,
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: selectedPregnant.year - 1970,
                        ),
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedPregnant = DateTime(index + 1970);
                          });
                        },
                        children: List<Widget>.generate(130, (int index) {
                          return Center(
                            child: Text('${1970 + index}'),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
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
