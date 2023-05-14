import 'item.dart';

class Comics {
  int? available;
  String? collectionUri;
  List<Item>? items;
  int? returned;

  Comics({this.available, this.collectionUri, this.items, this.returned});

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json['available'] as int?,
        collectionUri: json['collectionURI'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        returned: json['returned'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'collectionURI': collectionUri,
        'items': items?.map((e) => e.toJson()).toList(),
        'returned': returned,
      };
}
