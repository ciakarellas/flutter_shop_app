import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list/dio/dio_client.dart';
import 'package:shoping_list/model/products.dart';
import 'package:shoping_list/model/shoping_list.dart';
import 'package:shoping_list/provider/shopping_list_provider.dart';
import 'package:shoping_list/widget/product_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopingListProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Info'),
        ),
        body: Container(
            margin: EdgeInsets.all(24.0),
            child: Builder(
              builder: (context) {
                final model = Provider.of<ShopingListProvider>(context);

                return ListView.builder(
                    itemCount: model.productList.products.length,
                    itemBuilder: (context, item) {
                      return ProductWidget(
                          products: model.productList.products[item]);
                    });
              },
            )),
      ),
    );
  }
}
