import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_user.g.dart';

@JsonSerializable()
class ResponseUser {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int role;
  final int gender;
  final bool isLogIn;

  ResponseUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.gender,
    required this.isLogIn,
  });

  factory ResponseUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserFromJson(json);
  Map<String,dynamic>toJson() => _$ResponseUserToJson(this);
}
