import 'package:dartz/dartz.dart';
import 'package:marvel_app/domain/models/marvel/character.dart';
import 'package:marvel_app/domain/models/marvel/comics.dart';

import '../../data/remote/errors/failure.dart';

abstract class MarvelRepository {
  Future<Either<Failure, List<ComicsModel>>> getComics();
  Future<Either<Failure, List<CharacterModel>>> getCharacter();
}
