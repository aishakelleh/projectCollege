import 'package:projectfourthyear/feature/groups/model/request/request_group.dart';

import '../../model/response/response_group.dart';
import '../api/api_service_group.dart';

class RepoGroup {
  final ApiServiceGroup apiServiceGroup;

  RepoGroup({required this.apiServiceGroup});

  Future<List<ResponseGroup>> getGroup(int levelId) async {
    return await apiServiceGroup.getData(levelId);
  }

  Future<ResponseGroup> createGroup(RequestGroup requestGroup) async {
    return await apiServiceGroup.addGroup(requestGroup);
  }

  Future<ResponseGroup> updateGroup(int id,RequestGroup requestGroup) async {
    return await apiServiceGroup.editGroup(id,requestGroup);
  }

  Future<void> cancelGroup(int id) async {
    await apiServiceGroup.deleteGroup(id);
  }
}
