import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:snookerpad2/ui/screens/leaderboard.dart';
import 'package:snookerpad2/ui/screens/rules.dart';
import 'package:snookerpad2/ui/screens/scoreboard.dart';
import 'package:snookerpad2/ui/screens/settings.dart';

class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton> {
  late int _index;
  final List<Widget> screens = const [
    Scoreboard(),
    Rules(),
    Leaderboard(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[_index],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.scoreboard),
            label: tr('scoreboard'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.rule),
            label: tr('rules'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.leaderboard),
            label: tr('leaderboard'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: tr('settings'),
          ),
        ],
        onDestinationSelected: (value) => setState(() {
          _index = value;
        }),
      ),
    );
  }
}
