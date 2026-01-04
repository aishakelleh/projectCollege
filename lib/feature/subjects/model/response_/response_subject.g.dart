// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSubject _$ResponseSubjectFromJson(Map<String, dynamic> json) =>
    ResponseSubject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      levelId: (json['levelId'] as num).toInt(),
      teachers: (json['teachers'] as List<dynamic>)
          .map((e) => ResponseUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      level: ResponseLevel.fromJson(json['level'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseSubjectToJson(ResponseSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'levelId': instance.levelId,
      'teachers': instance.teachers,
      'level': instance.level,
    };
