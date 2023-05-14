import 'item.dart';

class Events {
  int? available;
  String? collectionUri;
  List<Item>? items;
  int? returned;

  Events({this.available, this.collectionUri, this.items, this.returned});

  factory Events.fromJson(Map<String, dynamic> json) => Events(
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
