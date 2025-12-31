import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/core/theme/app_color.dart';
import 'package:projectfourthyear/feature/levels/presentation/pages/level.dart';

import '../pages/dashboardscreen.dart';
import '../pages/user.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.purple2,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(top: 30.h),
            child: Text(
              'Al Farabi',
              style: AppStyle.farabi,
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: AppColor.purple2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12.r),
            ),
            tileColor: AppColor.purple,
            title: Text('Dashboard', style: AppStyle.signIn),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashBoardScreen()),
              );
            },
          ),
          SizedBox(height: 20.h),
          ListTile(
            leading: Icon(Icons.person, color: AppColor.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12.r),
            ),
            splashColor: AppColor.purple,
            title: Text('user', style: AppStyle.signIn),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => User()),
              );
            },
          ),
          SizedBox(height: 20.h),
          ListTile(
            leading: Icon(Icons.person, color: AppColor.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12.r),
            ),
            splashColor: AppColor.purple,
            title: Text('Level', style: AppStyle.signIn),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Level()),
              );
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
