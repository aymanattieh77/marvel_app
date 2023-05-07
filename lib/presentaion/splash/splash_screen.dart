import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer(const Duration(seconds: AppConstants.splashDurationSec), goNext);
  }

  goNext() {
    Navigator.of(context).pushReplacementNamed(AppRouter.onBorading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AssetsIconPath.marvelLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
