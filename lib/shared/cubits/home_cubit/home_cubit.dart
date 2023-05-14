// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/domain/repository/movie_series_repository.dart';
import 'package:marvel_app/presentaion/main/categories/pages/categories_page.dart';
import 'package:marvel_app/presentaion/main/downloads/pages/watch_list_download_page.dart';
import 'package:marvel_app/presentaion/main/home/pages/home_page.dart';
import 'package:marvel_app/presentaion/main/more/pages/more_page.dart';

import '../../../presentaion/main/downloads/pages/comics_characters_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._movieSeriesRepository) : super(HomeInitial());
  final MovieSeriesRepository _movieSeriesRepository;

  int currnetIndex = 0;
  int tabIndex = 0;
  int downloadwatchlistTab = 0;
  List<MovieSeriesModel> movies = [];
  List<MovieSeriesModel> series = [];
  List<MovieSeriesModel> watchList = [];

  List<MovieSeriesModel> getMovieOrSeries() {
    if (tabIndex == 1) {
      return series;
    } else {
      return movies;
    }
  }

  void downloadWatchlistTab(int index) {
    if (index == 0) {
      downloadwatchlistTab = 0;
    } else {
      downloadwatchlistTab = 1;
    }
  }

  changeTabIndex(int index) {
    tabIndex = index;
    emit(MovieSeriesTabIndexChange());
    loadedMoviesSeries();
  }

  final pages = const [
    HomePage(),
    CategoriesPage(),
    ComicsCharacterPage(),
    MorePage(),
  ];
  changeIndex(int index) {
    currnetIndex = index;
    emit(NavigationIndexChange());
    loadedMoviesSeries();
  }

  loadedMoviesSeries() {
    if (movies.isNotEmpty && series.isNotEmpty) {
      emit(MovieSeriesLoaded());
    } else {
      getMovies();
      getSeries();
    }
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
        emit(MovieSeriesLoaded());
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
        emit(MovieSeriesLoaded());
        series = items;
      },
    );
  }
}

class DetailPageArguments {
  final HomeCubit homeCubit;
  final MovieSeriesModel model;
  DetailPageArguments({
    required this.homeCubit,
    required this.model,
  });
}
