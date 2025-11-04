import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projectfourthyear/feature/project/data/api/api_service.dart';
import 'package:projectfourthyear/feature/project/data/repo/project_repo.dart';
import 'package:projectfourthyear/feature/project/presentation/cubit/login/login_cubit.dart';

final GetIt getIt = GetIt.instance;
void setupDependencies() {
  getIt.registerLazySingleton(() {
    final dio = Dio();
    // أضيفي هذا الجاسوس (Interceptor)
    // سيقوم بطباعة كل تفاصيل الطلبات والردود في الـ Console
    dio.interceptors.add(LogInterceptor(
      requestBody: true, // لعرض جسم الطلب (البيانات المرسلة)
      responseBody: true, // لعرض جسم الرد (البيانات المستقبلة)
    ));
    return dio;
  });  getIt.registerLazySingleton(() => ApiService(
      getIt<Dio>(),
    ),);
  getIt.registerLazySingleton(() => ProjectRepo(apiService: getIt<ApiService>()));
  getIt.registerFactory(() => LoginCubit(repo: getIt<ProjectRepo>()));
}
