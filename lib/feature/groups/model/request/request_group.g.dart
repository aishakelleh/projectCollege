// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestGroup _$RequestGroupFromJson(Map<String, dynamic> json) => RequestGroup(
  name: json['name'] as String,
  levelId: (json['levelId'] as num).toInt(),
  gender: (json['gender'] as num).toInt(),
);

Map<String, dynamic> _$RequestGroupToJson(RequestGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'levelId': instance.levelId,
      'gender': instance.gender,
    };
