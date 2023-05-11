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
    emit(MovieLoading());

    (await _movieSeriesRepository.getMovies()).fold(
      (failure) {
        emit(MovieFailure(message: failure.message));
      },
      (movies) {
        emit(MovieLoaded(movies: movies));
      },
    );
  }

  getSeries() async {
    emit(SeriesLoading());

    (await _movieSeriesRepository.getMovies()).fold(
      (failure) {
        emit(SeriesFailure(message: failure.message));
      },
      (series) {
        emit(SeriesLoaded(series: series));
      },
    );
  }
}
