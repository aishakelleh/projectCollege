import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projectfourthyear/feature/add_user/presentation/cubit/add_user_cubit.dart';
import 'package:projectfourthyear/feature/add_user/presentation/cubit/add_user_state.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_cubit.dart';
import 'package:projectfourthyear/feature/group_users/presentation/widget/dialog_update_student_in_group.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';

import '../../model/request/request_add_users_to_group.dart';
import '../cubit/group_user_state.dart';
import '../widget/dialog_add_student_to_group.dart';
import '../widget/dialog_delete_student_from_group.dart';

class GroupUser extends StatefulWidget {
  final ResponseGroup group;

  const GroupUser({super.key, required this.group});

  @override
  State<GroupUser> createState() => _GroupUserState();
}

class _GroupUserState extends State<GroupUser> {
  static const int studentRole = 3;

  @override
  void initState() {
    super.initState();
    context.read<AddUserCubit>().getUser(role: studentRole); //جلب كل الطلاب
    context.read<GroupUserCubit>().fetchData(
      widget.group.id,
      studentRole,
    ); //جلب طلاب في شعبة معينة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.group.name} - Students')),
      body: BlocListener<GroupUserCubit, GroupUserState>(
        listener: (context, state) {
          if (state.status == StatusGroupUser.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMassage ?? 'حدث خطا'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<GroupUserCubit, GroupUserState>(
          builder: (context, state) {
            if (state.status == StatusGroupUser.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.status == StatusGroupUser.failure) {
              return Center(child: Text(state.errorMassage ?? 'حدث خطأ'));
            }

            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, index) {
                final user = state.users[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.3,
                    children: [
                      SlidableAction(
                        onPressed: (_) => showDialog(
                          context: context,
                          builder: (_) => DialogDeleteStudentFromGroup(
                            groupUser: RequestAddUserToGroup(
                              userId: user.id,
                              groupId: widget.group.id,
                              cost: 0, // للحذف مش مهم
                            ),
                          ),
                        ),
                        icon: Icons.delete,
                        label: 'Delete',
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(user.name),
                      // subtitle: Text('Cost: ${user.cost}'),
                      onLongPress: () {
                        final students = context.read<AddUserCubit>().state.students
                            .where((s) => !context
                            .read<GroupUserCubit>()
                            .state
                            .users
                            .map((u) => u.id)
                            .contains(s.id))
                            .toList();
                        final groupUser = RequestAddUserToGroup(
                          userId: user.id,
                          groupId: widget.group.id,
                          cost: 0, // أو أي قيمة حالية لو موجودة
                        );

                        showDialog(
                          context: context,
                          builder: (context) => DialogUpdateStudentInGroup(
                            group: widget.group,
                            students: students,
                            groupUser: groupUser,
                          ),
                        );
                      },

                      trailing: Icon(Icons.person),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<AddUserCubit, AddUserState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const SizedBox.shrink();
          }

          return FloatingActionButton(
            onPressed: () {
              final students = state.students
                  .where(
                    (s) => !context
                        .read<GroupUserCubit>()
                        .state
                        .users
                        .map((u) => u.id)
                        .contains(s.id),
                  )
                  .toList();

              if (students.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('لا يوجد طلاب بعد')),
                );
                return;
              }

              showDialog(
                context: context,
                builder: (_) => DialogAddStudentToGroup(
                  group: widget.group,
                  students: students,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
