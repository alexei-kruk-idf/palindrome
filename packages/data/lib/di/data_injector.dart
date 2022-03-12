import 'package:data/dio/dio_builder.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/use_cases/repository/network_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataModule() async {
  _initDioModule();
  _initApiServiceModule();
  _initCancelToken();
  _initRepositoryModule();
}

void _initApiServiceModule() {
  GetIt.I.registerSingleton(
      ApiService(GetIt.I.get(instanceName: 'palindrome_url')));
}

void _initDioModule() {
  GetIt.I.registerSingleton(dioBuilder('https://fpwebservice.herokuapp.com'),
      instanceName: 'palindrome_url');
}

void _initCancelToken() {
  GetIt.I.registerFactory<CancelToken>(() => CancelToken());
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<INetworkRepository>(NetworkRepository(
    GetIt.I.get<ApiService>(),
    GetIt.I.get<CancelToken>(),
  ));
}
