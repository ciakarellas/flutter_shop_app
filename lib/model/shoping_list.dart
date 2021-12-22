import 'package:json_annotation/json_annotation.dart';

import 'products.dart';

part 'shoping_list.g.dart';

@JsonSerializable()
class ShopingList {
  ShopingList({
    required this.products,
  });

  Products products;

  factory ShopingList.fromJson(Map<String, dynamic> json) =>
      _$ShopingListFromJson(json);
  Map<String, dynamic> toJson() => _$ShopingListToJson(this);
}
