import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:projectfourthyear/core/errors/exception.dart';
import 'package:projectfourthyear/feature/groups/data/repo/repo_group.dart';
import 'package:projectfourthyear/feature/groups/model/request/request_group.dart';
import 'package:projectfourthyear/feature/groups/presentation/cubit/group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final RepoGroup repoGroup;

  GroupCubit(this.repoGroup) : super(GroupState());

  Future<void> fetchData(int levelId) async {
    emit(state.copyWith(status: StatusGroup.loading));
    try {
      final groups = await repoGroup.getGroup(levelId);
      emit(state.copyWith(status: StatusGroup.success, group: groups));
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroup.failed, errorMassage: e.toString()),
      );
    }
  }

  Future<void> createGroup(RequestGroup requestGroup) async {
    emit(state.copyWith(status: StatusGroup.loading));
    try {
      await repoGroup.createGroup(requestGroup);
      await fetchData(requestGroup.levelId);
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroup.failed, errorMassage: e.toString()),
      );
    }
  }

  Future<void> updateGroup(RequestGroup requestGroup, int groupId) async {
    emit(state.copyWith(status: StatusGroup.loading));
    try {
      await repoGroup.updateGroup(requestGroup, groupId);
      await fetchData(requestGroup.levelId);
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroup.failed, errorMassage: e.toString()),
      );
    }
  }

  Future<void> deleteGroup(int groupId, int levelId) async {
    emit(state.copyWith(status: StatusGroup.loading));
    try {
      await repoGroup.cancelGroup(groupId);
      await fetchData(levelId);
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: StatusGroup.failed,
          errorMassage: mapDioErrorToMessage(e),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroup.failed, errorMassage: 'حدث خطأ غير متوقع '),
      );
    }
  }
}
