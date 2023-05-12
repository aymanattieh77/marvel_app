import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw Exception('Could not launch $url');
  }
}

showToastMessage(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: AppStyles.textstyle12,
    ),
    margin: const EdgeInsets.all(AppMargin.m5),
    backgroundColor: AppColor.black,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showCustomDialog(BuildContext context, Widget child) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: child,
      );
    },
  );
}

String? emailVaildation(String email) {
  if (email.isEmpty) {
    return 'Email field is empty';
  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
    return 'Please enter a valid email address';
  } else {
    return null;
  }
}

String? passwordVaildation(String password) {
  if (password.isEmpty) {
    return 'password field is empty';
  } else if (password.length < 6) {
    return 'password is too short';
  } else {
    return null;
  }
}
