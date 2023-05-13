import 'package:equatable/equatable.dart';

import 'movies_series_data.dart';

class MoviesSeriesResponse extends Equatable {
  final List<MoviesSeriesData>? data;
  final int? total;

  const MoviesSeriesResponse({this.data, this.total});

  factory MoviesSeriesResponse.fromJson(Map<String, dynamic> json) =>
      MoviesSeriesResponse(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => MoviesSeriesData.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'total': total,
      };

  @override
  List<Object?> get props => [data, total];
}
