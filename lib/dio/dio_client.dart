import 'package:dio/dio.dart';
//import 'package:shoping_list/model/product.dart';
import 'package:shoping_list/model/shoping_list.dart';

class DioClient {
  final Dio _dio = Dio();

  final String _baseUrl = "http://127.0.0.1:3000/v1/";

  Future<ShopingList?> getProductList({required String endpoint}) async {
    ShopingList? shopingList;
    try {
      //tutaj jesli nie zadziała to moze trzeba zrobic jak w artykule czyli (_baseUrl + ${endpoint})
      Response response = await _dio.get(_baseUrl + endpoint,
          options: Options(
              headers: {"Accept": "*/*", "ContentType": "application/json"}));
      print('Shoping list: ${response.data}');
      shopingList = ShopingList.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return shopingList;
  }
}
