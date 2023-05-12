import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.isPassword = false,
      required this.controller,
      this.validator});

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      controller: controller,
      obscureText: isPassword ? true : false,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p5),
        hintText: hint,
        border: const OutlineInputBorder(),
        fillColor: AppColor.white,
        filled: true,
        suffix: isPassword
            ? GestureDetector(
                onTap: () {
                  // todo show password
                },
                child: Text(
                  AppStrings.show,
                  style: AppStyles.textstyle12.copyWith(
                      color: AppColor.black70, fontWeight: FontWeight.w600),
                ),
              )
            : null,
      ),
    );
  }
}
