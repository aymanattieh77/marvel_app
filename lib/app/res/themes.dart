import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';

final defaultTheme = ThemeData(
  primaryColor: AppColor.black,
  scaffoldBackgroundColor: AppColor.black,
  appBarTheme: _appbarTheme,
  dividerColor: Colors.grey,
  fontFamily: 'Inter',
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColor.black70,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColor.red,
    unselectedItemColor: AppColor.white,
    unselectedLabelStyle: AppStyles.textstyle10
        .copyWith(color: AppColor.white, fontWeight: FontWeight.w800),
    selectedLabelStyle: AppStyles.textstyle10
        .copyWith(color: AppColor.red, fontWeight: FontWeight.w800),
  ),
);

const _appbarTheme = AppBarTheme(
  backgroundColor: AppColor.black,
  elevation: 0.0,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);
