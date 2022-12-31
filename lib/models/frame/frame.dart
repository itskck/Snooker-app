import 'package:freezed_annotation/freezed_annotation.dart';

part 'frame.freezed.dart';
part 'frame.g.dart';

@unfreezed
class Frame with _$Frame {
  factory Frame({
    required final int player1Id,
    required final int player2Id,
    @Default(0) int player1Points,
    @Default(0) int player2Points,
    @Default(0) int player1Break,
    @Default(0) int player2Break,
    @Default(0) int player1MaxBreak,
    @Default(0) int player2MaxBreak,
    @Default(false) bool isFinished,
  }) = _Frame;

  factory Frame.fromJson(Map<String, Object?> json) => _$FrameFromJson(json);
}
