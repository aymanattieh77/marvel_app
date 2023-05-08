import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/forget_password_register_with_section.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/have_account_or_not_section.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/input_fields_section.dart';

class LoginSignUpPage extends StatelessWidget {
  const LoginSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSizes.s60),
                Center(child: SvgPicture.asset(AssetsIconPath.marvelLogo)),
                const SizedBox(height: AppSizes.s45),
                const InputFieldsSection(isLogin: false),
                const SizedBox(height: AppSizes.s12),
                const ForgetPasswordRegisterWithSection(),
                const SizedBox(height: AppSizes.s30),
                const HaveAccountOrNotSection(isLogin: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
