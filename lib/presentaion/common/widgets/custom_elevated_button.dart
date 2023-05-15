import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.color,
      required this.press,
      required this.title});
  final Color color;
  final void Function() press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.red))),
        onPressed: press,
        child: Text(
          title,
          style: AppStyles.textstyle18_38,
          maxLines: 1,
        ),
      ),
    );
  }
}
