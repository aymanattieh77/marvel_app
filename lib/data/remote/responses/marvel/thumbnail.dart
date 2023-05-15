class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json['path'] as String?,
        extension: json['extension'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'path': path,
        'extension': extension,
      };
}
