import 'package:flutter/cupertino.dart';

class FloraYearPicker extends StatelessWidget {
  final void Function(DateTime newPeriodDate) onDateTimeChanged;
  final DateTime initialDateTime;
  final int yearsStartRage;
  final int yearsEndRage;

  const FloraYearPicker({
    required this.onDateTimeChanged,
    required this.initialDateTime,
    this.yearsStartRage = 1970,
    this.yearsEndRage = 2100,
    super.key,
  });

  int get _range => yearsEndRage - yearsStartRage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoPicker(
        useMagnifier: true,
        itemExtent: 40,
        scrollController: FixedExtentScrollController(
          initialItem: initialDateTime.year - yearsStartRage,
        ),
        onSelectedItemChanged: (int index) {
          onDateTimeChanged(
            DateTime(index + yearsStartRage),
          );
        },
        children: List<Widget>.generate(_range, (int index) {
          return Center(
            child: Text('${yearsStartRage + index}'),
          );
        }),
      ),
    );
  }
}
