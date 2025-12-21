import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/core/theme/app_color.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/cubit/add_student_cubit.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/cubit/add_student_state.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/widget/custom_drawer.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/widget/task_card.dart';
import 'package:projectfourthyear/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/login/presentation/pages/sign_in.dart';

import '../../model/add_student/response/response_student.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddStudentCubit>().getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<AddStudentCubit>().getStudents(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purple,
          title: Text('DashBoardScreen', style: AppStyle.signInStudent),
          actions: [
            IconButton(
              onPressed: () {
                context.read<LoginCubit>().signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                      (route) => false,
                );
              },
              icon: Icon(Icons.logout, color: AppColor.black),
            ),
          ],
        ),
        drawer: Padding(
          padding: EdgeInsets.only(right: 150.w, top: 50.h),
          child: CustomDrawer(),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery
                .of(context)
                .size
                .height),
            child: Column(
              children: [
                SizedBox(height: 30),
                SearchBar(
                  hintText: 'Search here',
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Students',
                        style:
                        AppStyle.textBold,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    BlocBuilder<AddStudentCubit, AddStudentState>(
                      builder: (context, state) =>
                          Text(
                              '${state.students.length}',
                              style: AppStyle.farabi
                          ),
                    ),
                  ],
                ),
                BlocBuilder<AddStudentCubit, AddStudentState>(
                  builder: (context, state) {
                    if (state.status == Status.loading &&
                        state.students.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.status == Status.failure) {
                      return Center(child: Text('${state.errorMassage}'));
                    }

                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          final ResponseStudent student = state.students[index];
                          return SlideTransition(

                            position:
                            child: TaskCard(
                              name: student.name,
                              gender: student.gender,
                              phone: student.phone,
                              id: student.id,
                              email: student.email,
                              isLogIn: student.isLogIn,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Teachers',
                        style:
                        AppStyle.textBold,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    BlocBuilder<AddStudentCubit, AddStudentState>(
                      builder: (context, state) =>
                          Text(
                              '${state.students.length}',
                              style: AppStyle.farabi
                          ),
                    ),
                  ],
                ),
                BlocBuilder<AddStudentCubit, AddStudentState>(
                  builder: (context, state) {
                    if (state.status == Status.loading &&
                        state.students.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.status == Status.failure) {
                      return Center(child: Text('${state.errorMassage}'));
                    }

                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          final ResponseStudent student = state.students[index];
                          return TaskCard(
                            name: student.name,
                            gender: student.gender,
                            phone: student.phone,
                            id: student.id,
                            email: student.email,
                            isLogIn: student.isLogIn,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
