import 'package:flutter/material.dart';

class WidgetWithAppbar extends StatelessWidget {
  const WidgetWithAppbar({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            title: Text(title),
          ),
          child
        ],
      ),
    );
  }
}
