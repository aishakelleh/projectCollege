import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/response_/response_subject.dart';
part 'subject_state.freezed.dart';
@freezed
abstract class SubjectState with _$SubjectState{
  factory SubjectState({
    @Default(StatusSubject.initial) StatusSubject status,
    @Default([]) List<ResponseSubject>subject,
    String?errorMassage,
  })=_SubjectState;
}
enum StatusSubject{initial,loading,success,failed}