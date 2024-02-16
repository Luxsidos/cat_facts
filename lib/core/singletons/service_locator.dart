import 'package:get_it/get_it.dart';
import 'package:task_cat/core/singletons/dio_settings.dart';
import 'package:task_cat/features/home/data/datasource/home_datasource.dart';
import 'package:task_cat/features/home/data/repo/home_repo_impl.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(() => HomeRepoImpl(dataSource: HomeDatasourceImpl()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
