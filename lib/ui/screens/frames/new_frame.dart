import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/frame/frame_cubit.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/ui/screens/frames/frame_page.dart';
import 'package:snookerpad/ui/screens/screen_scaffold.dart';
import 'package:snookerpad/ui/widgets/frames/player_chooser.dart';
import 'package:snookerpad/utils/utils.dart';

class NewFrame extends StatefulWidget {
  NewFrame({super.key});
  static const String route = '/new-frame';

  @override
  State<NewFrame> createState() => _NewFrameState();
}

class _NewFrameState extends State<NewFrame> {
  String? player1Name, player2Name;
  List<String> players = [];

  @override
  void initState() {
    super.initState();
    final state = BlocProvider.of<PlayersCubit>(context).state;
    if (state is PlayersWithData) {
      state.players.forEach((element) {
        players.add(element.name);
      });
      player1Name = players[0];
      player2Name = players[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(
      builder: (context, state) {
        if (state is PlayersWithData) {
          return BlocListener<FrameCubit, FrameState>(
            listener: (context, state) {
              if (state is FrameOngoing) {
                Routemaster.of(context).replace(FramePage.route);
              }
            },
            child: ScreenScaffold(
              title: tr('choose_players'),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlayerChooser(
                        names: players,
                        onChanged: (value) => setState(() {
                          player1Name = value;
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text('vs'),
                      ),
                      PlayerChooser(
                        names: players,
                        onChanged: (value) => setState(() {
                          player2Name = value;
                        }),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (player1Name != null && player2Name != null) {
                              if (player1Name != player2Name) {
                                await BlocProvider.of<FrameCubit>(context)
                                    .startFrame(
                                  player1Id:
                                      getPlayerByName(player1Name!, context),
                                  player2Id:
                                      getPlayerByName(player2Name!, context),
                                );
                                Routemaster.of(context)
                                    .replace(FramePage.route);
                              } else {
                                showToast(tr('cannot_start_with_same_players'));
                              }
                            }
                          },
                          child: Text(tr('play')),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.4,
                              40,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Routemaster.of(context).pop();
                          },
                          child: Text(tr('cancel')),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.4,
                              40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
