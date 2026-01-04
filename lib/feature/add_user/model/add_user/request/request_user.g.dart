// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestUser _$RequestUserFromJson(Map<String, dynamic> json) => RequestUser(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  phone: json['phone'] as String,
  role: (json['role'] as num).toInt(),
  gender: (json['gender'] as num).toInt(),
);

Map<String, dynamic> _$RequestUserToJson(RequestUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'role': instance.role,
      'gender': instance.gender,
    };
