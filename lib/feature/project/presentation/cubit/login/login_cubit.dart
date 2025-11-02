import 'package:bloc/bloc.dart';
import 'package:projectfourthyear/feature/project/data/repo/project_repo.dart';
import 'package:projectfourthyear/feature/project/model/login_request/login_request.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit( {required this.repo}) : super(LoginState());
  final ProjectRepo repo;

  Future<void> signIn({required LoginRequest loginRequest}) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await repo.createLogIn(loginRequest);
      print('قيمة isLogin من الكائن هي: ${response.isLogIn}');

      if (response.isLogIn) {
        emit(state.copyWith(status: Status.success, loginResponse: response));
      } else {
        emit(
          state.copyWith(
            status: Status.failure,
            errorMessage: 'error in email or password',
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
