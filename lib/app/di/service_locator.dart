import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marvel_app/app/prefs/prefs.dart';
import 'package:marvel_app/data/local/local_data/movie_series_local_storage/marvel_local_storage.dart';
import 'package:marvel_app/data/remote/api_services/marvel/marvel_service.dart';
import 'package:marvel_app/data/remote/network/dio_factory.dart';
import 'package:marvel_app/data/remote/network/network_info.dart';
import 'package:marvel_app/data/repository/marvel_repository_impl.dart';
import 'package:marvel_app/data/repository/movie_series_repo_impl.dart';
import 'package:marvel_app/domain/repository/marvel_repository.dart';
import 'package:marvel_app/domain/repository/movie_series_repository.dart';
import 'package:marvel_app/shared/cubits/splash_cubit/splash_cubit.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:marvel_app/shared/cubits/marvel_cubit/marvel_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/remote/api_services/movies_series/movies_series_service.dart';

final getIt = GetIt.instance;

setupAppService() async {
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  getIt.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = getIt<DioFactory>().dio;

  getIt.registerLazySingleton<MovieSeriesService>(
      () => MovieSeriesService(dio!));

  getIt.registerLazySingleton<MovieSeriesRepository>(
      () => MovieSeriesRepositoryImpl(getIt(), getIt()));

  getIt.registerLazySingleton<MarvelService>(() => MarvelService(dio!));

  getIt.registerLazySingleton<MarvelRepository>(
      () => MarvelRepositoryImpl(getIt(), getIt()));

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPrefs>(() => AppPrefs(prefs));
}

setupHomeCubit() {
  if (!GetIt.I.isRegistered<HomeCubit>()) {
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
    getIt.registerFactory<MarvelCubit>(() => MarvelCubit(getIt()));
  }
}

setupSplashCubit() {
  if (!GetIt.I.isRegistered<SplashCubit>()) {
    getIt.registerFactory<SplashCubit>(() => SplashCubit());
  }
}

setupLocalStorage() {
  if (!GetIt.I.isRegistered<MarvelLocalStorage>()) {
    getIt.registerFactory<MarvelLocalStorage>(() => MarvelLocalStorageImpl());
  }
}
