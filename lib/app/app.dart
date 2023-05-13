import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marvel_app/app/res/themes.dart';
import 'package:marvel_app/app/utils/app_router.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
