import 'package:projectfourthyear/feature/add_student_teacher/data/api/api_service_student.dart';
import 'package:projectfourthyear/feature/add_student_teacher/model/add_student/request/request_student.dart';
import 'package:projectfourthyear/feature/add_student_teacher/model/add_student/response/response_student.dart';

class RepoStudent {
  final ApiServiceStudent apiService;

  RepoStudent({required this.apiService});

  Future <List<ResponseStudent>> getStudent() async {
    return await apiService.getData();
  }

  Future<ResponseStudent> createStudent(RequestStudent requestStudent) async {
    return await apiService.addStudent(requestStudent);
  }

  Future<ResponseStudent> updateStudent(
    int id,
    RequestStudent requestStudent,
  ) async {
    return await apiService.editStudent(id, requestStudent);
  }

  Future<void> cancelStudent(int id) async {
    await apiService.deleteStudent(id);
  }
}
