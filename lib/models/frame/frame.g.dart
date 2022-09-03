// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Frame _$$_FrameFromJson(Map<String, dynamic> json) => _$_Frame(
      player1Id: json['player1Id'] as int,
      player2Id: json['player2Id'] as int,
      player1Scores: (json['player1Scores'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      player2Scores: (json['player2Scores'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FrameToJson(_$_Frame instance) => <String, dynamic>{
      'player1Id': instance.player1Id,
      'player2Id': instance.player2Id,
      'player1Scores': instance.player1Scores,
      'player2Scores': instance.player2Scores,
      'isFinished': instance.isFinished,
    };
