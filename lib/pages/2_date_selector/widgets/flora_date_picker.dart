import 'package:flutter/cupertino.dart';

class FloraDatePicker extends StatelessWidget {
  final void Function(DateTime newPeriodDate) onDateTimeChanged;
  final DateTime? initialDateTime;

  const FloraDatePicker({
    required this.onDateTimeChanged,
    this.initialDateTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        initialDateTime: initialDateTime,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  }
}
