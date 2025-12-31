import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/core/theme/app_color.dart';
import 'package:projectfourthyear/feature/add_user/presentation/cubit/add_user_cubit.dart';
import 'package:projectfourthyear/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/login/presentation/pages/sign_in.dart';

import '../../model/add_user/response/response_user.dart';
import '../cubit/add_user_state.dart';
import '../widget/custom_drawer.dart';
import '../widget/dialog_delete.dart';
import '../widget/dialog_update.dart';
import '../widget/task_card.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddUserCubit>().getUser(role: 3);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<AddUserCubit>().getUser(role: 3),
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
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                SearchBar(
                  hintText: 'Search here',
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Students', style: AppStyle.textBold),
                    ),
                    SizedBox(width: 12.w),
                    BlocBuilder<AddUserCubit, AddUserState>(
                      builder: (context, state) => Text(
                        '${state.students.length}',
                        style: AppStyle.farabi,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<AddUserCubit, AddUserState>(
                  builder: (context, state) {
                    final students = state.students
                        .where((element) => element.role == 3)
                        .toList();
                    if (state.status == Status.loading && state.user.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.status == Status.failure) {
                      return Center(child: Text('${state .errorMassage}'));
                    }

                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final ResponseUser user = students[index];
                          return Slidable(
                            direction: Axis.horizontal,
                            endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              extentRatio: 0.3,
                              children: [
                                SlidableAction(
                                  onPressed: (context) => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        DialogDelete(user: user),
                                  ),
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              extentRatio: 0.3,
                              children: [
                                SlidableAction(
                                  onPressed: (context) => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        DialogUpdate(user: user),
                                  ),
                                  label: 'Edit',
                                  icon: Icons.edit,
                                  backgroundColor: Colors.green,
                                ),
                              ],
                            ),

                            child: TaskCard(
                              name: user.name,
                              gender: user.gender,
                              phone: user.phone,
                              id: user.id,
                              email: user.email,
                              isLogIn: user.isLogIn,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Teachers', style: AppStyle.textBold),
                    ),
                    SizedBox(width: 12.w),
                    BlocBuilder<AddUserCubit, AddUserState>(
                      builder: (context, state) => Text(
                        '${state.teachers.length}',
                        style: AppStyle.farabi,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<AddUserCubit, AddUserState>(
                  builder: (context, state) {
                    final teachers = state.teachers
                        .where((element) => element.role == 2)
                        .toList();
                    if (state.status == Status.loading && state.user.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.status == Status.failure) {
                      return Center(child: Text('${state.errorMassage}'));
                    }
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: teachers.length,
                        itemBuilder: (context, index) {
                          final ResponseUser user = state.teachers[index];
                          return Slidable(
                            direction: Axis.horizontal,
                            endActionPane: ActionPane(
                              motion: BehindMotion(),
                              extentRatio: 0.3,
                              children: [
                                SlidableAction(
                                  onPressed: (context) => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        DialogDelete(user: user),
                                  ),
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  label: 'delete',
                                ),
                              ],
                            ),
                            startActionPane: ActionPane(
                              motion: BehindMotion(),
                              extentRatio: 0.3,
                              children: [
                                SlidableAction(
                                  onPressed: (context) => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        DialogUpdate(user: user),
                                  ),
                                  backgroundColor: Colors.green,
                                  icon: Icons.edit,
                                  label: 'edit',
                                ),
                              ],
                            ),
                            child: TaskCard(
                              name: user.name,
                              gender: user.gender,
                              phone: user.phone,
                              id: user.id,
                              email: user.email,
                              isLogIn: user.isLogIn,
                            ),
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
