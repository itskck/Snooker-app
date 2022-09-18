import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({
    super.key,
    required this.player,
    this.radius,
  });

  final double? radius;

  final Player player;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: radius,
      backgroundColor: Theme.of(context).primaryColor,
      child: player.picture == null
          ? Text(
              player.name[0].toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            )
          : Image.memory(
              player.picture!,
              fit: BoxFit.contain,
            ),
    );
  }
}
