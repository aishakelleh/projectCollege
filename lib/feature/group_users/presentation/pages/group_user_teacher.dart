import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projectfourthyear/feature/add_user/presentation/cubit/add_user_cubit.dart';
import 'package:projectfourthyear/feature/add_user/presentation/cubit/add_user_state.dart';
import 'package:projectfourthyear/feature/group_users/model/request/request_add_users_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_cubit.dart';
import 'package:projectfourthyear/feature/group_users/presentation/cubit/group_user_state.dart';
import 'package:projectfourthyear/feature/group_users/presentation/widget/dialog_add_student_to_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/widget/dialog_delete_student_from_group.dart';
import 'package:projectfourthyear/feature/group_users/presentation/widget/dialog_update_student_in_group.dart';
import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
import '../../../add_user/model/add_user/response/response_user.dart';

class GroupUser extends StatefulWidget {
  final ResponseGroup group;

  const GroupUser({super.key, required this.group});

  @override
  State<GroupUser> createState() => _GroupUserState();
}

class _GroupUserState extends State<GroupUser> {
  static const int studentRole = 2;

  @override
  void initState() {
    super.initState();
    context.read<AddUserCubit>().getUser(role: studentRole);
    context.read<GroupUserCubit>().fetchData(widget.group.id, studentRole);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.group.name} - Students')),

      body: BlocBuilder<GroupUserCubit, GroupUserState>(
        builder: (context, state) {
          if (state.status == StatusGroupUser.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == StatusGroupUser.failure) {
            return Center(child: Text(state.errorMassage ?? 'حدث خطأ'));
          }

          return ListView.builder(
            itemCount: state.relation.length,
            itemBuilder: (context, index) {
              final relation = state.relation[index];
              final ResponseUser user = relation.user;
              final int cost = relation.cost;

              return Slidable(
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        showDialog(
                          context: context,
                          builder: (_) => DialogDeleteStudentFromGroup(
                            groupUser: RequestAddUserToGroup(
                              userId: user.id,
                              groupId: widget.group.id,
                              cost: cost,
                            ),
                          ),
                        );
                      },
                      icon: Icons.delete,
                      label: 'Delete',
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
                child: Card(
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text('Cost: $cost'),
                    trailing: const Icon(Icons.person),

                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => DialogUpdateStudentCost(
                          group: widget.group,
                          student: user,
                          currentCost: cost,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: BlocBuilder<AddUserCubit, AddUserState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const SizedBox.shrink();
          }

          final groupUserIds = context
              .read<GroupUserCubit>()
              .state
              .relation
              .map((r) => r.user.id)
              .toSet();

          final students = state.students
              .where((s) => !groupUserIds.contains(s.id))
              .toList();

          if (students.isEmpty) return const SizedBox.shrink();

          return FloatingActionButton(
            onPressed: () {
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
