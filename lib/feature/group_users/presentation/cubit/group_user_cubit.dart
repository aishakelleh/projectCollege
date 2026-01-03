import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:projectfourthyear/core/errors/exception.dart';
import 'package:projectfourthyear/feature/group_users/data/repo/repo_group_user.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_state.dart';
class GroupUserCubit extends Cubit<GroupUserState> {
  final RepoGroupUser repoGroupUser;

  GroupUserCubit(this.repoGroupUser) : super(GroupUserState());

  Future<void> fetchData(int groupId,int role) async {
    emit(state.copyWith(status: StatusGroupUser.loading));
    try {
      final groupUsers = await repoGroupUser.getGroupUser(groupId,role);
      emit(state.copyWith(status: StatusGroupUser.success, users: groupUsers));
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroupUser.failure, errorMassage: e.toString()),
      );
    }
  }


  Future<void> createGroupUser(RequestAddUserToGroup requestAddUserToGroup,int role) async {
    emit(state.copyWith(status: StatusGroupUser.loading));
    try {
      await repoGroupUser.postGroupUser(requestAddUserToGroup);
      await fetchData(requestAddUserToGroup.groupId,role );
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroupUser.failure, errorMassage: e.toString()),
      );
    }
  }


  Future<void> updateGroupUser(RequestAddUserToGroup requestAddUserToGroup,int role) async {
    emit(state.copyWith(status: StatusGroupUser.loading));
    try {
      await repoGroupUser.putGroupUser(requestAddUserToGroup);
      await fetchData(requestAddUserToGroup.groupId,role);
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroupUser.failure, errorMassage: e.toString()),
      );
    }
  }

  Future<void> deleteGroupUser(int groupId, int userId,int role) async {
    emit(state.copyWith(status: StatusGroupUser.loading));
    try {
      await repoGroupUser.cancelGroupUser(userId,groupId);
      await fetchData(groupId,role);
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: StatusGroupUser.failure,
          errorMassage: mapDioErrorToMessage(e),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: StatusGroupUser.failure, errorMassage: 'حدث خطأ غير متوقع '),
      );
    }
  }
}
