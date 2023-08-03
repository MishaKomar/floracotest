import 'package:flutter/material.dart';

class FloraBackground extends StatelessWidget {
  final AssetImage assetImage;
  final Widget? child;

  const FloraBackground._({
    required this.assetImage,
    this.child,
    super.key,
  });

  factory FloraBackground.home({
    Widget? child,
    Key? key,
  }) =>
      FloraBackground._(
        assetImage: const AssetImage('assets/images/home.png'),
        key: key,
        child: child,
      );

  factory FloraBackground.date({
    Widget? child,
    Key? key,
  }) =>
      FloraBackground._(
        assetImage: const AssetImage('assets/images/date.png'),
        key: key,
        child: child,
      );

  factory FloraBackground.statistics({
    Widget? child,
    Key? key,
  }) =>
      FloraBackground._(
        assetImage: const AssetImage('assets/images/stats.png'),
        key: key,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: assetImage,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
