import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:marvel_app/app/utils/constants.dart';
import 'package:marvel_app/data/local/local_data/movie_series_local_storage/movie_series_model_adapter.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class MarvelLocalStorage {
  Future<Box<MovieSeriesModel>> initHiveBox();
  Future<int> addToWatchList(MovieSeriesModel model);
}

class MarvelLocalStorageImpl extends MarvelLocalStorage {
  @override
  Future<int> addToWatchList(MovieSeriesModel model) async {
    final box = Hive.box<MovieSeriesModel>(AppConstants.moviesSeriesBox);
    return box.add(model);
  }

  @override
  Future<Box<MovieSeriesModel>> initHiveBox() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter<MovieSeriesModel>(MovieSeriesModelAdapter());
    return await Hive.openBox<MovieSeriesModel>(AppConstants.moviesSeriesBox);
  }
}
