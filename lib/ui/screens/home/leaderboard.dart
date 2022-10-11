import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/core/app.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/widgets/common/loading_widget.dart';
import 'package:snookerpad/ui/widgets/leaderboard/leaderboard_row.dart';
import 'package:snookerpad/ui/widgets/leaderboard/leaderboard_title.dart';
import 'package:snookerpad/ui/widgets/leaderboard/sort_chips.dart';
import 'package:snookerpad/ui/widgets/player/player_create.dart';
import 'package:snookerpad/utils/utils.dart';

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Text(
                  tr('leaderboard'),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const SortChips(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: const LeaderboardTitle(),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
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
              ),
              Center(
                child: IconButton(
                  onPressed: () => showDialogWindow(
                    context,
                    PlayerCreate(),
                  ),
                  icon: Icon(
                    Icons.add,
                    size: 35,
                  ),
                ),
              )
            ],
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
