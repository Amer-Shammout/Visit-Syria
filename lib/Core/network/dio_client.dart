import 'package:dio/dio.dart';

import 'interceptors.dart';

class DioClient {
  late final Dio _dio;
  // final String _baseUrl = "http://127.0.0.1:8000/api/";
  // final String _baseUrl = 'http://192.168.43.241:8000/api/';
  // final String _baseUrl = 'http://192.168.108.141:8000/api/';
  final String _baseUrl = 'http://192.168.81.141:8000/api/';
  DioClient()
      : _dio = Dio(
          BaseOptions(
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              responseType: ResponseType.json,
              sendTimeout: const Duration(seconds: 20),
              receiveTimeout: const Duration(seconds: 20)),
        )..interceptors.addAll([LoggerInterceptor()]);

  // GET METHOD
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.get(
      "$_baseUrl$url",
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // POST METHOD
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.post(
      "$_baseUrl$url",
      data: data,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // PUT METHOD
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.put(
      "$_baseUrl$url",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // PATCH METHOD
  Future<Response> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.patch(
      "$_baseUrl$url",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // DELETE METHOD
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final Response response = await _dio.delete(
      "$_baseUrl$url",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}
