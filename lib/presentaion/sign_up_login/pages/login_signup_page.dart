import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/forget_password_register_with_section.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/have_account_or_not_section.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/input_fields_section.dart';
import 'package:marvel_app/shared/cubits/authentication_cubit/authentication_cubit.dart';

class LoginSignUpPage extends StatelessWidget {
  const LoginSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthenticationCubit>(context);

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
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
                    InputFieldsSection(isLogin: cubit.isLogin),
                    const SizedBox(height: AppSizes.s12),
                    const ForgetPasswordRegisterWithSection(),
                    const SizedBox(height: AppSizes.s30),
                    HaveAccountOrNotSection(isLogin: cubit.isLogin)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
