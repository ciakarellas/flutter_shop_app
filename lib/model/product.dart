import 'package:meta/meta.dart';
import 'dart:convert';

ShopingList shopingListFromJson(String str) =>
    ShopingList.fromJson(json.decode(str));

String shopingListToJson(ShopingList data) => json.encode(data.toJson());

class ShopingList {
  ShopingList({
    required this.products,
  });

  final List<Product> products;

  factory ShopingList.fromJson(Map<String, dynamic> json) => ShopingList(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.name,
    required this.done,
  });

  final String name;
  final bool done;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "done": done,
      };
}
