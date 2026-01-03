import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_add_users_to_group.g.dart';

@JsonSerializable()
class RequestAddUserToGroup {
  final int userId;
  final int groupId;
  final int cost;

  RequestAddUserToGroup({
    required this.userId,
    required this.groupId,
    required this.cost,
  });

  factory RequestAddUserToGroup.fromJson(Map<String, dynamic> json) =>
      _$RequestAddUserToGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RequestAddUserToGroupToJson(this);
}
