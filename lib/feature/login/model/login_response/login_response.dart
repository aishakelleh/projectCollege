import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool isLogIn;
  final String token;
  final int id;
  final String name;

  LoginResponse({
    required this.isLogIn,
    required this.token,
    required this.id,
    required this.name,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}
