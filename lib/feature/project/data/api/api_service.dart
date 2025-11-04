import 'package:dio/dio.dart';
import 'package:projectfourthyear/feature/project/model/login_request/login_request.dart';
import 'package:projectfourthyear/feature/project/model/login_response/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://mohmmadfallaha053.premiumasp.net/api/v1")
abstract class ApiService {
  factory ApiService(Dio dio, { String baseUrl}) = _ApiService;

  @POST("/Auth/log-in")
  Future<LoginResponse> addLogin(@Body() LoginRequest logInRequest);
}
