class ProductsModel {
  List<Data>? data;

  ProductsModel({this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? productId;
  String? productType;
  String? product;
  String? image;
  String? price;
  int? count=0;

  Data(
      {this.id,
        this.productId,
        this.productType,
        this.product,
        this.image,
        this.price,
        this.count
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productType = json['product_type'];
    product = json['product'];
    image = json['image'];
    price = json['price'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_type'] = this.productType;
    data['product'] = this.product;
    data['image'] = this.image;
    data['price'] = this.price;
    data['count'] = this.count;
    return data;
  }
}
