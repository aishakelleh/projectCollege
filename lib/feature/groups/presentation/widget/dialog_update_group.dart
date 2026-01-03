import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/groups/model/request/request_group.dart';
import 'package:projectfourthyear/feature/groups/presentation/cubit/group_cubit.dart';
import '../../../levels/model/response/response_level.dart';

class DialogUpdateGroup extends StatefulWidget {
  final ResponseLevel level;

  const DialogUpdateGroup({super.key, required this.level});

  @override
  State<DialogUpdateGroup> createState() => _DialogAddGroupState();
}

class _DialogAddGroupState extends State<DialogUpdateGroup> {
  late TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int selectedGender = 0;
  // 0 = Male, 1 = Female
  @override
  void initState(){
    nameController=TextEditingController(text: widget.level.name);
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('edit Group to ${widget.level.name}'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Group Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter group name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Gender: '),
                Radio<int>(
                  value: 0,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? 0;
                    });
                  },
                ),
                Text('Male'),
                Radio<int>(
                  value: 1,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? 1;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<GroupCubit>().updateGroup(
                RequestGroup(
                  name: nameController.text,
                  levelId: widget.level.id,
                  gender: selectedGender,
                ),widget.level.id
              );
              Navigator.pop(context);
            }
          },
          child: Text('update'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
