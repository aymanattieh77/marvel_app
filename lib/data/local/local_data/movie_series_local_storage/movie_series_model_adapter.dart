import 'package:hive/hive.dart';

import '../../../../domain/models/move_series/movie_series_model.dart';

class MovieSeriesModelAdapter extends TypeAdapter<MovieSeriesModel> {
  @override
  MovieSeriesModel read(BinaryReader reader) {
    return MovieSeriesModel(
      id: reader.read(),
      title: reader.read(),
      releaseDate: reader.read(),
      boxOffice: reader.read(),
      duration: reader.read(),
      overview: reader.read(),
      coverUrl: reader.read(),
      trailerUrl: reader.read(),
      directedBy: reader.read(),
      phase: reader.read(),
      saga: reader.read(),
      chronology: reader.read(),
      postCreditScenes: reader.read(),
      imdbId: reader.read(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, MovieSeriesModel obj) {
    writer
      ..write(obj.id)
      ..write(obj.title)
      ..write(obj.releaseDate)
      ..write(obj.boxOffice)
      ..write(obj.duration)
      ..write(obj.overview)
      ..write(obj.coverUrl)
      ..write(obj.trailerUrl)
      ..write(obj.directedBy)
      ..write(obj.phase)
      ..write(obj.saga)
      ..write(obj.chronology)
      ..write(obj.postCreditScenes)
      ..write(obj.imdbId);
  }
}
