import 'package:bloc/bloc.dart';

import '../../data/repo/repo_student.dart';
import '../../model/add_student/request/request_student.dart';
import '../../model/add_student/response/response_student.dart';
import 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  final RepoStudent repoStudent;

  AddStudentCubit(this.repoStudent) : super(AddStudentState());

  Future<void> getStudents() async {
    emit(state.copyWith(status: Status.loading));
    try {
      List<ResponseStudent> studentResponse = await repoStudent.getStudent();
      emit(
        state.copyWith(
          status: Status.success,
          students: studentResponse,
          errorMassage: '',
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }
  Future<void> createStudents({required RequestStudent requestStudent}) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final ResponseStudent responseStudent = await repoStudent.createStudent(
        requestStudent,
      );
      List<ResponseStudent> newStudent = List.from(state.students);
      newStudent.add(responseStudent);
      emit(state.copyWith(status: Status.success, students: newStudent));
      await getStudents();
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }
  Future<void>updateStudents(int id ,RequestStudent requestStudent)async{
    emit(state.copyWith(status: Status.loading));
    try{
    await repoStudent.updateStudent(id, requestStudent);
    await getStudents();
  }catch(e){
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
    }
  }
  Future<void>cancelStudents(int id)async{
    emit(state.copyWith(status: Status.loading));
    try{
      await repoStudent.cancelStudent(id);
      await getStudents();
    }
        catch(e){
      emit(state.copyWith(status: Status.failure, errorMassage: e.toString()));
        }
  }
}
