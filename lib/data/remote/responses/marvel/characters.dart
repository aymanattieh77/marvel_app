class Characters {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json['available'] as int?,
        collectionUri: json['collectionURI'] as String?,
        items: json['items'] as List<dynamic>?,
        returned: json['returned'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'collectionURI': collectionUri,
        'items': items,
        'returned': returned,
      };
}
