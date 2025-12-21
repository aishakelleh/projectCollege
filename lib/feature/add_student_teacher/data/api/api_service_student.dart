import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/add_student/request/request_student.dart';
import '../../model/add_student/response/response_student.dart';

part 'api_service_student.g.dart';

@RestApi(baseUrl: 'https://mohmmadfallaha053.premiumasp.net/api/v1')
abstract class ApiServiceStudent {
  factory ApiServiceStudent(Dio dio, {String baseUrl}) = _ApiServiceStudent;

  @GET('/Users?role=3')
  Future<List<ResponseStudent>> getData();

  @POST('/Users')
  Future<ResponseStudent> addStudent(@Body() RequestStudent requestStudent);

  @PUT('/Users/{id}')
  Future<ResponseStudent> editStudent(
    @Path('id') int id,
    @Body() RequestStudent requestStudent,
  );

  @DELETE('/Users/{id}')
  Future<void> deleteStudent(@Path('id') int id);
}
