import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_cubit.dart';
import 'package:projectfourthyear/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/dependecy_injection.dart';
import 'feature/add_user/presentation/cubit/add_user_cubit.dart';
import 'feature/add_user/presentation/pages/dashboardscreen.dart';
import 'feature/login/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(Main(isLoggedIn: isLoggedIn));
}

class Main extends StatelessWidget {
  final bool isLoggedIn;

  const Main({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<AddUserCubit>()),
        BlocProvider(create: (context) => getIt<LevelCubit>()),
        BlocProvider(create: (context) => getIt<SubjectCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? DashBoardScreen() : WelcomeScreen(),
        ),
      ),
    );
  }
}
