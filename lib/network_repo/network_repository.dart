import 'package:dio/dio.dart';
import 'package:flutter_patterns/utils/api_response.dart';
import 'package:flutter_patterns/utils/url.dart';

class NetworkRepository {
  SnapshotResponse snapshot = SnapshotResponse();

  Future<SnapshotResponse> mvFetch({required String url, Map<String, dynamic>? params}) async {
    try {
      BaseOptions options = BaseOptions();
      Response response;
      final dio = Dio(options);
      response = await dio.get(BASE_URL + url, queryParameters: params);
      if (response.statusCode == 200) {
        snapshot.data = response.data;
        return snapshot;
      } else {
        snapshot.error = ErrorStatus.Unknown;
        return snapshot;
      }
    } catch (e) {
      if (e is DioError) {
        snapshot.error = e.error;
        return snapshot;
      }
      throw Exception(e);
    }
  }
}
