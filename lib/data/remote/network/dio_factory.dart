import 'package:dio/dio.dart';
import 'package:marvel_app/app/utils/constants.dart';

class DioFactory {
  Dio? dio;

  DioFactory() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: AppConstants.timeOut),
      sendTimeout: const Duration(milliseconds: AppConstants.timeOut),
      receiveTimeout: const Duration(milliseconds: AppConstants.timeOut),
      receiveDataWhenStatusError: true,
      headers: {'Accept': 'application/json'},
    );
    dio = Dio(baseOptions);
    dio!.interceptors.add(LogInterceptor());
  }
}
