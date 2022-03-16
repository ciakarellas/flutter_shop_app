import 'package:flutter/material.dart';
import 'package:shoping_list/widget/add_product_to_list_form.dart';
import 'package:shoping_list/widget/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/add": (context) => const AddProductToListForm()
      },
    );
  }
}
