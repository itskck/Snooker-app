import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snookerpad2/models/player/player.dart';

class LeaderboardRow extends StatelessWidget {
  const LeaderboardRow({super.key, required this.player});
  final Player player;

  @override
  Widget build(BuildContext context) {
    final Color randomColor =
        Colors.accents[Random().nextInt(Colors.accents.length)];

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: CircleAvatar(
                  backgroundColor: randomColor,
                  child: player.picture == null
                      ? Text(
                          player.name[0].toUpperCase(),
                        )
                      : Image.memory(player.picture!),
                ),
              ),
              Text(
                player.name,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(player.frameswon.toString()),
        ),
        Expanded(
          flex: 2,
          child: Text(player.frameslost.toString()),
        ),
        Expanded(
          flex: 2,
          child: Text((player.frameswon / player.frameslost).toString()),
        ),
        Expanded(
          flex: 2,
          child: Text(player.maxbreak.toString()),
        ),
      ],
    );
  }
}
