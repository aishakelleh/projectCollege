import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';

part 'response_group_users.g.dart';

@JsonSerializable()
class ResponseGroupUsers {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int role;
  final int gender;
  final ResponseGroup? group;
  final bool isLogIn;

  ResponseGroupUsers({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.gender,
     this.group,
    required this.isLogIn,
  });

  factory ResponseGroupUsers.fromJson(Map<String, dynamic> json) =>
      _$ResponseGroupUsersFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGroupUsersToJson(this);
}
