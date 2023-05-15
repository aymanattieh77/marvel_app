class Url {
  String? type;
  String? url;
  Url(this.type, this.url);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': type,
      'url': url,
    };
  }

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      json['type'] != null ? json['type'] as String : null,
      json['url'] != null ? json['url'] as String : null,
    );
  }
}
