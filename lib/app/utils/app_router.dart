import 'package:flutter/material.dart';
import 'package:marvel_app/presentaion/on_borading/on_borading_page.dart';
import 'package:marvel_app/presentaion/sign_up_login/pages/login_page.dart';
import 'package:marvel_app/presentaion/sign_up_login/pages/sign_up_page.dart';
import 'package:marvel_app/presentaion/splash/splash_page.dart';

class AppRouter {
  static const splash = '/';
  static const onBorading = '/on_boarding';
  static const signUp = '/sign_up';
  static const login = '/login_';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.splash:
        return MaterialPageRoute(builder: (ctx) => const SplashPage());
      case AppRouter.onBorading:
        return MaterialPageRoute(builder: (ctx) => const OnBoardingPage());
      case AppRouter.signUp:
        return MaterialPageRoute(builder: (ctx) => const SignUpPage());
      case AppRouter.login:
        return MaterialPageRoute(builder: (ctx) => const LoginPage());
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
