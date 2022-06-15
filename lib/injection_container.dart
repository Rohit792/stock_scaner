import 'package:get_it/get_it.dart';
import 'package:stock_scan_parser/core/network/api_manger.dart';
import 'package:stock_scan_parser/core/network/dio_provider_impl.dart';
import 'package:stock_scan_parser/features/home/domain/home_repository_builder.dart';
import 'package:stock_scan_parser/features/home/presentation/bloc/home_bloc.dart';
import 'package:stock_scan_parser/features/splash/application/cubit/splash_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //Bloc
  sl.registerFactory(() => SplashCubit());

  sl.registerFactory(() => HomeBloc(homeRepository: sl.get()));
  sl.registerSingleton<HomeRepository>(HomeRepositoryBuilder.repository());

  //useCase

  //External

  //Network
  sl.registerSingleton<ApiManager>(DioProviderImpl());
}
