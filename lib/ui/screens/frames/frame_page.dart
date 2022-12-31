import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/frame/frame_cubit.dart';
import 'package:snookerpad/models/frame/frame.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/ui/screens/home_skeleton.dart';
import 'package:snookerpad/ui/screens/screen_with_appbar.dart';
import 'package:snookerpad/ui/widgets/frames/player_panel.dart';
import 'package:snookerpad/utils/utils.dart';

class FramePage extends StatelessWidget {
  const FramePage({super.key});

  static const String route = '/frame';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FrameCubit, FrameState>(
      builder: (context, state) {
        if (state is FrameOngoing) {
          final Player player1 = getPlayerById(state.frame.player1Id, context)!;
          final Player player2 = getPlayerById(state.frame.player2Id, context)!;
          final Frame frame = state.frame;

          return ScreenWithAppbar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayerPanel(
                        player: player1,
                        points: frame.player1Points,
                        currentBreak: frame.player1Break,
                      ),
                      PlayerPanel(
                        player: player2,
                        points: frame.player2Points,
                        currentBreak: frame.player2Break,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<FrameCubit>(context).cancelFrame();
                          Routemaster.of(context).popUntil((route) {
                            return route.path == HomeSkeleton.route;
                          });
                        },
                        child: Text(tr('cancel_frame')),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<FrameCubit>(context)
                              .finishFrame(context);
                          Routemaster.of(context).popUntil((route) {
                            return route.path == HomeSkeleton.route;
                          });
                        },
                        child: Text(tr('finish_frame')),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return ScreenWithAppbar(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
