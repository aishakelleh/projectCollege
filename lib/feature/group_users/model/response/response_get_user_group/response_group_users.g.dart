// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_group_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGroupUsers _$ResponseGroupUsersFromJson(Map<String, dynamic> json) =>
    ResponseGroupUsers(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: (json['role'] as num).toInt(),
      gender: (json['gender'] as num).toInt(),
      group: json['group'] == null
          ? null
          : ResponseGroup.fromJson(json['group'] as Map<String, dynamic>),
      isLogIn: json['isLogIn'] as bool,
    );

Map<String, dynamic> _$ResponseGroupUsersToJson(ResponseGroupUsers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'gender': instance.gender,
      'group': instance.group,
      'isLogIn': instance.isLogIn,
    };
