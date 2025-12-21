import 'package:bloc/bloc.dart';
import 'package:projectfourthyear/feature/login/data/repo/project_repo.dart';
import 'package:projectfourthyear/feature/login/model/login_request/login_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ProjectRepo repo;

  LoginCubit({required this.repo}) : super(LoginState());

  Future<void> signIn({required LoginRequest loginRequest}) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final response = await repo.createLogIn(loginRequest);

      print('📦 response: ${response.toJson()}');

      if (response.isLogIn == true) {
        final prefs = await SharedPreferences.getInstance();

        // ✅ تخزين التوكن
        await prefs.setString('token', response.token);

        // (اختياري)
        await prefs.setBool('isLoggedIn', true);

        emit(
          state.copyWith(
            status: Status.success,
            loginResponse: response,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: Status.failure,
            errorMessage: 'email or password incorrect',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // يمسح التوكن وكلشي
    emit(LoginState());
  }
}
