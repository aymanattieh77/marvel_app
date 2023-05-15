import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(AssetsIconPath.back)),
        const SizedBox(width: AppSizes.s97),
        Text(title, style: AppStyles.textStyle20),
        const Spacer()
      ],
    );
  }
}
