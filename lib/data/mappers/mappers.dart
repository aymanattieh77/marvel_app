import 'package:marvel_app/domain/models/marvel/character.dart';
import 'package:marvel_app/domain/models/marvel/comics.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';

import '../remote/responses/marvel/result.dart';
import '../remote/responses/movies_series_response/movies_series_data.dart';

extension MoviesSeriesDataExtension on MoviesSeriesData {
  MovieSeriesModel toDomain() {
    return MovieSeriesModel(
      id: id ?? 0,
      title: title ?? '',
      releaseDate: releaseDate ?? '',
      boxOffice: boxOffice ?? '',
      duration: duration ?? 0,
      overview: overview ?? '',
      coverUrl: coverUrl ?? "",
      trailerUrl: trailerUrl ?? "",
      directedBy: directedBy ?? "",
      phase: phase ?? 0,
      saga: saga ?? "",
      chronology: chronology ?? 0,
      postCreditScenes: postCreditScenes ?? 0,
      imdbId: imdbId ?? "",
    );
  }
}

extension MarvelResultExtension on Result {
  ComicsModel comicsToDomain() {
    return ComicsModel(
      id: id ?? 0,
      title: title ?? "",
      variantDescription: variantDescription ?? "",
      description: description ?? "",
      modified: modified ?? "",
      price: getPrice(),
      thumbnail: getThumbnail(),
    );
  }

  CharacterModel characterToDomain() {
    return CharacterModel(
      id: id ?? 0,
      name: name ?? "",
      description: description ?? "",
      modified: modified ?? "",
      thumbnail: getThumbnail(),
    );
  }

  double getPrice() {
    if (prices != null) {
      if (prices!.isNotEmpty) {
        return prices![0].price ?? 0.0;
      } else {
        return 0.0;
      }
    }
    return 0.0;
  }

  String getThumbnail() {
    if (thumbnail != null) {
      if (thumbnail!.extension != null && thumbnail!.path != null) {
        return '${thumbnail!.path}${thumbnail!.extension}';
      } else {
        return '';
      }
    } else {
      return '';
    }
  }
}
