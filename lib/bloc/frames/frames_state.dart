part of 'frames_cubit.dart';

abstract class FramesState extends Equatable {
  const FramesState();

  @override
  List<Object> get props => [];
}

class FramesInitial extends FramesState {}

class FramesWithOngoing extends FramesState {
  const FramesWithOngoing(this.previousFrames, this.ongoingFrame);
  final List<Frame> previousFrames;
  final Frame ongoingFrame;

  @override
  List<Object> get props => [previousFrames, ongoingFrame];
}

class FramesEverythingFinished extends FramesState {
  const FramesEverythingFinished(this.previousFrames);

  final List<Frame> previousFrames;

  @override
  List<Object> get props => [previousFrames];
}
