import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_cubit.dart';

import '../../../../core/common_widget/text_style.dart';

class DialogDeleteLevel extends StatelessWidget {
  DialogDeleteLevel({super.key, required this.level});

  final controller = TextEditingController();
  final ResponseLevel level;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      title: Text('delete level'),
      content: Text('are you sure delete level'),
      actions: [
        TextButton(
          onPressed: () {
            context.read<LevelCubit>().deleteLevel(level.id);
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
