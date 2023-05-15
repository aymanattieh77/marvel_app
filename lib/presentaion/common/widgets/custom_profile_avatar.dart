import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/values.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSizes.s50,
      backgroundColor: Colors.transparent,
      foregroundImage: const AssetImage(AssetsImagePath.avatar1),
      child: SvgPicture.asset(AssetsIconPath.porfileRing),
    );
  }
}
