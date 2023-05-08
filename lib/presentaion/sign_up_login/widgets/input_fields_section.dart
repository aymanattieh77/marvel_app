import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';

import '../../../app/res/strings.dart';
import '../../../app/res/values.dart';
import '../../../app/utils/app_router.dart';
import '../../common/widgets/custom_text_field.dart';

class InputFieldsSection extends StatelessWidget {
  const InputFieldsSection({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(hint: AppStrings.emailID),
        const SizedBox(height: AppSizes.s12),
        const CustomTextField(
          hint: AppStrings.password,
          isPassword: true,
        ),
        const SizedBox(height: AppSizes.s24),
        CustomElevatedButton(
            color: AppColor.black,
            press: () {
              Navigator.of(context).pushReplacementNamed(AppRouter.home);
            },
            title: isLogin ? AppStrings.login : AppStrings.signup),
      ],
    );
  }
}
