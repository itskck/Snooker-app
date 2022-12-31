import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/frame/frame_cubit.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/common/ball_button.dart';
import 'package:snookerpad/ui/widgets/player/player_avatar.dart';

class PlayerPanel extends StatelessWidget {
  const PlayerPanel({
    super.key,
    required this.player,
    required this.points,
    required this.currentBreak,
  });

  final Player player;
  final int points;
  final int currentBreak;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          PlayerAvatar(
            picture: player.picture,
            altText: Text(player.name[0].toUpperCase()),
            radius: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            player.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Divider(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => BlocProvider.of<FrameCubit>(context).addPoints(
                  points: -1,
                  playerId: player.id,
                  countBreak: false,
                ),
                icon: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  points.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              IconButton(
                onPressed: () => BlocProvider.of<FrameCubit>(context).addPoints(
                    points: 1, playerId: player.id, countBreak: false),
                icon: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Text(
            'Break: $currentBreak',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: BallButtonType.values
                  .map(
                      (e) => BallButton(ballButtonType: e, playerId: player.id))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
