import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shoping_list/http/httpCall.dart';
import 'package:shoping_list/model/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// to set the root of app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'API Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flutter - API Implementation"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Icon(Icons.cancel),
        backgroundColor: Colors.green,
      ),
    );
  }

  // build list view & manage states
  FutureBuilder<List<Product>> _buildBody(BuildContext context) {
    final HttpService httpService = HttpService();
    return FutureBuilder<List<Product>>(
      future: httpService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Product>? posts = snapshot.data;
          return _buildPosts(context, posts!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  ListView _buildPosts(BuildContext context, List<Product> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].done.toString()),
          ),
        );
      },
    );
  }
}
