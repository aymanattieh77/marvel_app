import 'dart:async';
import 'dart:ffi';

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
  Timer? timer;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double scale = 1.0;
  @override
  void initState() {
    super.initState();

    timer =
        Timer(const Duration(seconds: AppConstants.splashDurationSec), goNext);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);
    _startAnimation();
  }

  goNext() {
    Navigator.of(context).pushReplacementNamed(AppRouter.onBorading);
  }

  _startAnimation() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _animationController.forward();
      },
    );
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
                duration: const Duration(milliseconds: 300),
                child: Container(
                  color: AppColor.red,
                ),
              );
            }),
        Center(
          child: Hero(
            tag: 'marvelLogo_',
            child: SvgPicture.asset(AssetsIconPath.marvelLogo),
          ),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
