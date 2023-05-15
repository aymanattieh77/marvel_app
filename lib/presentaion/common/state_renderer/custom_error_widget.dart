import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/res.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.message, this.onPressed});
  final String message;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.s10),
          color: AppColor.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AssetsIconPath.marvelLogo),
          const SizedBox(height: AppSizes.s10),
          Text(
            message,
            style: AppStyles.textstyle18.copyWith(color: AppColor.black),
          ),
          const SizedBox(height: AppSizes.s10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(AppStrings.yes))
        ],
      ),
    );
  }
}
