import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/player/player_avatar.dart';

class PlayerInfoBar extends StatefulWidget {
  const PlayerInfoBar({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  State<PlayerInfoBar> createState() => _PlayerInfoBarState();
}

class _PlayerInfoBarState extends State<PlayerInfoBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Container(
              height: 50,
              color: Colors.transparent,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 4,
          color: Colors.greenAccent,
        ),
        GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: PlayerAvatar(
                    picture: widget.player.picture,
                    altText: Text(widget.player.name[0].toUpperCase()),
                    radius: 40,
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await BlocProvider.of<PlayersCubit>(context)
                      .updateImage(widget.player);
                },
                icon: Icon(Icons.edit),
              )
            ],
          ),
        )
      ],
    );
  }
}
