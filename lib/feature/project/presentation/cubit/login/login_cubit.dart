import 'package:bloc/bloc.dart';
import 'package:projectfourthyear/feature/project/data/repo/project_repo.dart';
import 'package:projectfourthyear/feature/project/model/login_request/login_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ProjectRepo repo;

  LoginCubit({required this.repo}) : super(LoginState());

  Future<void> signIn({required LoginRequest loginRequest}) async {
    emit(state.copyWith(status: Status.loading));

    print('بدء محاكاة تسجيل الدخول...');

    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await repo.createLogIn(loginRequest);
      if (response.isLogIn) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        emit(state.copyWith(status: Status.success, loginResponse: response));
      } else {
        emit(
          state.copyWith(
            status: Status.failure,
            errorMessage: 'error in email or password',
          ),
        );
      }

      print('المحاكاة نجحت! إصدار حالة النجاح.');

    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
  Future<void>signOut()async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    emit(LoginState());
    print('تم تسجيل الخروج');
  }

}
