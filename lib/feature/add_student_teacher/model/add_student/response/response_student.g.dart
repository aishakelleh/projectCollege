// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStudent _$ResponseStudentFromJson(Map<String, dynamic> json) =>
    ResponseStudent(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: (json['role'] as num).toInt(),
      gender: (json['gender'] as num).toInt(),
      isLogIn: json['isLogIn'] as bool,
    );

Map<String, dynamic> _$ResponseStudentToJson(ResponseStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'gender': instance.gender,
      'isLogIn': instance.isLogIn,
    };
