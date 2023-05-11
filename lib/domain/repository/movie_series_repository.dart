import 'package:dartz/dartz.dart';
import 'package:marvel_app/data/errors/failure.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';

abstract class MovieSeriesRepository {
  Future<Either<Failure, List<MovieSeriesModel>>> getMovies();
  Future<Either<Failure, List<MovieSeriesModel>>> getSeries();
}
