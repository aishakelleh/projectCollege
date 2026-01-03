import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
import 'package:projectfourthyear/feature/groups/presentation/cubit/group_cubit.dart';

class DialogDeleteGroup extends StatelessWidget {
  final ResponseGroup group;

  const DialogDeleteGroup({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning', style: AppStyle.signIn),
      content: Text(
        'are you sure delete this student?',
        style: AppStyle.signUp,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<GroupCubit>().deleteGroup(group.id, group.levelId);
            Navigator.pop(context);
          },
          child: Text('Delete', style: AppStyle.delete),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('cancel'),
        ),
      ],
    );
  }
}
