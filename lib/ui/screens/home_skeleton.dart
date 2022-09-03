import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:snookerpad2/ui/screens/home/leaderboard.dart';
import 'package:snookerpad2/ui/screens/home/rules.dart';
import 'package:snookerpad2/ui/screens/home/scoreboard.dart';
import 'package:snookerpad2/ui/screens/home/settings.dart';

class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  static const route = '/';

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton> {
  late int index;
  final List<Widget> screens = const [
    Scoreboard(),
    Rules(),
    Leaderboard(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[index],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
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
          index = value;
        }),
      ),
    );
  }
}
