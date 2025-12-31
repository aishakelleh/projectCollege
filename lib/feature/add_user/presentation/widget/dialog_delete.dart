import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';


import '../../model/add_user/response/response_user.dart';
import '../cubit/add_user_cubit.dart';

class DialogDelete extends StatelessWidget {
  final ResponseUser user;

  const DialogDelete({super.key, required this.user});

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
            context.read<AddUserCubit>().cancelUser(user.id);
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
