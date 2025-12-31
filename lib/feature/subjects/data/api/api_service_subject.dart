import 'package:dio/dio.dart';
import 'package:projectfourthyear/feature/subjects/model/response_/response_subject.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/response/request_subject.dart';


part 'api_service_subject.g.dart';

@RestApi(baseUrl: 'https://mohmmadfallaha053.premiumasp.net/api/v1')
abstract class ApiServiceSubject {
  factory ApiServiceSubject(Dio dio, {String baseUrl}) = _ApiServiceSubject;

  @GET('/Subjects')
  Future<List<ResponseSubject>> getSubject(@Query('levelId') int levelId);

  @POST('/Subjects')
  Future<ResponseSubject> postSubject(@Body() RequestSubject requestSubject);

  @PUT('/Subjects/{id}')
  Future<ResponseSubject> putSubject(
      @Body() RequestSubject requestSubject,
      @Path('id') int id,
      );
  @DELETE('/Subjects/{id}')
  Future<void>deleteSubject(@Path('id')int id);
}
