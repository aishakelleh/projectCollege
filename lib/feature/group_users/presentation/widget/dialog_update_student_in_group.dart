import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_cubit.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
import '../../../add_user/model/add_user/response/response_user.dart';

class DialogUpdateStudentCost extends StatefulWidget {
  final ResponseGroup group;
  final ResponseUser student;
  final int currentCost;

  const DialogUpdateStudentCost({
    super.key,
    required this.group,
    required this.student,
    required this.currentCost,
  });

  @override
  State<DialogUpdateStudentCost> createState() =>
      _DialogUpdateStudentCostState();
}

class _DialogUpdateStudentCostState extends State<DialogUpdateStudentCost> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _costController;

  @override
  void initState() {
    super.initState();
    _costController = TextEditingController(text: widget.currentCost.toString());
  }

  @override
  void dispose() {
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Cost for ${widget.student.name}'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _costController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Cost'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter cost';
            }
            if (int.tryParse(value) == null) {
              return 'Enter a valid number';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;

            // إرسال الطلب للكيوبت لتحديث التكلفة فقط
            context.read<GroupUserCubit>().updateGroupUser(
              RequestAddUserToGroup(
                userId: widget.student.id,
                groupId: widget.group.id,
                cost: int.parse(_costController.text),
              ),
              3, // role = student
            );

            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
