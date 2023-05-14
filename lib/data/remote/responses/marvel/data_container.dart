import 'result.dart';

class DataContainer {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  DataContainer(
      {this.offset, this.limit, this.total, this.count, this.results});

  factory DataContainer.fromJson(Map<String, dynamic> json) => DataContainer(
        offset: json['offset'] as int?,
        limit: json['limit'] as int?,
        total: json['total'] as int?,
        count: json['count'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
