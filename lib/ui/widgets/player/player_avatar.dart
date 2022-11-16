import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({
    super.key,
    this.player,
    this.radius,
  });

  final double? radius;

  final Player? player;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: radius,
      backgroundColor: Theme.of(context).backgroundColor,
      foregroundImage: player != null
          ? player!.picture != null
              ? Image.memory(player!.picture!).image
              : null
          : null,
      child: player != null
          ? player!.picture == null
              ? Text(
                  player!.name != null ? player!.name[0].toUpperCase() : '',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                )
              : CircularProgressIndicator()
          : Icon(Icons.add_a_photo),
    );
  }
}
