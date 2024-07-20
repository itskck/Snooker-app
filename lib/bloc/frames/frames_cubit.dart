import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:snookerpad/models/frame/frame.dart';

part 'frames_state.dart';

class FramesCubit extends HydratedCubit<FramesState> {
  FramesCubit() : super(FramesData([]));

  static const String jsonKey = 'frames';

  void addFrame(Frame frame) {
    try {
      emit(FramesData([...(state as FramesData).frames, frame]));
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  void removePlayerFrames(int playerId) {
    try {
      final newFrames = (state as FramesData).frames;
      newFrames.removeWhere(
        (element) =>
            (element.player1Id == playerId || element.player2Id == playerId),
      );
      emit(FramesData(newFrames));
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  void removeAllFrames() {
    emit(FramesData([]));
  }

  @override
  FramesState? fromJson(Map<String, dynamic> json) {
    return FramesData(json[jsonKey] as List<Frame>);
  }

  @override
  Map<String, dynamic>? toJson(FramesState state) {
    return {
      jsonKey: (state as FramesData).frames,
    };
  }
}
