import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projectfourthyear/feature/add_student_teacher/data/api/api_service_student.dart';
import 'package:projectfourthyear/feature/add_student_teacher/data/repo/repo_student.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/cubit/add_student_cubit.dart';
import 'package:projectfourthyear/feature/login/data/api/api_service.dart';
import 'package:projectfourthyear/feature/login/data/repo/project_repo.dart';
import 'package:projectfourthyear/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // ///اعدادات الdio
  getIt.registerLazySingleton(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://mohmmadfallaha053.premiumasp.net/api/v1",
        headers: {
          'Content-Type': 'application/json'
        },
      ),
    );

    // 🔐 Interceptor للتوكن
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options,handler) async{
          final prefs=await SharedPreferences.getInstance();
          final token= prefs.getString('token');
          if(token !=null && token.isNotEmpty){
            options.headers['token'] = token;
          }
         return handler.next(options);
        },


      ),
    );

    // 📄 Log
    dio.interceptors.add(
        LogInterceptor(
            requestBody: true,
            responseBody: true),
    );

    return dio;
  });

  /////تسجيل دخول

  getIt.registerLazySingleton(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton(
    () => ProjectRepo(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory(() => LoginCubit(repo: getIt<ProjectRepo>()));
  /////اضافة طالب

  getIt.registerLazySingleton(() => ApiServiceStudent(getIt<Dio>()));
  getIt.registerLazySingleton(
    () => RepoStudent(apiService: getIt<ApiServiceStudent>()),
  );
  getIt.registerFactory(() => AddStudentCubit(getIt<RepoStudent>()));
}
