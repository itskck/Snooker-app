import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'frame.freezed.dart';
part 'frame.g.dart';

@unfreezed
class Frame with _$Frame {
  factory Frame({
    required final int player1Id,
    required final int player2Id,
    @Default([]) List<String?> player1Scores,
    @Default([]) List<String?> player2Scores,
    @Default(false) bool isFinished,
  }) = _Frame;

  factory Frame.fromJson(Map<String, Object?> json) => _$FrameFromJson(json);
}
