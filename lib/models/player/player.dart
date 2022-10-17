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

  String get ratio =>
      frameslost != 0 ? '${(frameswon / frameslost * 100).round()}%' : '0';

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
