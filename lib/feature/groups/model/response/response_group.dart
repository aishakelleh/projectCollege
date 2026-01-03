import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../levels/model/response/response_level.dart';

part 'response_group.g.dart';

@JsonSerializable()
class ResponseGroup {
  final int id;
  final String name;
  final int levelId;
  final ResponseLevel level;
  final int gender;

  ResponseGroup({
    required this.id,
    required this.name,
    required this.levelId,
    required this.level,
    required this.gender,
  });

  factory ResponseGroup.fromJson(Map<String, dynamic> json) =>
      _$ResponseGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGroupToJson(this);
}
