import 'package:marvel_app/data/api_services/movies_series/movies_series_service.dart';
import 'package:marvel_app/data/network/network_info.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/data/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_app/domain/repository/movie_series_repository.dart';

class MovieSeriesRepositoryImpl implements MovieSeriesRepository {
  final MovieSeriesService _movieSeriesService;
  final NetworkInfo _networkInfo;
  MovieSeriesRepositoryImpl(this._movieSeriesService, this._networkInfo);
  @override
  Future<Either<Failure, MovieSeriesModel>> getMovies() async {
    if (await _networkInfo.isConnected) {
    } else {}
  }

  @override
  Future<Either<Failure, MovieSeriesModel>> getSeries() {}
}
