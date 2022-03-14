import 'package:domain/use_cases/impl/palindrome_impl.dart';
import 'package:domain/use_cases/repository/network_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerSingleton<PalindromeCaseImpl>(
    PalindromeCaseImpl(GetIt.I.get<INetworkRepository>()),
  );
}
