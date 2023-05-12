import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/domain/repository/movie_series_repository.dart';
import 'package:marvel_app/presentaion/main/categories/pages/categories_page.dart';
import 'package:marvel_app/presentaion/main/downloads/pages/watch_list_download_page.dart';
import 'package:marvel_app/presentaion/main/home/pages/home_page.dart';
import 'package:marvel_app/presentaion/main/more/pages/more_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._movieSeriesRepository) : super(HomeInitial());
  final MovieSeriesRepository _movieSeriesRepository;

  int currnetIndex = 0;
  List<MovieSeriesModel> movies = [];
  List<MovieSeriesModel> series = [];

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

  getMovies() async {
    if (movies.isNotEmpty) {
      return;
    }
    emit(MovieSeriesLoading());

    (await _movieSeriesRepository.getMovies()).fold(
      (failure) {
        emit(MovieSeriesFailure(message: failure.message));
      },
      (items) {
        emit(MovieSeriesLoaded(items: movies));
        movies = items;
      },
    );
  }

  getSeries() async {
    if (series.isNotEmpty) {
      return;
    }
    emit(MovieSeriesLoading());

    (await _movieSeriesRepository.getSeries()).fold(
      (failure) {
        emit(MovieSeriesFailure(message: failure.message));
      },
      (items) {
        emit(MovieSeriesLoaded(items: series));
        series = items;
      },
    );
  }
}
