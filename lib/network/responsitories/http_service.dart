import 'package:appz151/network/url/url.dart';
import 'package:dio/dio.dart';

class HttpService {
  final Dio _dio = Dio();

  Future<Response?> request(String url, {APIMethod method = APIMethod.Get}) {
    try {
      switch (method) {
        case APIMethod.Get:
          return _dio.get(
            url,
          );
        case APIMethod.Put:
          return _dio.put(url);
        case APIMethod.Delete:
          return _dio.delete(url);
        default:
          return _dio.post(url);
      }
    } catch (e) {
      rethrow;
    }
  }
}
