import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectfourthyear/feature/project/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/project/presentation/pages/sign_in.dart';
import 'package:projectfourthyear/feature/project/presentation/widget/text_style.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoardScreen',style: AppStyle.signInStudent,),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginCubit>().signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),(route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('reem hamed')),
    );
  }
}
