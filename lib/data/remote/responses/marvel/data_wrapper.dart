import 'data_container.dart';

class MarvelDataWrapper {
  int? code;
  String? status;
  DataContainer? data;

  MarvelDataWrapper({
    this.code,
    this.status,
    this.data,
  });

  factory MarvelDataWrapper.fromJson(Map<String, dynamic> json) =>
      MarvelDataWrapper(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : DataContainer.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.toJson(),
      };
}
