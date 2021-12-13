import 'package:dio/dio.dart';

class HttpService {
  Dio _dio;
  final baseUrl = "http://127.0.0.1:3000";
  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }
  // this is method to easer debbuging http calls
  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e.message);
      },
      onRequest: (request, handler) {
        print("${request.method} ${request.baseUrl}");
      },
      onResponse: (response, hendler) {
        print("${response.data}");
      },
    ));
  }
}
