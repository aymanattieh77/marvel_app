import 'package:flutter/material.dart';

import 'package:marvel_app/presentaion/common/widgets/custom_marvel_navigation_bar.dart';
import 'package:marvel_app/presentaion/main/categories/pages/categories_page.dart';
import 'package:marvel_app/presentaion/main/downloads/pages/watch_list_download_page.dart';
import 'package:marvel_app/presentaion/main/home/pages/home_page.dart';
import 'package:marvel_app/presentaion/main/more/pages/more_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    HomePage(),
    CategoriesPage(),
    WatchListDownloadPage(),
    MorePage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: pages),
      ),
      floatingActionButton: CustomMarvelNavigationBar(
          currentIndex: currentIndex, onTap: changeIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
