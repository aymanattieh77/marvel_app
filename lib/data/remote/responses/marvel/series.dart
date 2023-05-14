import 'item.dart';

class Series {
  int? available;
  String? collectionUri;
  List<Item>? items;
  int? returned;

  Series({this.available, this.collectionUri, this.items, this.returned});

  factory Series.fromJson(Map<String, dynamic> json) => Series(
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
