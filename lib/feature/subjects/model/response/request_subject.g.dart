// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestSubject _$RequestSubjectFromJson(Map<String, dynamic> json) =>
    RequestSubject(
      name: json['name'] as String,
      levelId: (json['levelId'] as num).toInt(),
      userIds: (json['userIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$RequestSubjectToJson(RequestSubject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'levelId': instance.levelId,
      'userIds': instance.userIds,
    };
