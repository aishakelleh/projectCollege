import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projectfourthyear/feature/groups/presentation/pages/group.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_cubit.dart';
import 'package:projectfourthyear/feature/subjects/predentation/widget/dialog_delete.dart';
import 'package:projectfourthyear/feature/subjects/predentation/widget/dialog_subject.dart';
import 'package:projectfourthyear/feature/subjects/predentation/widget/dialog_update_subject.dart';

import '../../../../core/common_widget/text_style.dart';
import '../../../../core/theme/app_color.dart';
import '../cubit/subject_state.dart';

class Subject extends StatefulWidget {
  const Subject({
    super.key,
    required this.levelId,
    required this.levelName,
    required this.level,
  });

  final int levelId;
  final String levelName;
  final ResponseLevel level;

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  void initState() {
    super.initState();
    context.read<SubjectCubit>().fetchData(widget.levelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subjects - ${widget.levelName}',
          style: AppStyle.signInStudent,
        ),
        backgroundColor: AppColor.purple,
      ),
      body: BlocListener<SubjectCubit, SubjectState>(
        listener: (context, state) {
          if (state.status == StatusSubject.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMassage ?? 'حدث خطا'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<SubjectCubit, SubjectState>(
          builder: (context, state) {
            if (state.status == StatusSubject.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.status == StatusSubject.failed) {
              return Center(child: Text(state.errorMassage ?? 'حدث خطأ'));
            }

            return ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: state.subject.length,
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final subject = state.subject[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.3,
                    children: [
                      SlidableAction(
                        onPressed: (context) => showDialog(
                          context: context,
                          builder: (context) => DialogDeleteSubject(
                            level: widget.level,
                            subject: subject,
                          ),
                        ),
                        label: 'delete',
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(subject.name),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) => DialogUpdateSubject(
                            subject: subject,
                            level: widget.level,
                          ),
                        );
                      },
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupPage(level: widget.level),
                        ),
                      ),
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
            builder: (_) => DialogSubject(
              levelId: widget.levelId,
              levelName: widget.levelName,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
