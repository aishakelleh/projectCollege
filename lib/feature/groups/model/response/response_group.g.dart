// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGroup _$ResponseGroupFromJson(Map<String, dynamic> json) =>
    ResponseGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      levelId: (json['levelId'] as num).toInt(),
      level: ResponseLevel.fromJson(json['level'] as Map<String, dynamic>),
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$ResponseGroupToJson(ResponseGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'levelId': instance.levelId,
      'level': instance.level,
      'gender': instance.gender,
    };
