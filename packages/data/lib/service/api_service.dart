import 'package:dio/dio.dart';

abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}

class _ApiService implements ApiService {
  final Dio _dio;

  _ApiService(this._dio);

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
}
