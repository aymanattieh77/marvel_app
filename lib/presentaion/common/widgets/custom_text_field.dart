import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.isPassword = false,
      required this.controller,
      this.validator,
      this.showPass});

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? showPass;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      controller: widget.controller,
      obscureText: widget.isPassword ? obsecureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p5),
        hintText: widget.hint,
        border: const OutlineInputBorder(),
        fillColor: AppColor.white,
        filled: true,
        suffix: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
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
