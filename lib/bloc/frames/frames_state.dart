part of 'frames_cubit.dart';

abstract class FramesState extends Equatable {
  const FramesState();

  @override
  List<Object> get props => [];
}

class FramesData extends FramesState {
  const FramesData(this.frames);
  final List<Frame> frames;

  @override
  List<Object> get props => [frames];
}
