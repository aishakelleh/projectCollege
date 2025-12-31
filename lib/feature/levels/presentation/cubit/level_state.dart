import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
part 'level_state.freezed.dart';
@freezed
abstract class LevelState with _$LevelState{
  factory LevelState({
    @Default(StatusLevel.initial) StatusLevel status,
    @Default([]) List<ResponseLevel>level,
    String?errorMassage,
})=_LevelState;
}
enum StatusLevel{initial,loading,success,failed}