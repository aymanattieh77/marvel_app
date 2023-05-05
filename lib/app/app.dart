import 'package:flutter/material.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});
// the root of Application
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
