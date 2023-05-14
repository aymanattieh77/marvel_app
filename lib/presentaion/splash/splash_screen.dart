import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
    _initSplashScreen();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return AnimatedScale(
                curve: Curves.linearToEaseOut,
                scale: _animation.value,
                duration: const Duration(
                    milliseconds: AppConstants.animationDurationMili300),
                child: Container(
                  color: AppColor.red,
                ),
              );
            }),
        Center(
          child: SvgPicture.asset(AssetsIconPath.marvelLogo),
        ),
      ],
    ));
  }

  goNext() {
    user = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          Navigator.of(context).pushReplacementNamed(AppRouter.onBorading);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRouter.home);
        }
      },
    );
  }

  _initSplashScreen() {
    timer =
        Timer(const Duration(seconds: AppConstants.splashDurationSec), goNext);
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
            milliseconds: AppConstants.animationDurationMili300));
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);
  }

  _startAnimation() {
    Future.delayed(
      const Duration(seconds: AppConstants.animationDurationSec2),
      () {
        _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    user.cancel();

    super.dispose();
  }
}
