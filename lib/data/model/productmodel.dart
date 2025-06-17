class Product {
  String? id;
  String? name;
  int? price;
  String? img;
  String? des;

  // Constructor
  Product({this.id, this.name, this.price, this.img, this.des});

  // Named constructor from JSON
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    des = json['des'];
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    data['des'] = des;
    return data;
  }
}
