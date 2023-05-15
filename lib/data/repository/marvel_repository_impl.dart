import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/data/mappers/mappers.dart';

import 'package:marvel_app/data/remote/api_services/marvel/marvel_service.dart';
import 'package:marvel_app/data/remote/errors/error_handler.dart';
import 'package:marvel_app/data/remote/errors/failure.dart';
import 'package:marvel_app/data/remote/network/network_info.dart';
import 'package:marvel_app/domain/models/marvel/character.dart';
import 'package:marvel_app/domain/models/marvel/comics.dart';
import 'package:marvel_app/domain/repository/marvel_repository.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  final MarvelService _marvelService;
  final NetworkInfo _networkInfo;
  MarvelRepositoryImpl(this._marvelService, this._networkInfo);

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharacter() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _marvelService.getCharacters();
        final data = response.data;
        List<CharacterModel> characters = [];
        if (data != null) {
          final results = data.results ?? [];
          characters =
              results.map((result) => result.characterToDomain()).toList();
          return Right(characters);
        } else {
          return Left(ResponseStatusCode.noContent.getFailure());
        }
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
  Future<Either<Failure, List<ComicsModel>>> getComics() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _marvelService.getComics();
        final data = response.data;
        List<ComicsModel> characters = [];
        if (data != null) {
          final results = data.results ?? [];
          characters =
              results.map((result) => result.comicsToDomain()).toList();
          return Right(characters);
        } else {
          return Left(ResponseStatusCode.noContent.getFailure());
        }
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
