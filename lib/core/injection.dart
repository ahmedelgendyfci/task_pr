import 'package:get_it/get_it.dart';

// Features
import '../features/home/data/datasources/home_local_datasource.dart';
import '../features/home/data/datasources/home_remote_datasource.dart';
import '../features/home/data/repositories/home_repository_impl.dart';
import '../features/home/domain/repositories/home_repository.dart';
import '../features/home/domain/usecases/get_wellness_data.dart';
import '../features/home/domain/usecases/refresh_wellness_data.dart';
import '../features/home/domain/usecases/trigger_sos.dart';
import '../features/home/presentation/cubit/home_cubit.dart';

/// Service locator instance
final sl = GetIt.instance;

/// Initialize all dependencies
Future<void> init() async {
  //! Features - Home
  // Cubit
  sl.registerFactory(
    () => HomeCubit(
      getWellnessData: sl(),
      refreshWellnessData: sl(),
      triggerSOS: sl(),
      repository: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetWellnessData(sl()));
  sl.registerLazySingleton(() => RefreshWellnessData(sl()));
  sl.registerLazySingleton(() => TriggerSOS(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

}
