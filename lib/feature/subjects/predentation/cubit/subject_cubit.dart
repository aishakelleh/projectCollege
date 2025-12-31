import 'package:bloc/bloc.dart';
import 'package:projectfourthyear/feature/subjects/data/repo/repo_subject.dart';
import 'package:projectfourthyear/feature/subjects/model/response/request_subject.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_state.dart';

import '../../model/response_/response_subject.dart';

// class SubjectCubit extends Cubit<SubjectState> {
//   final RepoSubject repoSubject;
//
//   SubjectCubit(this.repoSubject) : super(SubjectState());
//
//   Future<void> fetchData(int levelId) async {
//     emit(state.copyWith(status: StatusSubject.loading));
//     try {
//       final subjects = await repoSubject.getSubject(levelId);
//       emit(state.copyWith(
//         status: StatusSubject.success,
//         subject: subjects,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         status: StatusSubject.failed,
//         errorMassage: e.toString(),
//       ));
//     }
//   }
//
//   Future<void> installSubject(RequestSubject requestSubject, int levelId) async {
//     emit(state.copyWith(status: StatusSubject.loading));
//     try {
//       await repoSubject.createSubject(requestSubject);
//       await fetchData(levelId);
//     } catch (e) {
//       emit(state.copyWith(
//         status: StatusSubject.failed,
//         errorMassage: e.toString(),
//       ));
//     }
//   }
//
//   Future<void> updateSubject(
//       RequestSubject requestSubject,
//       int subjectId,
//       int levelId,
//       ) async {
//     emit(state.copyWith(status: StatusSubject.loading));
//     try {
//       await repoSubject.editSubject(requestSubject, subjectId);
//       await fetchData(levelId);
//     } catch (e) {
//       emit(state.copyWith(
//         status: StatusSubject.failed,
//         errorMassage: e.toString(),
//       ));
//     }
//   }
//
//   Future<void> deleteSubject(int subjectId, int levelId) async {
//     emit(state.copyWith(status: StatusSubject.loading));
//     try {
//       await repoSubject.cancelSubject(subjectId);
//       await fetchData(levelId);
//     } catch (e) {
//       emit(state.copyWith(
//         status: StatusSubject.failed,
//         errorMassage: e.toString(),
//       ));
//     }
//   }
// }
class SubjectCubit extends Cubit<SubjectState> {
  final RepoSubject repoSubject;

  SubjectCubit(this.repoSubject) : super(SubjectState());

  // fetchData مع levelId
  Future<void> fetchData(int levelId) async {
    emit(state.copyWith(status: StatusSubject.loading));
    try {
      final subjects = await repoSubject.getSubject(levelId);
      emit(state.copyWith(status: StatusSubject.success, subject: subjects));
    } catch (e) {
      emit(state.copyWith(status: StatusSubject.failed, errorMassage: e.toString()));
    }
  }

  Future<void> installSubject(RequestSubject requestSubject, int levelId) async {
    emit(state.copyWith(status: StatusSubject.loading));
    try {
      final ResponseSubject responseSubject = await repoSubject.createSubject(requestSubject);
      List<ResponseSubject> newSubject = List.from(state.subject);
      newSubject.add(responseSubject);
      emit(state.copyWith(status: StatusSubject.success, subject: newSubject));
      await fetchData(requestSubject.levelId); // جلب بعد الإضافة
    } catch (e) {
      emit(state.copyWith(status: StatusSubject.failed, errorMassage: e.toString()));
    }
  }

  Future<void> updateSubject(RequestSubject requestSubject, int subjectId, int levelId) async {
    emit(state.copyWith(status: StatusSubject.loading));
    try {
      await repoSubject.editSubject(requestSubject, subjectId);
      await fetchData(levelId); // إعادة جلب البيانات
    } catch (e) {
      emit(state.copyWith(status: StatusSubject.failed, errorMassage: e.toString()));
    }
  }

  Future<void> deleteSubject(int subjectId, int levelId) async {
    emit(state.copyWith(status: StatusSubject.loading));
    try {
      await repoSubject.cancelSubject(subjectId);
      await fetchData(levelId); // إعادة جلب البيانات
    } catch (e) {
      emit(state.copyWith(status: StatusSubject.failed, errorMassage: e.toString()));
    }
  }
}
