import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snookerpad/utils/uint8list_converter.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  factory Player({
    required int id,
    required String name,
    required int maxbreak,
    required int frameswon,
    required int frameslost,
    @Uint8ListConverter() Uint8List? picture,
  }) = _Player;

  Player._();

  String get ratio {
    if (frameslost == 0) {
      if (frameswon == 0) {
        return '0%';
      } else {
        return '100%';
      }
    } else {
      return '${(frameswon / (frameslost + frameswon) * 100).round()}%';
    }
  }

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
