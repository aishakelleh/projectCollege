import 'package:dio/dio.dart';

String mapDioErrorToMessage(DioException e) {
  if (e.response != null) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    if (data is Map && data['message'] != null) {
      return data['message'];
    }

    switch (statusCode) {
      case 400:
        return 'البيانات المرسلة غير صحيحة';
      case 401:
        return 'غير مصرح لك';
      case 404:
        return 'العنصر غير موجود';
      case 409:
        return 'لا يمكن الحذف لوجود عناصر مرتبطة';
      case 500:
        return 'خطأ من السيرفر';
      default:
        return 'حدث خطأ غير متوقع';
    }
  } else {
    return 'تحقق من اتصال الإنترنت';
  }
}
