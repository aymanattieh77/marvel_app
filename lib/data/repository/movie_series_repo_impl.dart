import 'package:dio/dio.dart';
import 'package:marvel_app/data/mappers/mappers.dart';

import 'package:marvel_app/data/remote/errors/error_handler.dart';

import 'package:marvel_app/data/remote/network/network_info.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/data/remote/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_app/domain/repository/movie_series_repository.dart';

import '../remote/api_services/movies_series/movies_series_service.dart';

class MovieSeriesRepositoryImpl implements MovieSeriesRepository {
  final MovieSeriesService _movieSeriesService;
  final NetworkInfo _networkInfo;
  MovieSeriesRepositoryImpl(this._movieSeriesService, this._networkInfo);
  @override
  Future<Either<Failure, List<MovieSeriesModel>>> getMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _movieSeriesService.getMovies();
        final data = response.data ?? [];
        // covert MoviesSeriesData to MovieSeriesModel  using to domain concept
        return Right(data.map((e) => e.toDomain()).toList());
      } catch (e) {
        if (e is DioError) {
          return Left(ErrorHandler.fromDioError(e));
        } else {
          return Left(Failure(1, e.toString()));
        }
      }
    } else {
      return Left(ResponseStatusCode.noIntenetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieSeriesModel>>> getSeries() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _movieSeriesService.getSeries();
        final data = response.data ?? [];
        // covert MoviesSeriesData to MovieSeriesModel  using to domain concept
        return Right(data.map((e) => e.toDomain()).toList());
      } catch (e) {
        if (e is DioError) {
          return Left(ErrorHandler.fromDioError(e));
        } else {
          return Left(Failure(1, e.toString()));
        }
      }
    } else {
      return Left(ResponseStatusCode.noIntenetConnection.getFailure());
    }
  }
}
