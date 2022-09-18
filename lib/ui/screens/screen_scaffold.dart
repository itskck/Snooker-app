import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

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
      ),
      body: SafeArea(child: body),
    );
  }
}
