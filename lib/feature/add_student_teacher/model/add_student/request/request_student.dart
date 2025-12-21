import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_student.g.dart';

@JsonSerializable()
class RequestStudent {
  final String name;
  final String email;
  final String password;
  final String phone;
  final int role;
  final int gender;

  RequestStudent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
    required this.gender,
  });

  factory RequestStudent.fromJson(Map<String, dynamic> json) =>
      _$RequestStudentFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestStudentToJson(this);
}
