import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/styles.dart';

import '../../../../app/res/values.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({
    super.key,
    required this.title,
    this.press,
  });
  final String title;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding:
            const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p28),
        height: 36,
        child: Row(
          children: [
            Text(title, style: AppStyles.textStyle20),
            const Spacer(),
            const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.arrow_drop_up,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
