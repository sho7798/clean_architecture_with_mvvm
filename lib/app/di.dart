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

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  //network info
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnection()),
  );

  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(),
  );

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl());
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase());
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
