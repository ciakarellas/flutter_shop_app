import 'package:flutter/material.dart';
import 'package:shoping_list/dio/dio_client.dart';
import 'package:shoping_list/model/products.dart';
import 'package:shoping_list/model/shoping_list.dart';
import 'package:shoping_list/widget/product_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: FutureBuilder<ShopingList?>(
          future: _client.getProductList(endpoint: 'products'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ShopingList? userInfo = snapshot.data;
              if (userInfo != null) {
                List<Products> userData = userInfo.products;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: userData
                      .map((e) => ProductWidget(
                            products: e,
                          ))
                      .toList(),
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
