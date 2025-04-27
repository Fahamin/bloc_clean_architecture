import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data/datasources/product_remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/usecases/get_all_products.dart';
import 'presentation/cubit/product_cubit.dart';
import 'data/local/database/app_database.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => Dio(BaseOptions(
    contentType: "application/json",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  )));

  // Floor DB setup
  final dbPath = await getDatabasesPath();
  final database = await $FloorAppDatabase
      .databaseBuilder(join(dbPath, 'app_database.db'))
      .build();
  sl.registerLazySingleton<AppDatabase>(() => database);

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllProducts(sl()));

  // Cubit
  sl.registerFactory(() => ProductCubit(getAllProducts: sl()));
}
