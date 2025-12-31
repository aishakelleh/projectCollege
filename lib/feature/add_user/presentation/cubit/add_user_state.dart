import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/add_user/response/response_user.dart';

part 'add_user_state.freezed.dart';
@freezed
abstract class  AddUserState  with _$AddUserState{
  factory AddUserState({
   @Default(Status.initial)  Status status,
   @Default([]) List<ResponseUser> user,
   @Default([]) List<ResponseUser> teachers,
   @Default([]) List<ResponseUser> students,
    String? errorMassage,
}) =_AddUserState;


}
enum Status{initial,loading,success,failure}