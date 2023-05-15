import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';

import 'package:marvel_app/app/utils/constants.dart';
import 'package:marvel_app/shared/cubits/app_cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).start(this, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        AnimatedBuilder(
            animation: BlocProvider.of<SplashCubit>(context).animation,
            builder: (context, _) {
              return AnimatedScale(
                curve: Curves.linearToEaseOut,
                scale: BlocProvider.of<SplashCubit>(context).animation.value,
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
}
