// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      id: json['id'] as int,
      name: json['name'] as String,
      maxbreak: json['maxbreak'] as int,
      frameswon: json['frameswon'] as int,
      frameslost: json['frameslost'] as int,
      picture:
          const Uint8ListConverter().fromJson(json['picture'] as List<int>?),
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxbreak': instance.maxbreak,
      'frameswon': instance.frameswon,
      'frameslost': instance.frameslost,
      'picture': const Uint8ListConverter().toJson(instance.picture),
    };
