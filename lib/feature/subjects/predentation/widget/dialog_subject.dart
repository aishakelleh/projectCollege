import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/subjects/model/response/request_subject.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_cubit.dart';

class DialogSubject extends StatelessWidget {
  final int levelId;
  final String levelName;

  DialogSubject({super.key, required this.levelId, required this.levelName});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Subject for $levelName'),
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
              context.read<SubjectCubit>().installSubject(
                RequestSubject(
                  name: controller.text,
                  levelId: levelId,
                  userIds: [], // لاحقًا نقدر نختار المعلمين
                ),
                levelId,
              );
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
