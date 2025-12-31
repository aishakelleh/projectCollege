import 'package:bloc/bloc.dart';

import '../../data/repo/repo_user.dart';
import '../../model/add_user/request/request_user.dart';
import '../../model/add_user/response/response_user.dart';
import 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  final RepoUser repoUser;

  AddUserCubit(this.repoUser) : super(AddUserState());

  Future<void> getUser({required int role}) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final students = await repoUser.getUser(role: 3);
      final teachers = await repoUser.getUser(role: 2);
      emit(
        state.copyWith(
          status: Status.success,
          teachers: teachers,
          students: students,
          errorMassage: '',
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }

  Future<void> installUser({required RequestUser requestUser}) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final ResponseUser responseUser = await repoUser.createUser(requestUser);
      List<ResponseUser> newUser = List.from(state.user);
      newUser.add(responseUser);
      emit(state.copyWith(status: Status.success, user: newUser));
      await getUser(role: requestUser.role);
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }

  Future<void> updateUser(int id, RequestUser requestUser) async {
    emit(state.copyWith(status: Status.success));
    try {
      await repoUser.updateUser(id, requestUser);
      await getUser(role: requestUser.role);
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }

  Future<void> cancelUser(int id) async {
    final removeStudent = state.students.where((u) => u.id != id).toList();
    final removeTeacher = state.teachers.where((u) => u.id != id).toList();
    emit(
      state.copyWith(
        status: Status.success,
        students: removeStudent,
        teachers: removeTeacher,
      ),
    );
    try {
      await repoUser.cancelUser(id);
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }
}
