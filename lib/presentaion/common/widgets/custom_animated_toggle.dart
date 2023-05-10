import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/constants.dart';

class CustomAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged<int> onPress;

  const CustomAnimatedToggle({
    super.key,
    required this.values,
    required this.onPress,
  });
  @override
  _CustomAnimatedToggleState createState() => _CustomAnimatedToggleState();
}

class _CustomAnimatedToggleState extends State<CustomAnimatedToggle> {
  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 1,
      height: size.width * 0.13,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              int index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onPress(index);
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              width: size.width * 1,
              height: size.width * 0.13,
              decoration: BoxDecoration(
                  color: AppColor.black,
                  border: Border.all(color: AppColor.red)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.s56),
                    child: Text(
                      widget.values[index],
                      style: AppStyles.textstyle18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(
                milliseconds: AppConstants.animationDurationMili300),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.red,
                border: Border.all(color: AppColor.red),
              ),
              width: size.width * 0.5,
              height: size.width * 0.13,
              alignment: Alignment.center,
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: AppStyles.textstyle18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
