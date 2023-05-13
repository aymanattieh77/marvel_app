import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marvel_app/data/remote/network/dio_factory.dart';
import 'package:marvel_app/data/remote/network/network_info.dart';
import 'package:marvel_app/data/repository/movie_series_repo_impl.dart';
import 'package:marvel_app/domain/repository/movie_series_repository.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import '../../data/remote/api_services/movies_series/movies_series_service.dart';

final getIt = GetIt.instance;

setupAppService() {
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  getIt.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = getIt<DioFactory>().dio;
  getIt.registerLazySingleton<MovieSeriesService>(
      () => MovieSeriesService(dio!));

  getIt.registerLazySingleton<MovieSeriesRepository>(
      () => MovieSeriesRepositoryImpl(getIt(), getIt()));
}

setupHomeCubit() {
  if (!GetIt.I.isRegistered<HomeCubit>()) {
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  }
}
