import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/subjects/model/response/request_subject.dart';
import 'package:projectfourthyear/feature/subjects/model/response_/response_subject.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_cubit.dart';

import '../../../levels/model/response/response_level.dart';

class DialogUpdateSubject extends StatelessWidget {
  final ResponseSubject subject;
  final ResponseLevel level;

  DialogUpdateSubject({super.key, required this.subject, required this.level});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.text = subject.name;

    return AlertDialog(
      title: Text('Update Subject'),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Subject Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter subject name';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<SubjectCubit>().updateSubject(
                RequestSubject(
                  name: controller.text,
                  levelId: level.id,
                  userIds: [], // لاحقًا يمكن اختيار المعلمين
                ),
                subject.id,
                level.id, // تمرير levelId
              );
              Navigator.pop(context);
            }
          },
          child: Text('Update'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
