import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/themes.dart';
import 'package:marvel_app/presentaion/splash/splash_page.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});
// the root of Application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const SplashPage(),
    );
  }
}
