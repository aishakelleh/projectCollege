import 'package:dio/dio.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/request/request_level.dart';

part 'api_service_level.g.dart';

@RestApi(baseUrl: 'https://mohmmadfallaha053.premiumasp.net/api/v1')
abstract class ApiServiceLevel {
  factory ApiServiceLevel(Dio dio, {String baseUrl}) = _ApiServiceLevel;

  @GET('/Levels')
  Future<List<ResponseLevel>> getLevel();

  @POST('/Levels')
  Future<ResponseLevel> postLevel(@Body() RequestLevel requestLevel);

  @PUT('/Levels/{id}')
  Future<ResponseLevel> putLevel(
    @Body() RequestLevel requestLevel,
    @Path('id') int id,
  );
  @DELETE('/Levels/{id}')
  Future<void>deleteLevel(@Path('id')int id);
}
