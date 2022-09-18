import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/player/player_stat.dart';

class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            PlayerStat(
              title: tr('stat_frames_won'),
              content: player.frameswon.toString(),
            ),
            PlayerStat(
              title: tr('stat_frames_lost'),
              content: player.frameslost.toString(),
            ),
          ],
        ),
        Column(
          children: [
            PlayerStat(
              title: tr('stat_win_ratio'),
              content: '${player.frameswon * 100 / player.frameslost} %',
            ),
            PlayerStat(
              title: tr('stat_max_break'),
              content: player.maxbreak.toString(),
            ),
          ],
        )
      ],
    );
  }
}
