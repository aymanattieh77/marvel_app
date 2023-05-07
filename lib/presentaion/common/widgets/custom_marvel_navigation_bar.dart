import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';

import 'package:marvel_app/app/res/values.dart';

class CustomMarvelNavigationBar extends StatelessWidget {
  const CustomMarvelNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s56,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: Container(
              color: AppColor.black70,
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsIconPath.home),
                    activeIcon: SvgPicture.asset(
                      AssetsIconPath.home,
                      colorFilter:
                          const ColorFilter.mode(AppColor.red, BlendMode.srcIn),
                    ),
                    label: AppStrings.home,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsIconPath.note),
                    activeIcon: SvgPicture.asset(
                      AssetsIconPath.note,
                      colorFilter:
                          const ColorFilter.mode(AppColor.red, BlendMode.srcIn),
                    ),
                    label: AppStrings.categories,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsIconPath.frame),
                    activeIcon: SvgPicture.asset(
                      AssetsIconPath.frame,
                      colorFilter:
                          const ColorFilter.mode(AppColor.red, BlendMode.srcIn),
                    ),
                    label: AppStrings.downloads,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsIconPath.elementPlus),
                    activeIcon: SvgPicture.asset(
                      AssetsIconPath.elementPlus,
                      colorFilter:
                          const ColorFilter.mode(AppColor.red, BlendMode.srcIn),
                    ),
                    label: AppStrings.more,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
