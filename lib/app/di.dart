import 'package:clean_architecture_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_mvvm/data/network/app_api.dart';
import 'package:clean_architecture_mvvm/data/network/dio_factory.dart';
import 'package:clean_architecture_mvvm/data/network/network_info.dart';
import 'package:clean_architecture_mvvm/data/repository/repository_impl.dart';
import 'package:clean_architecture_mvvm/domain/repository/repository.dart';
import 'package:clean_architecture_mvvm/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_mvvm/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'app_prefs.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

  //network info
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnection()),
  );

  //dio factory
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());

  //app service client
  final dio = await getIt<DioFactory>().getDio();
  getIt.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(),
  );

  // repository
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl());
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt()));
    getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt()));
  }
}
