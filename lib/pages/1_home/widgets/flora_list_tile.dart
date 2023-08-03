import 'package:flutter/material.dart';

class FloraListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const FloraListTile({
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
