import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/di/service_locator.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/app/utils/constants.dart';

import '../../../app/prefs/prefs.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<AppState> {
  SplashCubit() : super(SplashInitial());

  late StreamSubscription<User?> user;
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  Animation<double> get animation => _animation;

  isCompleteOnBoarding(BuildContext context) {
    final isOnBoardingComplete = getIt<AppPrefs>().isOnBoardingComplete();

    if (isOnBoardingComplete) {
      navigateToNext(context, AppRouter.loginSignUp, args: true);
    } else {
      navigateToNext(context, AppRouter.onBorading);
    }
  }

  goNext(BuildContext context) {
    user = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          isCompleteOnBoarding(context);
        } else {
          navigateToNext(context, AppRouter.home);
        }
      },
    );
  }

  initAnimation(TickerProvider tickerProvider, BuildContext context) {
    _timer = Timer(
      const Duration(seconds: AppConstants.splashDurationSec),
      () {
        goNext(context);
      },
    );
    _animationController = AnimationController(
        vsync: tickerProvider,
        duration: const Duration(
            milliseconds: AppConstants.animationDurationMili300));
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);
  }

  startAnimation() {
    Future.delayed(
      const Duration(seconds: AppConstants.animationDurationSec2),
      () {
        _animationController.forward();
      },
    );
  }

  start(TickerProvider tickerProvider, BuildContext context) {
    initAnimation(tickerProvider, context);
    startAnimation();
  }

  void navigateToNext(BuildContext context, String route, {Object? args}) {
    Navigator.of(context).pushReplacementNamed(route, arguments: args);
    dispose();
  }

  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    user.cancel();
  }
}
