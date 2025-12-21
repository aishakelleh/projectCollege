import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projectfourthyear/feature/add_student_teacher/model/add_student/response/response_student.dart';

part 'add_student_state.freezed.dart';
@freezed
abstract class  AddStudentState  with _$AddStudentState{
  factory AddStudentState({
   @Default(Status.initial)  Status status,
   @Default([]) List<ResponseStudent> students,
    String? errorMassage,
}) =_AddStudentState;
}
enum Status{initial,loading,success,failure}