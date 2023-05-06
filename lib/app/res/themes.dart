import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/app/res/colors.dart';

final defaultTheme = ThemeData(
  primaryColor: AppColor.black,
  scaffoldBackgroundColor: AppColor.black,
  appBarTheme: _appbarTheme,
  dividerColor: Colors.grey,
);

const _appbarTheme = AppBarTheme(
  backgroundColor: AppColor.black,
  elevation: 0.0,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);
