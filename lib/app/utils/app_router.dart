import 'package:flutter/material.dart';
import 'package:marvel_app/presentaion/main/home/pages/detail_page.dart';
import 'package:marvel_app/presentaion/main/home_screen.dart';
import 'package:marvel_app/presentaion/on_borading/on_borading_screen.dart';

import 'package:marvel_app/presentaion/sign_up_login/pages/login_signup_page.dart';

import 'package:marvel_app/presentaion/splash/splash_screen.dart';

class AppRouter {
  static const splash = '/';
  static const onBorading = '/on_boarding';
  static const signUp = '/sign_up';
  static const loginSignUp = '/login_signup';
  static const home = '/home_';
  static const moviePage = '/movie_page';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.splash:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case AppRouter.onBorading:
        return MaterialPageRoute(builder: (ctx) => const OnBoardingScreen());
      case AppRouter.loginSignUp:
        return MaterialPageRoute(builder: (ctx) => const LoginSignUpPage());
      case AppRouter.home:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case AppRouter.moviePage:
        return MaterialPageRoute(builder: (ctx) => const DetailPage());
      default:
        return unknownFoundPage();
    }
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
