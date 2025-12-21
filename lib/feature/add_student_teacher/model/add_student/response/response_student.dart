import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_student.g.dart';

@JsonSerializable()
class ResponseStudent {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int role;
  final int gender;
  final bool isLogIn;

  ResponseStudent({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.gender,
    required this.isLogIn,
  });

  factory ResponseStudent.fromJson(Map<String, dynamic> json) =>
      _$ResponseStudentFromJson(json);
  Map<String,dynamic>toJson() => _$ResponseStudentToJson(this);
}
