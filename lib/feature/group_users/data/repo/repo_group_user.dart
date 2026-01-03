import 'package:projectfourthyear/feature/group_users/data/api/api_service_add_group_user.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/model/response/response_get_user_group/response_group_users.dart';
import 'package:projectfourthyear/feature/group_users/model/response/response_post_relation/response_relation.dart';

class RepoGroupUser {
  final ApiServiceAddGroupUser apiServiceAddGroupUser;

  RepoGroupUser({required this.apiServiceAddGroupUser});

  Future<List<ResponseGroupUsers>> getGroupUser(int groupId, int role) async {
    return await apiServiceAddGroupUser.getDataGroupUser(
      groupId: groupId,
      role: role,
    );
  }

  Future<ResponseRelation> postGroupUser(
    RequestAddUserToGroup requestAddUserToGroup,
  ) async {
    return await apiServiceAddGroupUser.addGroupUser(requestAddUserToGroup);
  }

  Future<ResponseRelation> putGroupUser(
    RequestAddUserToGroup requestAddUserToGroup,
  ) async {
    return await apiServiceAddGroupUser.editGroupUser(requestAddUserToGroup);
  }

  Future<void> cancelGroupUser(int userId, int groupId) async {
    await apiServiceAddGroupUser.deleteGroupUser(userId, groupId);
  }
}
