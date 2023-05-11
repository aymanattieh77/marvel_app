// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class NavigationIndexChange extends HomeState {}

class MovieLoading extends HomeState {}

class MovieFailure extends HomeState {
  final String message;
  MovieFailure({
    required this.message,
  });
}

class MovieLoaded extends HomeState {
  final List<MovieSeriesModel> movies;
  MovieLoaded({
    required this.movies,
  });
}

class SeriesLoading extends HomeState {}

class SeriesFailure extends HomeState {
  final String message;
  SeriesFailure({
    required this.message,
  });
}

class SeriesLoaded extends HomeState {
  final List<MovieSeriesModel> series;
  SeriesLoaded({
    required this.series,
  });
}
