import 'data_container.dart';

class DataWrapper {
  int? code;
  String? status;
  DataContainer? data;

  DataWrapper({
    this.code,
    this.status,
    this.data,
  });

  factory DataWrapper.fromJson(Map<String, dynamic> json) => DataWrapper(
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
