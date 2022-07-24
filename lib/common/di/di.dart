import 'package:even/common/di/di.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void getItInit() => $initGetIt(getIt);

void resetGetIt<T>({
  Object instance,
  String instanceName,
  void Function(T) disposingFunction,
}) {
  getIt.resetLazySingleton<T>(
    instance: instance,
    instanceName: instanceName,
    disposingFunction: disposingFunction,
  );
}