import 'package:bloc/bloc.dart';
import 'package:projectfourthyear/feature/levels/data/repo/repo_level.dart';
import 'package:projectfourthyear/feature/levels/model/request/request_level.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  final RepoLevel repoLevel;

  LevelCubit(this.repoLevel) : super(LevelState());

  Future<void> fetchData() async {
    emit(state.copyWith(status: StatusLevel.loading));
    try {
      final levels = await repoLevel.getLevels();
      emit(state.copyWith(status: StatusLevel.success, level: levels));
    } catch (e) {
      emit(
        state.copyWith(status: StatusLevel.failed, errorMassage: e.toString()),
      );
    }
  }

  Future<void> installLevel(RequestLevel requestLevel) async {
    emit(state.copyWith(status: StatusLevel.loading));
    try {
      final ResponseLevel responseLevel = await repoLevel.createLevel(
        requestLevel,
      );
      List<ResponseLevel> newLevel = List.from(state.level);
      newLevel.add(responseLevel);
      emit(state.copyWith(status: StatusLevel.success, level: newLevel));
      await fetchData();
    } catch (e) {
      emit(
        state.copyWith(status: StatusLevel.failed, errorMassage: e.toString()),
      );
    }
  }

  Future<void> updateLevel(RequestLevel requestLevel, int id) async {
    emit(state.copyWith(status: StatusLevel.loading));
    try {
      await repoLevel.editLevel(requestLevel, id);
      emit(state.copyWith(status:StatusLevel.success));
      await fetchData();
    } catch (e) {
      emit(
        state.copyWith(status: StatusLevel.failed, errorMassage: e.toString()),
      );
    }
  }

  Future<void> deleteLevel(int id) async {
    emit(state.copyWith(status: StatusLevel.loading));
    try {
    await repoLevel.cancelLevel(id);
    emit(state.copyWith(status:StatusLevel.success));
   await fetchData();
    } catch (e) {
      emit(
        state.copyWith(status: StatusLevel.failed, errorMassage: e.toString()),
      );
    }
  }
}
