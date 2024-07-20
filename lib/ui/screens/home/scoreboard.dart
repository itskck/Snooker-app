import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:snookerpad/bloc/frame/frame_cubit.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/ui/screens/frames/frame_page.dart';
import 'package:snookerpad/ui/screens/frames/frames_history.dart';
import 'package:snookerpad/ui/screens/frames/new_frame.dart';
import 'package:snookerpad/ui/widgets/common/primary_button.dart';
import 'package:snookerpad/utils/utils.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            onTap: () async {
              final PlayersState playersState =
                  BlocProvider.of<PlayersCubit>(context).state;
              final FrameState frameState =
                  BlocProvider.of<FrameCubit>(context).state;

              if (playersState is PlayersWithData &&
                  playersState.players.isNotEmpty) {
                bool? shouldStart =
                    await shouldStartNewFrame(frameState, context);
                if (shouldStart == true) {
                  Routemaster.of(context).push(NewFrame.route);
                }
              } else {
                showToast(tr('no_players_reminder'));
              }
            },
            text: tr('new_frame'),
          ),
          BlocBuilder<FrameCubit, FrameState>(
            builder: (context, state) {
              return PrimaryButton(
                onTap: state is FrameOngoing
                    ? () => Routemaster.of(context).push(FramePage.route)
                    : null,
                text: tr('load_frame'),
              );
            },
          ),
          PrimaryButton(
            onTap: () => Routemaster.of(context).push(FramesHistory.route),
            text: tr('frames_history'),
          )
        ],
      ),
    );
  }

  Future<bool?> shouldStartNewFrame(
    FrameState state,
    BuildContext context,
  ) async {
    bool? shouldStart = true;
    if (state is FrameOngoing) {
      final alertDialog = AlertDialog(
        title: Text(tr('ongoing_frame')),
        content: Text(tr('frame_reminder_content')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(tr('yes')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(tr('no')),
          ),
        ],
      );
      shouldStart = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return alertDialog;
        },
      );
    }
    return shouldStart;
  }
}
