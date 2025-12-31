

import '../../model/add_user/request/request_user.dart';
import '../../model/add_user/response/response_user.dart';
import '../api/api_service_user.dart';

class RepoUser {
  final ApiServiceUser apiService;

  RepoUser({required this.apiService});

  Future <List<ResponseUser>> getUser({int? role}) async {
    return await apiService.getData(role: role);
  }

  Future<ResponseUser> createUser(RequestUser requestUser) async {
    return await apiService.addUser(requestUser);
  }

  Future<ResponseUser> updateUser(
    int id,
    RequestUser requestUser,
  ) async {
    return await apiService.editUser(id, requestUser);
  }

  Future<void> cancelUser(int id) async {
    await apiService.deleteUser(id);
  }
}
