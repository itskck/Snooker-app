import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';

class LeaderboardTitle extends StatelessWidget {
  const LeaderboardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 4, child: Text(tr('player'))),
        Expanded(flex: 2, child: Text(tr('frames_won'))),
        Expanded(flex: 2, child: Text(tr('frames_lost'))),
        Expanded(
          flex: 2,
          child: Text(tr('win_ratio')),
        ),
        Expanded(flex: 2, child: Text(tr('max_break'))),
        Expanded(child: SizedBox())
      ],
    );
  }
}
