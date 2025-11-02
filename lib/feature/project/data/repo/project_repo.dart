import 'package:projectfourthyear/feature/project/data/api/api_service.dart';
import 'package:projectfourthyear/feature/project/model/login_request/login_request.dart';
import 'package:projectfourthyear/feature/project/model/login_response/login_response.dart';

class ProjectRepo {
  final ApiService apiService;

  ProjectRepo({required this.apiService});

  Future<LoginResponse>createLogIn(LoginRequest logInRequest) async {
    return await apiService.addLogin(logInRequest);
  }
}
