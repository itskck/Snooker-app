import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/leaderboard_row.dart';
import 'package:snookerpad/ui/widgets/leaderboard_title.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(
      builder: (context, state) {
        if (state is PlayersWithData) {
          return Column(
            children: [
              const LeaderboardTitle(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: state.players.length,
                itemBuilder: (BuildContext context, int index) {
                  return LeaderboardRow(
                    player: state.players[index],
                  );
                },
                separatorBuilder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.7,
                      color: Colors.greenAccent,
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  List<Player> players = [...state.players];
                  players.add(
                    Player(
                      id: 1,
                      name: 'name',
                      maxbreak: 12,
                      frameswon: 123,
                      frameslost: 123,
                    ),
                  );
                  print('added');
                  print(players.toList().toString());
                  BlocProvider.of<PlayersCubit>(context).updatePlayers(players);
                },
                icon: Icon(Icons.add),
              )
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
