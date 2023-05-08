import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/values.dart';

import '../../../app/res/colors.dart';
import '../../../app/res/styles.dart';

class ForgetPasswordRegisterWithSection extends StatelessWidget {
  const ForgetPasswordRegisterWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Text(
                AppStrings.forgotPassword,
                style: AppStyles.textstyle15,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.s30),
        Center(
          child: Text(
            AppStrings.or,
            style: AppStyles.textStyle20.copyWith(color: AppColor.white50),
          ),
        ),
        const SizedBox(height: AppSizes.s24),
        const Center(
          child: Text(
            AppStrings.continueWith,
            style: AppStyles.textStyle20,
          ),
        ),
        const SizedBox(height: AppSizes.s24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Row(
            children: [
              SvgPicture.asset(AssetsIconPath.facebook),
              const Spacer(),
              SvgPicture.asset(AssetsIconPath.google)
            ],
          ),
        ),
      ],
    );
  }
}
