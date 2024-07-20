import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    super.key,
    required this.body,
    this.title,
  });

  final Widget body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 30,
          ),
          onPressed: () => Routemaster.of(context).pop(),
        ),
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.headlineMedium,
              )
            : null,
      ),
      body: SafeArea(child: body),
    );
  }
}
