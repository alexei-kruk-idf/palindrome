import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/use_cases/model/palindrome_response.dart';
import 'package:domain/use_cases/repository/network_repository.dart';

import 'api_base_repository.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(
    this._service,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  Future<PalindromeResponse> checkPalindrome(String palindrome) {
    return _service
        .get(
          path: '/ispalindrome/$palindrome',
          cancelToken: _cancelToken,
        )
        .then((value) => Future.value(PalindromeResponse.fromJson(value.data)));
  }
}
