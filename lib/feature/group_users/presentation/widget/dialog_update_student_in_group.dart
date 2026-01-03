import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_cubit.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
import '../../../add_user/model/add_user/response/response_user.dart';

class DialogUpdateStudentInGroup extends StatefulWidget {
  final ResponseGroup group;
  final List<ResponseUser> students; // كل الطلاب المتاحين
  final RequestAddUserToGroup groupUser; // بيانات الطالب الحالي بالغروب

  const DialogUpdateStudentInGroup({
    super.key,
    required this.group,
    required this.students,
    required this.groupUser,
  });

  @override
  State<DialogUpdateStudentInGroup> createState() =>
      _DialogUpdateStudentInGroupState();
}

class _DialogUpdateStudentInGroupState
    extends State<DialogUpdateStudentInGroup> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _costController;
  ResponseUser? _selectedStudent;

  @override
  void initState() {
    super.initState();
    // Cost موجود مسبقاً
    _costController =
        TextEditingController(text: widget.groupUser.cost.toString());

    // اختيار الطالب الحالي في Dropdown
    try {
      _selectedStudent = widget.students
          .firstWhere((u) => u.id == widget.groupUser.userId);
    } catch (e) {
      // لو الطالب ما موجود بالقائمة، خلي null
      _selectedStudent = null;
    }
  }

  @override
  void dispose() {
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Student in ${widget.group.name}'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<ResponseUser>(
              value: _selectedStudent,
              hint: Text('Select Student'),
              items: widget.students.map((user) {
                return DropdownMenuItem(value: user, child: Text(user.name));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStudent = value;
                });
              },
              validator: (value) {
                if (value == null) return 'Please select a student';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cost'),
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
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;

            // إرسال الطلب للكيوبت
            context.read<GroupUserCubit>().updateGroupUser(
              RequestAddUserToGroup(
                userId: _selectedStudent!.id,
                groupId: widget.group.id,
                cost: int.parse(_costController.text),
              ),3
            );

            Navigator.pop(context);
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
