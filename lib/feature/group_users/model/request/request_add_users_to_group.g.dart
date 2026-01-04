// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_add_users_to_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAddUserToGroup _$RequestAddUserToGroupFromJson(
  Map<String, dynamic> json,
) => RequestAddUserToGroup(
  userId: (json['userId'] as num).toInt(),
  groupId: (json['groupId'] as num).toInt(),
  cost: (json['cost'] as num).toInt(),
);

Map<String, dynamic> _$RequestAddUserToGroupToJson(
  RequestAddUserToGroup instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'groupId': instance.groupId,
  'cost': instance.cost,
};
