import 'package:projectfourthyear/feature/login/data/api/api_service.dart';
import 'package:projectfourthyear/feature/login/model/login_request/login_request.dart';
import 'package:projectfourthyear/feature/login/model/login_response/login_response.dart';

class ProjectRepo {
  final ApiService apiService;

  ProjectRepo({required this.apiService});

  Future<LoginResponse>createLogIn(LoginRequest logInRequest) async {
    final response=await apiService.addLogin(logInRequest);
    print('📥 الرد الخام من السيرفر: ${response.toJson()}');

    return response;
  }
}
