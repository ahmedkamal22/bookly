import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories/home_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupSingleton() {
  locator.registerSingleton<ApiService>(ApiService(Dio()));
  locator.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(locator.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}
