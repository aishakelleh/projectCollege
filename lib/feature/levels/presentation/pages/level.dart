import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_cubit.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_state.dart';
import 'package:projectfourthyear/feature/levels/presentation/widget/dialog_delete_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/widget/dialog_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/widget/dialog_update_level.dart';
import 'package:projectfourthyear/feature/subjects/predentation/pages/subject.dart';

import '../../../../core/common_widget/text_style.dart';
import '../../../../core/theme/app_color.dart';
import '../../../add_user/presentation/widget/custom_drawer.dart';

class Level extends StatefulWidget {
  const Level({super.key});

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  void initState() {
    super.initState();
    context.read<LevelCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        title: Text('Level Management', style: AppStyle.signInStudent),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, size: 29, color: Colors.black),
          ),
        ],
      ),
      drawer: Padding(
        padding: EdgeInsets.only(right: 150.w, top: 50.h),
        child: CustomDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.center,
                child: Text('Levels', style: AppStyle.textField),
              ),
            ),
            Expanded(
              child: BlocBuilder<LevelCubit, LevelState>(
                builder: (context, state) {
                  if (state.status == StatusLevel.loading &&
                      state.level.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state.status == StatusLevel.failed) {
                    return Text(state.errorMassage ?? 'حدث خطأ');
                  }
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemCount: state.level.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final level = state.level[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: BehindMotion(),
                          extentRatio: 0.3,
                          children: [
                            SlidableAction(
                              onPressed: (context) => showDialog(
                                context: context,
                                builder: (context) =>
                                    DialogDeleteLevel(level: level),
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
                            title: Text(level.name),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    DialogUpdateLevel(level: level),
                              );
                            },
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Subject(
                                    levelId: level.id,
                                    levelName: level.name,
                                    level: level,
                                  ),
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => DialogLevel());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
