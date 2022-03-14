import 'package:presentation/home_screen/di/presentation_injector.dart';
import 'package:domain/use_cases/di/domain_injector.dart';
import 'package:data/di/data_injector.dart';

Future<void> initInjector() async {
  initDataModule();
  initDomainModule();
  initPresentationModule();
}
