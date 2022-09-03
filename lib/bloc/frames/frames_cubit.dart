import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:snookerpad2/models/frame/frame.dart';

part 'frames_state.dart';

class FramesCubit extends HydratedCubit<FramesState> {
  FramesCubit() : super(FramesInitial());

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
