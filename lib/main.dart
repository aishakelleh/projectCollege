import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/feature/project/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/project/presentation/pages/dashboardscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/dependecy_injection.dart';
import 'feature/project/presentation/pages/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  final prefs= await SharedPreferences.getInstance();
  bool isLoggedIn=prefs.getBool('isLoggedIn')?? false;
  runApp(Main(isLoggedIn: isLoggedIn));
}

class Main extends StatelessWidget {
 final bool isLoggedIn ;
   const Main({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn? DashBoardScreen(): WelcomeScreen()
        ),

      ),
    );
  }
}
