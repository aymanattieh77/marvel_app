import 'package:dio/dio.dart';
import 'package:marvel_app/app/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../responses/movies_series_response/movies_series_response.dart';

part 'movies_series_service.g.dart';

@RestApi(baseUrl: AppConstants.moviesSeriesAPI)
abstract class MovieSeriesService {
  factory MovieSeriesService(Dio dio, {String? baseUrl}) = _MovieSeriesService;

  @GET('movies')
  Future<MoviesSeriesResponse> getMovies();

  @GET('tvshows')
  Future<MoviesSeriesResponse> getSeries();
}
