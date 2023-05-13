import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';

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
