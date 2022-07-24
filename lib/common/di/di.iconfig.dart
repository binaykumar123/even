// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:even/common/di/dio_di.dart';
import 'package:dio/dio.dart';
import 'package:even/common/api_client/api_client.dart';
import 'package:even/features/my_history/data/data_sources/my_history_remote_data_source.dart';
import 'package:even/features/my_history/data/repository/my_history_repository.dart';
import 'package:even/features/my_history/data/controller/my_history_controller.dart';
import 'package:even/features/my_history/ui/store/my_history_screen_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final dioDi = _$DioDi();
  g.registerLazySingleton<Dio>(() => dioDi.dio);
  g.registerLazySingleton<ApiClient>(() => ApiClient(g<Dio>()));
  g.registerLazySingleton<MyHistoryRemoteDataSource>(
      () => MyHistoryRemoteDataSource(g<ApiClient>()));
  g.registerLazySingleton<MyHistoryRepository>(
      () => MyHistoryRepository(g<MyHistoryRemoteDataSource>()));
  g.registerLazySingleton<MyHistoryController>(
      () => MyHistoryController(g<MyHistoryRepository>()));
  g.registerLazySingleton<MyHistoryScreenStore>(
      () => MyHistoryScreenStore(g<MyHistoryController>()));
}

class _$DioDi extends DioDi {}
