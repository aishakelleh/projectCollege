// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_relation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseRelation _$ResponseRelationFromJson(Map<String, dynamic> json) =>
    ResponseRelation(
      userId: (json['userId'] as num).toInt(),
      groupId: (json['groupId'] as num).toInt(),
      cost: (json['cost'] as num).toInt(),
      user: ResponseUser.fromJson(json['user'] as Map<String, dynamic>),
      group: ResponseGroup.fromJson(json['group'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ResponseRelationToJson(ResponseRelation instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'groupId': instance.groupId,
      'cost': instance.cost,
      'user': instance.user,
      'group': instance.group,
      'createdAt': instance.createdAt.toIso8601String(),
    };
