import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/ui/screens/frames/new_frame.dart';
import 'package:snookerpad/ui/screens/home_skeleton.dart';

class Router {
  static final RouteMap onboardingCompletedRoutemap = RouteMap(
    routes: {
      HomeSkeleton.route: (route) => const MaterialPage<dynamic>(
            child: HomeSkeleton(),
          ),
      NewFrame.route: (route) => const MaterialPage<dynamic>(
            child: NewFrame(),
          ),
    },
  );

  static final RouteMap onboardingNotCompletedRoutemap = RouteMap(routes: {});
}
