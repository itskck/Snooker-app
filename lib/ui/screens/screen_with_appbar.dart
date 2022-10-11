import 'package:flutter/material.dart';

class ScreenWithAppbar extends StatelessWidget {
  const ScreenWithAppbar({
    super.key,
    required this.child,
    this.title,
  });

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? "",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
