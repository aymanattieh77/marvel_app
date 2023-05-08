import 'package:flutter/material.dart';

import 'package:marvel_app/presentaion/common/widgets/custom_marvel_navigation_bar.dart';
import 'package:marvel_app/presentaion/main/home/pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomePage(),
      ),
      floatingActionButton: CustomMarvelNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
