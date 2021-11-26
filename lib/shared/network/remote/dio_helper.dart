import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String lang = 'en',
    String token = '',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}