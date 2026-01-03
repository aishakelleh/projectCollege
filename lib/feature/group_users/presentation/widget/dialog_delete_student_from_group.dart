import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_cubit.dart';

class DialogDeleteStudentFromGroup extends StatelessWidget {
  final RequestAddUserToGroup groupUser;

  const DialogDeleteStudentFromGroup({super.key, required this.groupUser});
  final int studentRole=3;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to remove this student from the group?'),
      actions: [
        TextButton(
          onPressed: () {
            context.read<GroupUserCubit>().deleteGroupUser(
              groupUser.groupId,
              groupUser.userId,
              studentRole, // role student
            );
            Navigator.pop(context);
          },
          child: Text('Delete', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
