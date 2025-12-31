import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/levels/model/request/request_level.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_cubit.dart';

class DialogUpdateLevel extends StatefulWidget {
  const DialogUpdateLevel({super.key, required this.level});

  final ResponseLevel level;

  @override
  State<DialogUpdateLevel> createState() => _DialogUpdateLevelState();
}

class _DialogUpdateLevelState extends State<DialogUpdateLevel> {
  late var controller = TextEditingController();
@override
  void initState(){
  controller=TextEditingController(text:widget.level.name );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      title: Text('edit level'),
      content: TextField(
        decoration: InputDecoration(hintText: 'name level'),
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<LevelCubit>().updateLevel(
              RequestLevel(name: controller.text),widget.level.id
            );
            Navigator.pop(context);
          },
          child: Text('edit'),
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
