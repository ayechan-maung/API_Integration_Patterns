import 'package:dio/dio.dart';
import 'package:flutter_patterns/utils/url.dart';

class NetworkRepository {
  Future<dynamic> mvFetch({required String url, Map<String, dynamic>? params}) async {
    try {
      Response response;
      final dio = Dio();
      response = await dio.get(BASE_URL + url, queryParameters: params);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return 'Error';
      }
    } on DioError catch (e) {
      if (e.response != null) {
        int errStatusCode = e.response!.statusCode!;
        if (errStatusCode == 404) {
          return '404 Not Found';
        } else if (errStatusCode == 500) {
          return 'Internal Server Error';
        } else {
          return 'Unknown Error';
        }
      }
    }
  }
}
