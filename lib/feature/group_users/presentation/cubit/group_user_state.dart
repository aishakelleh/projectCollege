import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projectfourthyear/feature/group_users/model/response/response_get_user_group/response_group_users.dart';
import 'package:projectfourthyear/feature/group_users/model/response/response_post_relation/response_relation.dart';

part 'group_user_state.freezed.dart';
@freezed
abstract class GroupUserState  with _$GroupUserState{
  factory GroupUserState({
    @Default(StatusGroupUser.initial) StatusGroupUser status,
    @Default([]) List<ResponseRelation> relation, //post,put,
    @Default([]) List<ResponseGroupUsers> users, //get,
     String? errorMassage,
})=_GroupUserState;
}
enum StatusGroupUser{initial,loading,success,failure}