// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopingList _$ShopingListFromJson(Map<String, dynamic> json) => ShopingList(
      products: (json['products'] as List<dynamic>)
          .map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopingListToJson(ShopingList instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
