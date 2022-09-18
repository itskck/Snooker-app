import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/common/loading_widget.dart';
import 'package:snookerpad/ui/widgets/leaderboard/leaderboard_row.dart';
import 'package:snookerpad/ui/widgets/leaderboard/leaderboard_title.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(
      builder: (context, state) {
        if (state is PlayersWithData) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: const LeaderboardTitle(),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.players.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LeaderboardRow(
                        player: state.players[index],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.7,
                        color: Theme.of(context).dividerColor,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<PlayersCubit>(context).addPlayer(
                      Player(
                        id: 1,
                        name: 'name',
                        maxbreak: 12,
                        frameswon: 123,
                        frameslost: 123,
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          );
        } else if (state is PlayersChangingState) {
          return LoadingWidget();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
