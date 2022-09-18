import 'package:casist2/core/config.dart';
import 'package:casist2/data/casist_api_client.dart';
import 'package:casist2/data/data_sources/local_data_source.dart';
import 'package:casist2/data/data_sources/remote_data_source.dart';
import 'package:casist2/data/repositories/conf_repository.dart';
import 'package:casist2/data/storage/secure_storage.dart';
import 'package:casist2/data/repositories/auth_repository.dart';
import 'package:casist2/domain/abstraction/auth_repository.dart';
import 'package:casist2/domain/abstraction/conf_repository.dart';
import 'package:casist2/domain/use_cases/scan_code_use_case.dart';
import 'package:casist2/domain/use_cases/search_companies_use_case.dart';
import 'package:casist2/domain/use_cases/start_app_use_case.dart';
import 'package:casist2/domain/use_cases/user_cache_use_case.dart';
import 'package:casist2/domain/use_cases/user_signin_use_case.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_bloc.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_bloc.dart';
import 'package:casist2/presentation/pages/welcome/cubit/welcome_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


final locator = GetIt.instance;

Future<void> init() async {

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => Casist2Api(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<LocalDataSource>(
    () => SqliteDataSource(
      database: locator(),
    ),
  );

  locator.registerLazySingleton<Storage>(
    () => SecureStorage(
      storage: locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: locator(),
      remoteDataSource: locator(),
      storage: locator(),
    ),
  );

  locator.registerLazySingleton<ConfRepository>(
    () => ConfRepositoryImpl(
      remoteDataSource: locator(),
      storage: locator(),
    ),
  );

  // use_case
  locator.registerLazySingleton(
    () => SignInUserUseCase(
      repository: locator()
    )
  );

  locator.registerLazySingleton(
    () => StartAppUseCase(
      repository: locator()
    )
  );

  locator.registerLazySingleton(
    () => ScanCodeUseCase()
  );

  locator.registerLazySingleton(
    () => CacheUserUseCase(
      repository: locator()
    )
  );

  locator.registerLazySingleton(
    () => SearchCompaniesUseCase(
      repository: locator()
    )
  );

  // bloc
  locator.registerFactory(
    () => SignInBloc(
      signIn: locator(),
      cacheUser: locator(),
    ),
  );

  locator.registerFactory(
    () => ConfBloc(
      scanCode: locator(),
      searchCompaniesUseCase: locator(),
      cacheUserUseCase: locator(),
    ),
  );

  locator.registerFactory(
    () => WelcomeCubit(
      startApp: locator(),
    ),
  );

  // core
  locator.registerLazySingleton(
    () => CasistApiClient(
      client: locator(),
      storage: locator()
  ));

  // external
  locator.registerLazySingleton(
    () => const FlutterSecureStorage()
  );
  locator.registerLazySingleton(
    () => http.Client()
  );

  // TODO: wrapper for Database
  // TODO: tables -> user, transfer, order, settings
  final database = await openDatabase(
    join(await getDatabasesPath(), 'casist2.db'),
    onCreate: (db, version) async {
      const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';

      await db.execute(
        '''CREATE TABLE user(
          id $idType,
          
        )''',
      );

      await db.execute(
          '''CREATE TABLE transfer(id INTEGER PRIMARY KEY)''',
      );

      await db.execute(
        '''CREATE TABLE order(id INTEGER PRIMARY KEY)''',
      );

      await db.execute(
        '''CREATE TABLE settings(id INTEGER PRIMARY KEY)''',
      );
    },
    version: databaseVersion,
  );
  locator.registerLazySingleton(
    () => database
  );
}