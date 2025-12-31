import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
import 'package:projectfourthyear/feature/subjects/model/response_/response_subject.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_cubit.dart';

class DialogDeleteSubject extends StatelessWidget {
  final ResponseSubject subject;
  final ResponseLevel level;

  const DialogDeleteSubject({super.key, required this.subject, required this.level});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Subject'),
      content: Text('Are you sure you want to delete ${subject.name}?'),
      actions: [
        TextButton(
          onPressed: () {
            context.read<SubjectCubit>().deleteSubject(subject.id, level.id);
            Navigator.pop(context);
          },
          child: Text('Delete', style: AppStyle.delete),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
