import 'package:flutter/material.dart';

class ClickableSettingsRow extends StatelessWidget {
  const ClickableSettingsRow({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => onTap(),
    );
  }
}
