import 'package:dio/dio.dart';

abstract class DioProvider {
  static late Dio dio;
  static void init() {
    dio = Dio();
  }

  static Future<Response> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParams,
    );
  }

  static Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParams,
    );
  }

  static Future<Response> patch({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.patch(
      endPoint,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParams,
    );
  }

  static Future<Response> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParams,
    );
  }
}
