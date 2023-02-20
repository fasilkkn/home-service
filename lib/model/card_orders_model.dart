class CartOrdersModel {
  List<Products>? products;

  CartOrdersModel({this.products});

  CartOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? customerId;
  String? product;
  String? price;
  int count=0;
  String? category;

  Products(
      {this.id,
        this.customerId,
        this.product,
        this.price,
        required this.count,
        this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    product = json['product'];
    price = json['price'];
    count = json['count'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['product'] = this.product;
    data['price'] = this.price;
    data['count'] = this.count;
    data['category'] = this.category;
    return data;
  }
}
