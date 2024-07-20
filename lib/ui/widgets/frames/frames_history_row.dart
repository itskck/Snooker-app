import 'package:flutter/material.dart';
import 'package:snookerpad/models/frame/frame.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/player/player_avatar.dart';
import 'package:snookerpad/utils/utils.dart';

class FramesHistoryRow extends StatelessWidget {
  const FramesHistoryRow({
    super.key,
    required this.frame,
  });

  final Frame frame;

  @override
  Widget build(BuildContext context) {
    final Player player1 = getPlayerById(frame.player1Id, context)!;
    final Player player2 = getPlayerById(frame.player2Id, context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PlayerAvatar(
                altText: Text(player1.name[0].toUpperCase()),
                picture: player1.picture,
                radius: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    player1.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          Text('${frame.player1Points} : ${frame.player2Points}'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    player2.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              PlayerAvatar(
                altText: Text(player1.name[0].toUpperCase()),
                picture: player2.picture,
                radius: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
