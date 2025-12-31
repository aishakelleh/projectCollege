import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_user.g.dart';

@JsonSerializable()
class RequestUser {
  final String name;
  final String email;
  final String password;
  final String phone;
  final int role;
  final int gender;

  RequestUser({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
    required this.gender,
  });

  factory RequestUser.fromJson(Map<String, dynamic> json) =>
      _$RequestUserFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestUserToJson(this);
}
