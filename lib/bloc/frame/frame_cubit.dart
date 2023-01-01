import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:snookerpad/bloc/frames/frames_cubit.dart';
import 'package:snookerpad/bloc/players/players_cubit.dart';
import 'package:snookerpad/models/frame/frame.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/utils/utils.dart';

part 'frame_state.dart';

class FrameCubit extends HydratedCubit<FrameState> {
  FrameCubit(this.playersCubit) : super(const FrameFinished());

  factory FrameCubit.create(BuildContext context) {
    return FrameCubit(BlocProvider.of<PlayersCubit>(context));
  }

  final PlayersCubit playersCubit;

  Frame? get currentFrame {
    if (state is FrameOngoing) {
      return (state as FrameOngoing).frame;
    } else {
      return null;
    }
  }

  Future<void> startFrame({
    required int player1Id,
    required int player2Id,
  }) async {
    try {
      final frameToEmit = Frame(player1Id: player1Id, player2Id: player2Id);
      emit(FrameOngoing(frameToEmit));
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  void cancelFrame() {
    try {
      emit(FrameFinished());
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  Future<void> finishFrame(BuildContext context) async {
    try {
      if (state is FrameOngoing) {
        Player player1 = getPlayerById(currentFrame!.player1Id, context)!;
        Player player2 = getPlayerById(currentFrame!.player2Id, context)!;

        await playersCubit.editPlayer(
          player1,
          maxbreak: currentFrame!.player1MaxBreak,
          won: currentFrame!.player1Points > currentFrame!.player2Points
              ? true
              : currentFrame!.player1Points < currentFrame!.player2Points
                  ? false
                  : null,
        );
        await playersCubit.editPlayer(
          player2,
          maxbreak: currentFrame!.player2MaxBreak,
          won: currentFrame!.player2Points > currentFrame!.player1Points
              ? true
              : currentFrame!.player2Points < currentFrame!.player1Points
                  ? false
                  : null,
        );
        BlocProvider.of<FramesCubit>(context).addFrame(
          (state as FrameOngoing).frame,
        );
        emit(FrameFinished());
      }
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  Future<void> resetBreak(int playerId) async {
    try {
      if (state is FrameOngoing) {
        var frameToEmit = currentFrame!.copyWith(
          player1Break: 0,
          player2Break: 0,
        );
        emit(FrameOngoing(frameToEmit));
      }
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  Future<void> addPoints({
    required int points,
    required int playerId,
    bool countBreak = true,
  }) async {
    try {
      if (state is FrameOngoing) {
        var frameToEmit = currentFrame!.copyWith(
          player1Points: playerId == currentFrame!.player1Id
              ? currentFrame!.player1Points + points
              : currentFrame!.player1Points,
          player2Points: playerId == currentFrame!.player2Id
              ? currentFrame!.player2Points + points
              : currentFrame!.player2Points,
        );
        if (countBreak) {
          frameToEmit = frameToEmit.copyWith(
            player1Break: playerId == currentFrame!.player1Id
                ? currentFrame!.player1Break + points
                : 0,
            player2Break: playerId == currentFrame!.player2Id
                ? currentFrame!.player2Break + points
                : 0,
          );
        } else {
          frameToEmit = frameToEmit.copyWith(
            player1Break: 0,
            player2Break: 0,
          );
        }

        frameToEmit = frameToEmit.copyWith(
          player1MaxBreak:
              frameToEmit.player1Break > frameToEmit.player1MaxBreak
                  ? frameToEmit.player1Break
                  : frameToEmit.player1MaxBreak,
          player2MaxBreak:
              frameToEmit.player2Break > frameToEmit.player2MaxBreak
                  ? frameToEmit.player2Break
                  : frameToEmit.player2MaxBreak,
        );

        emit(FrameOngoing(frameToEmit));
      }
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  @override
  FrameState? fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return FrameOngoing(Frame.fromJson(json));
    } else
      return const FrameFinished();
  }

  @override
  Map<String, dynamic>? toJson(FrameState state) {
    if (state is FrameOngoing) {
      return state.frame.toJson();
    } else {
      return {};
    }
  }
}
