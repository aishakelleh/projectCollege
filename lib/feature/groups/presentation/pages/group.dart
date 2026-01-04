import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:projectfourthyear/feature/groups/model/response/response_group.dart';
import 'package:projectfourthyear/feature/groups/presentation/cubit/group_cubit.dart';
import 'package:projectfourthyear/feature/groups/presentation/cubit/group_state.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';

import '../../../group_users/presentation/pages/group_user_student.dart';
import '../widget/dialog_add_group.dart';
import '../widget/dialog_delete_group.dart';
import '../widget/dialog_update_group.dart';

class GroupPage extends StatefulWidget {
  final ResponseLevel level;

  const GroupPage({
    super.key,
    required this.level,
  });

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    super.initState();

    // جلب كل الغروبات التابعة لهالمستوى
    context.read<GroupCubit>().fetchData(widget.level.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups - ${widget.level.name}'),
      ),

      body: BlocListener<GroupCubit, GroupState>(
        listener: (context, state) {
          if (state.status == StatusGroup.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMassage ?? 'حدث خطأ'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },

        child: BlocBuilder<GroupCubit, GroupState>(
          builder: (context, state) {
            if (state.status == StatusGroup.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == StatusGroup.failed) {
              return Center(child: Text(state.errorMassage ?? 'حدث خطأ'));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.group.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final ResponseGroup group = state.group[index];

                return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    extentRatio: 0.3,
                    children: [
                      SlidableAction(
                        onPressed: (_) {
                          showDialog(
                            context: context,
                            builder: (_) => DialogDeleteGroup(group: group),
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
                      title: Text(group.name),
                      trailing: const Icon(Icons.people),

                      // فتح طلاب الغروب
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GroupUser(group: group),
                          ),
                        );
                      },

                      // تعديل الغروب
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) => DialogUpdateGroup(group: group),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => DialogAddGroup(level: widget.level),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
