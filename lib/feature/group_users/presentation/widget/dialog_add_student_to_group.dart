import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_cubit.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';

import '../../../add_user/model/add_user/response/response_user.dart';

class DialogAddStudentToGroup extends StatefulWidget {
  final ResponseGroup group;
  final List<ResponseUser> students;

  const DialogAddStudentToGroup({
    super.key,
    required this.group,
    required this.students,
  });


  @override
  State<DialogAddStudentToGroup> createState() =>
      _DialogAddStudentToGroupState();
}

class _DialogAddStudentToGroupState extends State<DialogAddStudentToGroup> {
  final formKey = GlobalKey<FormState>();
  final costController = TextEditingController();
  ResponseUser? selectedStudent;
   final int studentRole=3;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Student to ${widget.group.name}'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<ResponseUser>(
                value: selectedStudent,
                hint: Text('Select Student'),
                items: widget.students.map((user) {
                  return DropdownMenuItem(value: user, child: Text(user.name));
                }).toList(),
                onChanged: (value) =>
                    setState(() {
                      selectedStudent = value;
                    }),
                validator: (value) {
                  if (value == null) {
                    return 'Please select student';
                  }
                  return null;
                },
            ),
            SizedBox(height: 12),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return 'Please add cost';
                }
                return null;
              },
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cost'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }
            context.read<GroupUserCubit>().createGroupUser(
                RequestAddUserToGroup(
                  userId: selectedStudent!.id,
                  groupId: widget.group.id,
                  cost: int.parse(costController.text),
                ), studentRole
            );
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
