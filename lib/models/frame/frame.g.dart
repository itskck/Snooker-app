// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Frame _$$_FrameFromJson(Map<String, dynamic> json) => _$_Frame(
      player1Id: json['player1Id'] as int,
      player2Id: json['player2Id'] as int,
      player1Points: json['player1Points'] as int? ?? 0,
      player2Points: json['player2Points'] as int? ?? 0,
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FrameToJson(_$_Frame instance) => <String, dynamic>{
      'player1Id': instance.player1Id,
      'player2Id': instance.player2Id,
      'player1Points': instance.player1Points,
      'player2Points': instance.player2Points,
      'isFinished': instance.isFinished,
    };
