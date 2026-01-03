import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../add_user/model/add_user/response/response_user.dart';
import '../../../../groups/model/response/response_group.dart';
part 'response_relation.g.dart';
@JsonSerializable()
class ResponseRelation {
  final int userId;
  final int groupId;
  final int cost;
  final ResponseUser user;
  final ResponseGroup group;
  final DateTime createdAt;

  ResponseRelation({
    required this.userId,
    required this.groupId,
    required this.cost,
    required this.user,
    required this.group,
    required this.createdAt,
  });

  factory ResponseRelation.fromJson(Map<String, dynamic> json) =>
      _$ResponseRelationFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseRelationToJson(this);
}
