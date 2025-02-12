import 'package:bookly_app/core/utils/api_servises.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServises>(ApiServises(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServises: getIt.get<ApiServises>()));
}
