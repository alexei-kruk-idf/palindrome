import 'package:dio/dio.dart';

Dio dioBuilder(
  String baseUrl, {
  Map<String, dynamic>? headers,
}) {
  const timeout = 60000;

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
    contentType: 'application/json',
  );

  final dio = Dio(options);
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return dio;
}
