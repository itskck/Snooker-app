// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      maxbreak: (json['maxbreak'] as num).toInt(),
      frameswon: (json['frameswon'] as num).toInt(),
      frameslost: (json['frameslost'] as num).toInt(),
      picture:
          const Uint8ListConverter().fromJson(json['picture'] as List<int>?),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxbreak': instance.maxbreak,
      'frameswon': instance.frameswon,
      'frameslost': instance.frameslost,
      'picture': const Uint8ListConverter().toJson(instance.picture),
    };
