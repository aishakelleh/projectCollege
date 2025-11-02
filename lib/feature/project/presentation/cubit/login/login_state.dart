import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/login_response/login_response.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState{
 // factory LoginState.initial()= _Initial;
 // factory LoginState.loading()= _Loading;
 // factory LoginState.success({required LoginResponse loginResponse})= _Success;
 // factory LoginState.failure({required String errorMassage})= _Failure;
  factory LoginState({
   @Default(Status.initial) Status status,
   LoginResponse? loginResponse,
    String? errorMessage,
})=_LoginState;

}
enum Status{initial,loading,success,failure}
