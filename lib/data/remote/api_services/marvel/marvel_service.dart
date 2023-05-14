import 'package:dio/dio.dart';
import 'package:marvel_app/app/utils/constants.dart';
import 'package:marvel_app/data/remote/responses/marvel/data_wrapper.dart';
import 'package:retrofit/retrofit.dart';
part 'marvel_service.g.dart';

@RestApi(baseUrl: AppConstants.marvelAPI)
abstract class MarvelService {
  factory MarvelService(Dio dio, {String? baseUrl}) = _MarvelService;

  @GET('comics')
  Future<MarvelDataWrapper> getComics(
      {@Query('apikey') String apikey = AppConstants.marvelAPIKey,
      @Query('hash') String hash = AppConstants.marvelHash,
      @Query('ts') int st = AppConstants.marvelSt});

  @GET('characters')
  Future<MarvelDataWrapper> getCharacters(
      {@Query('apikey') String apikey = AppConstants.marvelAPIKey,
      @Query('hash') String hash = AppConstants.marvelHash,
      @Query('ts') int st = AppConstants.marvelSt});
}
