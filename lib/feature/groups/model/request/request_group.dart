import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_group.g.dart';

@JsonSerializable()
class RequestGroup {
  final String name;
  final int levelId;
  final int gender;

  RequestGroup({
    required this.name,
    required this.levelId,
    required this.gender,
  });

  factory RequestGroup.fromJson(Map<String, dynamic> json) =>
      _$RequestGroupFromJson(json);

  Map<String, dynamic> toJson() => _$RequestGroupToJson(this);
}
