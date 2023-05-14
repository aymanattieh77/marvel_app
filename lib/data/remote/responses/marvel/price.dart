class Price {
  String? type;
  int? price;

  Price({this.type, this.price});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json['type'] as String?,
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
      };
}
