// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FrameImpl _$$FrameImplFromJson(Map<String, dynamic> json) => _$FrameImpl(
      player1Id: (json['player1Id'] as num).toInt(),
      player2Id: (json['player2Id'] as num).toInt(),
      player1Points: (json['player1Points'] as num?)?.toInt() ?? 0,
      player2Points: (json['player2Points'] as num?)?.toInt() ?? 0,
      player1Break: (json['player1Break'] as num?)?.toInt() ?? 0,
      player2Break: (json['player2Break'] as num?)?.toInt() ?? 0,
      player1MaxBreak: (json['player1MaxBreak'] as num?)?.toInt() ?? 0,
      player2MaxBreak: (json['player2MaxBreak'] as num?)?.toInt() ?? 0,
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$$FrameImplToJson(_$FrameImpl instance) =>
    <String, dynamic>{
      'player1Id': instance.player1Id,
      'player2Id': instance.player2Id,
      'player1Points': instance.player1Points,
      'player2Points': instance.player2Points,
      'player1Break': instance.player1Break,
      'player2Break': instance.player2Break,
      'player1MaxBreak': instance.player1MaxBreak,
      'player2MaxBreak': instance.player2MaxBreak,
      'isFinished': instance.isFinished,
    };
