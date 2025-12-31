import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../add_user/model/add_user/response/response_user.dart';
import '../../../levels/model/response/response_level.dart';


part 'response_subject.g.dart';
@JsonSerializable()
class ResponseSubject {
  final int id;
  final String name;
  final int levelId;
  final List<ResponseUser> teachers;
  final ResponseLevel level;

  ResponseSubject({
    required this.id,
    required this.name,
    required this.levelId,
    required this.teachers,
    required this.level,
  });

  factory ResponseSubject.fromJson(Map<String, dynamic> json) =>
      _$ResponseSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseSubjectToJson(this);
}
