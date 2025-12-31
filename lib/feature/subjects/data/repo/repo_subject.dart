import 'package:projectfourthyear/feature/subjects/data/api/api_service_subject.dart';
import 'package:projectfourthyear/feature/subjects/model/response/request_subject.dart';
import 'package:projectfourthyear/feature/subjects/model/response_/response_subject.dart';

class RepoSubject {
  final ApiServiceSubject apiServiceSubject;

  RepoSubject({required this.apiServiceSubject});

  Future<List<ResponseSubject>> getSubject(int levelId) async {
    return await apiServiceSubject.getSubject(levelId);
  }

  Future<ResponseSubject> createSubject(RequestSubject requestSubject) async {
    return await apiServiceSubject.postSubject(requestSubject);
  }

  Future<ResponseSubject> editSubject(RequestSubject requestSubject, int id) async {
    return await apiServiceSubject.putSubject(requestSubject, id);
  }

  Future<void> cancelSubject(int id) async {
    await apiServiceSubject.deleteSubject(id);
  }
}
