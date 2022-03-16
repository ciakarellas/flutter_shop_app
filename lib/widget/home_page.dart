import 'dart:async';
import 'dart:ffi';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopingListProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('User Info'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "/add");
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
          body: Container(
            margin: EdgeInsets.all(24.0),
            child: Consumer<ShopingListProvider>(
              builder: (context, model, child) {
                //final model = Provider.of<ShopingListProvider>(context);
                return RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    model.getShopingList();
                    // model.productList;
                  },
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: model.productList.products.length,
                      itemBuilder: (context, item) {
                        return ProductWidget(
                            products: model.productList.products[item]);
                      }),
                );
              },
            ),
          )),
    );
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<ShopingListProvider>(context, listen: false)
                    .getShopingList();
                _controller.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
