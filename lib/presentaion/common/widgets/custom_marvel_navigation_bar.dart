import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';

import 'package:marvel_app/presentaion/common/widgets/blur.dart';

class CustomMarvelNavigationBar extends StatelessWidget {
  const CustomMarvelNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Blur(
      colorOpacity: 0.2,
      blurColor: Colors.transparent,
      blur: 5,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
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
            label: AppStrings.others,
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
    );
  }
}
