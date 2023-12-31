import 'package:flutter/material.dart';

class FloraTitleText extends StatelessWidget {
  final String title;
  const FloraTitleText({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: TextAlign.center,
    );
  }
}
