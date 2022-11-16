import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/ui/screens/frames/new_frame.dart';
import 'package:snookerpad/ui/screens/home_skeleton.dart';
import 'package:snookerpad/ui/screens/settings/language_pick_screen.dart';
import 'package:snookerpad/ui/widgets/player/player_create.dart';

class Router {
  static final RouteMap onboardingCompletedRoutemap = RouteMap(
    routes: {
      HomeSkeleton.route: (route) => const MaterialPage<dynamic>(
            child: HomeSkeleton(),
          ),
      NewFrame.route: (route) => const MaterialPage<dynamic>(
            child: NewFrame(),
          ),
      PlayerCreate.route: (route) => const MaterialPage<dynamic>(
            child: PlayerCreate(),
          ),
    },
  );

  static final RouteMap onboardingNotCompletedRoutemap = RouteMap(routes: {});
}
