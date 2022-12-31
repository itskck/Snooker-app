import 'package:flutter/material.dart';

class ClickableSettingsRow extends StatelessWidget {
  const ClickableSettingsRow({
    super.key,
    required this.title,
    required this.onTap,
    required this.active,
    this.icon,
  });

  final String title;
  final VoidCallback onTap;
  final bool active;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: active
          ? icon != null
              ? icon
              : Icon(Icons.check)
          : null,
      onTap: () => onTap(),
    );
  }
}
