import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/presentaion/main/categories/pages/categories_page.dart';
import 'package:marvel_app/presentaion/main/downloads/pages/watch_list_download_page.dart';
import 'package:marvel_app/presentaion/main/home/pages/home_page.dart';
import 'package:marvel_app/presentaion/main/more/pages/more_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currnetIndex = 0;
  final pages = const [
    HomePage(),
    CategoriesPage(),
    WatchListDownloadPage(),
    MorePage(),
  ];
  changeIndex(int index) {
    currnetIndex = index;
    emit(NavigationIndexChange());
  }

  getMovies() {}
  getSeries() {}
}
