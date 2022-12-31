import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/ui/screens/frames/frame_page.dart';
import 'package:snookerpad/ui/screens/frames/frames_history.dart';
import 'package:snookerpad/ui/screens/frames/new_frame.dart';
import 'package:snookerpad/ui/screens/home_skeleton.dart';
import 'package:snookerpad/ui/widgets/player/player_create.dart';

class Router {
  static final RouteMap onboardingCompletedRoutemap = RouteMap(
    routes: {
      HomeSkeleton.route: (route) => const MaterialPage<dynamic>(
            child: HomeSkeleton(),
          ),
      NewFrame.route: (route) => MaterialPage<dynamic>(
            child: NewFrame(),
          ),
      PlayerCreate.route: (route) => const MaterialPage<dynamic>(
            child: PlayerCreate(),
          ),
      FramePage.route: (route) => const MaterialPage<dynamic>(
            child: FramePage(),
          ),
      FramesHistory.route: (route) => const MaterialPage<dynamic>(
            child: FramesHistory(),
          ),
    },
  );

  static final RouteMap onboardingNotCompletedRoutemap = RouteMap(routes: {});
}
