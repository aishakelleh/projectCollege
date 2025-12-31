import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/levels/model/request/request_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_cubit.dart';

class DialogLevel extends StatelessWidget {
  DialogLevel({super.key});

  final controller = TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      title: Text('add level'),
      content: Form(
        key: formKey,
        child: TextFormField(
          decoration: InputDecoration(hintText: 'name level'),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter level name';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if(formKey.currentState!.validate()){
            context.read<LevelCubit>().installLevel(
              RequestLevel(name: controller.text),
            );
            Navigator.pop(context);
          }
            },
          child: Text('add'),
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
