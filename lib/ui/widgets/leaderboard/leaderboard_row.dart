import 'package:flutter/material.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/player/player_page.dart';
import 'package:snookerpad/ui/widgets/player/player_avatar.dart';
import 'package:snookerpad/utils/utils.dart';

class LeaderboardRow extends StatefulWidget {
  const LeaderboardRow({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  State<LeaderboardRow> createState() => _LeaderboardRowState();
}

class _LeaderboardRowState extends State<LeaderboardRow> {
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: PlayerAvatar(
                  picture: widget.player.picture,
                  altText: Text(widget.player.name[0].toUpperCase()),
                  radius: 22,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  widget.player.name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(widget.player.frameswon.toString()),
        ),
        Expanded(
          flex: 2,
          child: Text(widget.player.frameslost.toString()),
        ),
        Expanded(
          flex: 2,
          child: Text(
            widget.player.ratio,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(widget.player.maxbreak.toString()),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialogWindow(
                context,
                PlayerPage(
                  playerId: widget.player.id,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
