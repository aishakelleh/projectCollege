import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
part 'group_state.freezed.dart';
@freezed
abstract class GroupState with _$GroupState{
  factory GroupState({
    @Default(StatusGroup.initial) StatusGroup status,
    @Default([]) List<ResponseGroup>group,
    String?errorMassage,
  })=_GroupState;
}
enum StatusGroup{initial,loading,success,failed}
enum Gender { male, female, mixed }
