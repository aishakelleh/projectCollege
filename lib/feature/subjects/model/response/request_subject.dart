import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_subject.g.dart';

@JsonSerializable()
class RequestSubject {
  final String name;
  final int levelId;
  final List<int> userIds;

  RequestSubject({
    required this.name,
    required this.levelId,
    required this.userIds,
  });

  factory RequestSubject.fromJson(Map<String, dynamic> json) =>
      _$RequestSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSubjectToJson(this);
}
