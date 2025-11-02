import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool isLogIn;
  final String? token;
  final String? id;
  final String name;

  LoginResponse({
    required this.isLogIn,
     this.token,
     this.id,
    required this.name,
  });
  factory LoginResponse.fromJson(Map<String,dynamic>json) => _$LoginResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$LoginResponseToJson(this);
}
