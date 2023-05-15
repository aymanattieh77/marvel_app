import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/utils/app_router.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.accountPage);
          },
          child: SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(AssetsImagePath.avatar1),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
