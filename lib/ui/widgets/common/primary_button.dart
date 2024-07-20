import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.disabled = false,
    required this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 40),
      ),
      child: Text(text),
    );
  }
}
