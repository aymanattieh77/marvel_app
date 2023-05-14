// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MarvelService implements MarvelService {
  _MarvelService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://gateway.marvel.com/v1/public/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MarvelDataWrapper> getComics({
    String apikey = AppConstants.marvelAPIKey,
    String hash = AppConstants.marvelHash,
    int st = AppConstants.marvelSt,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apikey': apikey,
      r'hash': hash,
      r'ts': st,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MarvelDataWrapper>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'comics',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MarvelDataWrapper.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MarvelDataWrapper> getCharacters({
    String apikey = AppConstants.marvelAPIKey,
    String hash = AppConstants.marvelHash,
    int st = AppConstants.marvelSt,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apikey': apikey,
      r'hash': hash,
      r'ts': st,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MarvelDataWrapper>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'characters',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MarvelDataWrapper.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
