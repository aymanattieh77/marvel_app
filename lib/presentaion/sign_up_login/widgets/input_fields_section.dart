import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/utils/functions.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';
import 'package:marvel_app/shared/cubits/authentication_cubit/authentication_cubit.dart';

import '../../../app/res/strings.dart';
import '../../../app/res/values.dart';

import '../../common/widgets/custom_text_field.dart';

class InputFieldsSection extends StatefulWidget {
  const InputFieldsSection({super.key, required this.isLogin});

  final bool isLogin;

  @override
  State<InputFieldsSection> createState() => _InputFieldsSectionState();
}

class _InputFieldsSectionState extends State<InputFieldsSection> {
  final globalKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          CustomTextField(
            hint: AppStrings.emailID,
            controller: email,
            validator: (email) {
              return emailVaildation(email ?? "");
            },
          ),
          const SizedBox(height: AppSizes.s12),
          CustomTextField(
            hint: AppStrings.password,
            isPassword: true,
            controller: password,
            validator: (password) {
              return passwordVaildation(password ?? "");
            },
          ),
          const SizedBox(height: AppSizes.s24),
          CustomElevatedButton(
            color: AppColor.black,
            press: () {
              _vaildation(context);
            },
            title: widget.isLogin ? AppStrings.login : AppStrings.signup,
          ),
        ],
      ),
    );
  }

  _vaildation(BuildContext context) {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      BlocProvider.of<AuthenticationCubit>(context)
          .signUpOrLogin(context, email.text, password.text);
    }
  }
}
