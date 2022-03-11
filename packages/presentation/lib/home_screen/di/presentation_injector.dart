import 'package:domain/use_cases/impl/palindrome_impl.dart';
import 'package:presentation/home_screen/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

void initPresentationModule() {
  _initHomeScreenModule();
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<PalindromeCaseImpl>(),
    ),
  );
}
