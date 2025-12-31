import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projectfourthyear/feature/levels/data/api/api_service_level.dart';
import 'package:projectfourthyear/feature/levels/data/repo/repo_level.dart';
import 'package:projectfourthyear/feature/levels/presentation/cubit/level_cubit.dart';
import 'package:projectfourthyear/feature/login/data/api/api_service.dart';
import 'package:projectfourthyear/feature/login/data/repo/project_repo.dart';
import 'package:projectfourthyear/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/subjects/data/api/api_service_subject.dart';
import 'package:projectfourthyear/feature/subjects/data/repo/repo_subject.dart';
import 'package:projectfourthyear/feature/subjects/predentation/cubit/subject_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/add_user/data/api/api_service_user.dart';
import '../../feature/add_user/data/repo/repo_user.dart';
import '../../feature/add_user/presentation/cubit/add_user_cubit.dart';

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
    Dio().get('https://google.com').then((_) {
      print('Internet OK');
    }).catchError((e) {
      print('No internet');
      print(dio.options.baseUrl);

    });


    // 🔐 Interceptor للتوكن
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options,handler) async{
          final prefs=await SharedPreferences.getInstance();
          final token= prefs.getString('token');
          if(token !=null && token.isNotEmpty){
            options.headers['token'] = token;
            print(dio.options.baseUrl);

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

  getIt.registerLazySingleton(() => ApiServiceUser(getIt<Dio>()));
  getIt.registerLazySingleton(
    () => RepoUser(apiService: getIt<ApiServiceUser>()),
  );
  getIt.registerFactory(() => AddUserCubit(getIt<RepoUser>()));
  //المستويات
  getIt.registerLazySingleton(() => ApiServiceLevel(getIt<Dio>()));
  getIt.registerLazySingleton(() => RepoLevel(apiServiceLevel: getIt<ApiServiceLevel>()),);
  getIt.registerFactory(() => LevelCubit(getIt<RepoLevel>()));
  //مواد
  getIt.registerLazySingleton(() => ApiServiceSubject(getIt<Dio>()));
  getIt.registerLazySingleton(() => RepoSubject(apiServiceSubject: getIt<ApiServiceSubject>()),);
  getIt.registerFactory(() => SubjectCubit(getIt<RepoSubject>()));
}
