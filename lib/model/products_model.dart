class ProductsModel {
  String? image;
  String? name;
  String? price;
  String? rate;
  String? key;
  bool? inStock;

  ProductsModel(
      {this.image,
        this.name,
        this.price,
        this.rate,
        this.inStock,
        this.key});

  factory ProductsModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return ProductsModel(
      image: snapshot['image'],
      name: snapshot['name'],
      price: snapshot['price'],
      rate: snapshot['rate'],
      inStock: snapshot['inStock'],

    );
  }
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['price'] = price;
    map['rate'] = rate;
    map['inStock'] = inStock;
    return map;
  }
}
