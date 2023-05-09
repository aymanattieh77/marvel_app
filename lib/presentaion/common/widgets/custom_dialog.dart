import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSizes.s24),
            Text(
              title,
              style:
                  AppStyles.textstyle18.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: AppSizes.s56),
            Row(
              children: [
                Expanded(
                    child: CustomElevatedButton(
                        color: AppColor.red,
                        press: () {
                          Navigator.of(context).pop();
                        },
                        title: AppStrings.yes)),
                const SizedBox(width: 26),
                Expanded(
                    child: CustomElevatedButton(
                        color: AppColor.black,
                        press: () {
                          Navigator.of(context).pop();
                        },
                        title: AppStrings.cancel)),
              ],
            ),
            const SizedBox(height: AppSizes.s12),
          ],
        ),
      ),
    );
  }
}
