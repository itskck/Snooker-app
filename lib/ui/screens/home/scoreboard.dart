import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/ui/screens/frames/new_frame.dart';
import 'package:snookerpad/ui/widgets/common/primary_button.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            onTap: () => Routemaster.of(context).push(NewFrame.route),
            text: tr('new_frame'),
          ),
          PrimaryButton(onTap: () {}, text: tr('load_frame')),
        ],
      ),
    );
  }
}
