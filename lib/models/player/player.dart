import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snookerpad2/utils/uint8list_converter.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required int id,
    required String name,
    required int maxbreak,
    required int frameswon,
    required int frameslost,
    @Uint8ListConverter() Uint8List? picture,
  }) = _Player;

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
