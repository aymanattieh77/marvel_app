import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/di/service_locator.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';

import 'package:marvel_app/presentaion/main/home/pages/detail_page.dart';
import 'package:marvel_app/presentaion/main/home_screen.dart';
import 'package:marvel_app/presentaion/account/account_screen.dart';
import 'package:marvel_app/presentaion/settings/settings_screen.dart';
import 'package:marvel_app/presentaion/on_borading/on_borading_screen.dart';

import 'package:marvel_app/presentaion/sign_up_login/pages/login_signup_page.dart';

import 'package:marvel_app/presentaion/splash/splash_screen.dart';
import 'package:marvel_app/shared/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:marvel_app/shared/cubits/marvel_cubit/marvel_cubit.dart';

import '../../presentaion/download/watch_list_download_screen.dart';

class AppRouter {
  static const splash = '/';
  static const onBorading = '/on_boarding';
  static const signUp = '/sign_up';
  static const loginSignUp = '/login_signup';
  static const home = '/home_';
  static const moviePage = '/movie_page';
  static const accountPage = '/account_page';
  static const settingPage = '/setting_page';
  static const downloadWatchList = '/download_watch_list';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.splash:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case AppRouter.onBorading:
        return MaterialPageRoute(builder: (ctx) => const OnBoardingScreen());
      case AppRouter.loginSignUp:
        final args = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (ctx) => BlocProvider(
                  create: (context) => AuthenticationCubit(),
                  child: LoginSignUpPage(isLogin: args),
                ));
      case AppRouter.home:
        setupHomeCubit();
        return homeScreen();
      case AppRouter.moviePage:
        final args = settings.arguments as DetailPageArguments;

        return MaterialPageRoute(
          builder: (ctx) => BlocProvider.value(
            value: args.homeCubit,
            child: DetailPage(
              args: args,
            ),
          ),
        );
      case AppRouter.settingPage:
        return MaterialPageRoute(builder: (ctx) => const SettingScreen());
      case AppRouter.downloadWatchList:
        return MaterialPageRoute(
            builder: (ctx) => const WatchListDownloadScreen());
      case AppRouter.accountPage:
        return MaterialPageRoute(builder: (ctx) => const AccountScreen());
      default:
        return unknownFoundPage();
    }
  }

  static homeScreen() {
    return MaterialPageRoute(
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<HomeCubit>()),
          BlocProvider(create: (context) => getIt<MarvelCubit>())
        ],
        child: const HomeScreen(),
      ),
    );
  }

  static unknownFoundPage() {
    return MaterialPageRoute(
      builder: (ctx) => const Scaffold(
        body: Center(
          child: Text('Un Known Page'),
        ),
      ),
    );
  }
}
