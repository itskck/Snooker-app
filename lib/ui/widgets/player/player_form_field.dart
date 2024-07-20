import 'package:flutter/material.dart';

class PlayerFormField extends StatelessWidget {
  const PlayerFormField({
    super.key,
    required this.controller,
    required this.title,
  });

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (field) {
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(title),
          ),
        );
      },
    );
  }
}
