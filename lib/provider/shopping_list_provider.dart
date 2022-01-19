import 'package:flutter/material.dart';
import 'package:shoping_list/dio/dio_client.dart';
import 'package:shoping_list/model/products.dart';
import 'package:shoping_list/model/shoping_list.dart';

class ShopingListProvider extends ChangeNotifier {
  final DioClient _client = DioClient();
  late ShopingList _productsList = ShopingList(products: []);

  ShopingList get productList => _productsList;

  ShopingListProvider() {
    getShopingList();
  }

  Future<void> getShopingList() async {
    _productsList =
        await _client.getProductList(endpoint: 'products') as ShopingList;
    notifyListeners();
  }
}
