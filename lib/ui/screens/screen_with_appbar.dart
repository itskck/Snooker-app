import 'package:flutter/material.dart';

class ScreenWithAppbar extends StatelessWidget {
  const ScreenWithAppbar({
    super.key,
    required this.child,
    this.fab,
    this.title,
  });

  final Widget child;
  final String? title;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          title ?? "",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
