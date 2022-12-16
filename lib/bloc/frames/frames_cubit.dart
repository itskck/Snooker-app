import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:snookerpad/models/frame/frame.dart';

part 'frames_state.dart';

class FramesCubit extends HydratedCubit<FramesState> {
  FramesCubit() : super(FramesInitial());

  List<Frame> get ongoingFrames {
    if (state is FramesEverythingFinished) {
      return (state as FramesEverythingFinished).previousFrames;
    } else if (state is FramesWithOngoing) {
      return (state as FramesWithOngoing).previousFrames;
    } else {
      return [];
    }
  }

  Future<void> startFrame({
    required int player1id,
    required int player2id,
  }) async {
    final Frame frame = Frame(player1Id: player1id, player2Id: player2id);
    emit(FramesWithOngoing(ongoingFrames, frame));
  }

  Future<void> addPlayerPoints(int playerId, int points) async {
    if (state is FramesWithOngoing) {
      Frame frame = (state as FramesWithOngoing).ongoingFrame;
    }
  }

  @override
  FramesState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('ongoing')) {
      return FramesWithOngoing(
        json['previous'] as List<Frame>,
        json['ongoing'] as Frame,
      );
    }
    if (json.containsKey('previous')) {
      return FramesEverythingFinished(
        json['previous'] as List<Frame>,
      );
    } else {
      return FramesInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(FramesState state) {
    if (state is FramesWithOngoing) {
      return {
        'ongoing': state.ongoingFrame,
        'previous': state.previousFrames,
      };
    }
    if (state is FramesEverythingFinished) {
      return {
        'previous': state.previousFrames,
      };
    } else {
      return {};
    }
  }
}
