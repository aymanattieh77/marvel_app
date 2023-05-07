import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_text_field.dart';

class SignUpOrLoginBody extends StatelessWidget {
  const SignUpOrLoginBody({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSizes.s60),
            Center(child: SvgPicture.asset(AssetsIconPath.marvelLogo)),
            const SizedBox(height: AppSizes.s45),
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
            const SizedBox(height: AppSizes.s12),
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
            const SizedBox(height: AppSizes.s30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isLogin
                      ? AppStrings.dontHaveAccount
                      : AppStrings.alreadyHaveAccount,
                  style: AppStyles.textstyle14.copyWith(
                      color: AppColor.white50, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    if (isLogin) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouter.signUp);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouter.login);
                    }
                  },
                  child: Text(
                    isLogin ? AppStrings.signup : AppStrings.login,
                    style: AppStyles.textstyle14.copyWith(
                        color: AppColor.red, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
