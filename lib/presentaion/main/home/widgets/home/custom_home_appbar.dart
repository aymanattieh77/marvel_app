import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        SizedBox(
          height: 45,
          width: 100,
          child: SvgPicture.asset(AssetsIconPath.marvelLogo),
        ),
        const SizedBox(width: 44),
        SizedBox(
          height: 70,
          width: 70,
          child: SvgPicture.asset(AssetsIconPath.avatar1),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
