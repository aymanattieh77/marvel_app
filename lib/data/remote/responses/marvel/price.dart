class Price {
  String? type;
  double? price;

  Price({this.type, this.price});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json['type'] as String?,
        price: json['price'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
      };
}
