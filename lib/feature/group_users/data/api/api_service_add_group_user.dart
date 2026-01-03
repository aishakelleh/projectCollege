import 'package:dio/dio.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/model/response/response_get_user_group/response_group_users.dart';
import 'package:projectfourthyear/feature/group_users/model/response/response_post_relation/response_relation.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service_add_group_user.g.dart';

@RestApi(baseUrl: 'https://mohmmadfallaha053.premiumasp.net/api/v1')
abstract class ApiServiceAddGroupUser {
  factory ApiServiceAddGroupUser(Dio dio, {String baseUrl}) =
      _ApiServiceAddGroupUser;

  @GET('/GroupUsers/get-users-by-group-id')
  Future<List<ResponseGroupUsers>> getDataGroupUser({
    @Query('groupId') int groupId,
    @Query('role') int role,}
  );

  @POST('/GroupUsers/add-user-to-group')
  Future<ResponseRelation> addGroupUser(
    @Body() RequestAddUserToGroup requestAddUserToGroup,
  );

  @PUT('/GroupUsers/update-user-in-group')
  Future<ResponseRelation> editGroupUser(
    @Body() RequestAddUserToGroup requestAddUserToGroup,
  );

  @DELETE('/GroupUsers/delete-user-from-group')
  Future<void> deleteGroupUser(
    @Query('userId') int userId,
    @Query('groupId') int groupId,
  );
}
