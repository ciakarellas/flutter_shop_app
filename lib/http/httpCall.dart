import 'dart:convert';
import 'package:http/http.dart';
import 'package:shoping_list/model/product.dart';

class HttpService {
  final String postsURL = "http://127.0.0.1:3000/v1/products";

  Future<List<Product>> getPosts() async {
    Response res = await get(
      Uri.parse(postsURL),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );

    if (res.statusCode == 200) {
      List<ShopingList> body = jsonDecode(res.body);

      List<Product> posts = body
          .map(
            (dynamic item) => Product.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
