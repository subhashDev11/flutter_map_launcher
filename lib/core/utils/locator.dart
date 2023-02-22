import 'package:test_today/core/route/navigation_service.dart';
import 'package:test_today/services/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import '../../data/data_source/app_data_source.dart';
import '../../data/data_source/app_data_source_imple.dart';
import '../../data/repository/app_repository.dart';
import '../../data/repository/app_repository_imple.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

void locator() {
  Connectivity connectivity = Connectivity();

  getIt.registerSingleton<NavigationService>(NavigationService());

  getIt.registerSingleton<NetworkInfo>(NetworkInfo(connectivity));

  getIt.registerSingleton<OverlayService>(OverlayService());

  getIt.registerSingleton<AppStorageService>(
    AppStorageService(),
  );

  getIt.registerSingleton<ApiProvider>(
    ApiProvider.instance(),
  );

  getIt.registerLazySingleton<AppDataSource>(
    () => AppDataSourceImple(
      apiProvider: getIt(),
      appStorageService: getIt(),
    ),
  );

  getIt.registerLazySingleton<AppRepository>(
    () => AppRepositoryImple(
      appDataSource: getIt(),
      appStorageService: getIt(),
    ),
  );
}
