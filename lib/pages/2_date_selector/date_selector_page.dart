import 'package:floracotest/base/widgets/flora_background.dart';
import 'package:floracotest/pages/1_home/bloc/home_bloc.dart';
import 'package:floracotest/pages/1_home/bloc/home_event.dart';
import 'package:floracotest/pages/1_home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/flora_date_picker.dart';
import 'widgets/flora_title_text.dart';
import 'widgets/flora_year_picker.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class DateSelectorPage extends StatefulWidget {
  final LoginTypes type;

  /// {@macro home_page}
  const DateSelectorPage({required this.type, super.key});

  @override
  State<DateSelectorPage> createState() => _DateSelectorPageState();
}

class _DateSelectorPageState extends State<DateSelectorPage> {
  late HomeBloc bloc;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    bloc = context.read<HomeBloc>();
    if (bloc.state.isDateSelected) {
      selectedDate = bloc.state.date!;
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
                    title: widget.type == LoginTypes.period
                        ? 'Log in your period date'
                        : 'Log in your pregnant date',
                  ),
                  const SizedBox(height: 24),
                  widget.type == LoginTypes.period
                      ? FloraDatePicker(
                          initialDateTime: selectedDate,
                          onDateTimeChanged: (DateTime newDate) =>
                              setState(() => selectedDate = newDate),
                        )
                      : FloraYearPicker(
                          initialDateTime: selectedDate,
                          onDateTimeChanged: (DateTime newDate) =>
                              setState(() => selectedDate = newDate),
                        ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    child: const Text('Log In'),
                    onPressed: () {
                      context.read<HomeBloc>().add(DateInput(selectedDate));
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
