import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/add_user/request/request_user.dart';
import '../../model/add_user/response/response_user.dart';


part 'api_service_user.g.dart';

@RestApi(baseUrl: 'https://mohmmadfallaha053.premiumasp.net/api/v1')
abstract class ApiServiceUser {
  factory ApiServiceUser(Dio dio, {String baseUrl}) = _ApiServiceUser;

  @GET('/Users')
  Future<List<ResponseUser>> getData({@Query('role')int? role});

  @POST('/Users')
  Future<ResponseUser> addUser(@Body() RequestUser requestUser);

  @PUT('/Users/{id}')
  Future<ResponseUser> editUser(
    @Path('id') int id,
    @Body() RequestUser requestUser,
  );

  @DELETE('/Users/{id}')
  Future<void> deleteUser(@Path('id') int id);
}
