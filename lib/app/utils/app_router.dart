import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/di/service_locator.dart';

import 'package:marvel_app/presentaion/main/home/pages/detail_page.dart';
import 'package:marvel_app/presentaion/main/home_screen.dart';
import 'package:marvel_app/presentaion/account/account_screen.dart';
import 'package:marvel_app/presentaion/settings/settings_screen.dart';
import 'package:marvel_app/presentaion/on_borading/on_borading_screen.dart';

import 'package:marvel_app/presentaion/sign_up_login/pages/login_signup_page.dart';

import 'package:marvel_app/presentaion/splash/splash_screen.dart';
import 'package:marvel_app/shared/cubits/app_cubit/splash_cubit.dart';
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
        return splashScreen();
      case AppRouter.onBorading:
        return onBoardingScreen();
      case AppRouter.loginSignUp:
        return loginSignUpScreen(settings);
      case AppRouter.home:
        return homeScreen();
      case AppRouter.moviePage:
        return detailScreen(settings);
      case AppRouter.settingPage:
        return settingsScreen();
      case AppRouter.downloadWatchList:
        return watchListDownloadScreen();
      case AppRouter.accountPage:
        return accountScreen();
      default:
        return unknownFoundPage();
    }
  }

  static homeScreen() {
    setupHomeCubit();
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

  static settingsScreen() {
    return MaterialPageRoute(builder: (ctx) => const SettingScreen());
  }

  static onBoardingScreen() {
    return MaterialPageRoute(builder: (ctx) => const OnBoardingScreen());
  }

  static watchListDownloadScreen() {
    return MaterialPageRoute(builder: (ctx) => const WatchListDownloadScreen());
  }

  static accountScreen() {
    return MaterialPageRoute(builder: (ctx) => const AccountScreen());
  }

  static loginSignUpScreen(RouteSettings settings) {
    final args = settings.arguments as bool;
    return MaterialPageRoute(
      builder: (ctx) => BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: LoginSignUpPage(isLogin: args),
      ),
    );
  }

  static detailScreen(RouteSettings settings) {
    final args = settings.arguments as DetailPageArguments;

    return MaterialPageRoute(
      builder: (ctx) => BlocProvider.value(
        value: args.homeCubit,
        child: DetailPage(
          args: args,
        ),
      ),
    );
  }

  static splashScreen() {
    setupSplashCubit();
    return MaterialPageRoute(
      builder: (ctx) => BlocProvider(
        create: (context) => getIt<SplashCubit>(),
        child: const SplashScreen(),
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
