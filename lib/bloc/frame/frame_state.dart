part of 'frame_cubit.dart';

abstract class FrameState extends Equatable {
  const FrameState();

  @override
  List<Object> get props => [];
}

class FrameOngoing extends FrameState {
  const FrameOngoing(this.frame);
  final Frame frame;

  @override
  List<Object> get props => [frame];
}

class FrameFinished extends FrameState {
  const FrameFinished();
}
