// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class NavigationIndexChange extends HomeState {}

class MovieSeriesLoading extends HomeState {}

class MovieSeriesFailure extends HomeState {
  final String message;
  MovieSeriesFailure({
    required this.message,
  });
}

class MovieSeriesLoaded extends HomeState {
  final List<MovieSeriesModel> items;
  MovieSeriesLoaded({
    required this.items,
  });
}
