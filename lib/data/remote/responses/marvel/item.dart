class Item {
  String? resourceUri;
  String? name;

  Item({this.resourceUri, this.name});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        resourceUri: json['resourceURI'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
      };
}
