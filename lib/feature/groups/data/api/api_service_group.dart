import 'package:dio/dio.dart';
import 'package:projectfourthyear/feature/groups/model/request/request_group.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service_group.g.dart';

@RestApi(baseUrl: 'https://mohmmadfallaha053.premiumasp.net/api/v1')
abstract class ApiServiceGroup {
  factory ApiServiceGroup(Dio dio, {String baseUrl}) = _ApiServiceGroup;

  @GET('/Groups')
  Future<List<ResponseGroup>> getData(@Query('levelId') int levelId);

  @POST('/Groups')
  Future<ResponseGroup> addGroup(@Body() RequestGroup requestGroup);

  @PUT('/Groups/{id}')
  Future<ResponseGroup> editGroup(
      @Path('id') int id,
      @Body() RequestGroup requestGroup
      );



  @DELETE('/Groups/{id}')
  Future<void> deleteGroup(@Path('id') int id);
}
