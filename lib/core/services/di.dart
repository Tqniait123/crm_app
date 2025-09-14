import 'package:crm_app/config/app_settings/cubit/settings_cubit.dart';
import 'package:crm_app/config/app_settings/data/datasources/settings_remote_data_source.dart';
import 'package:crm_app/config/app_settings/data/datasources/settings_remote_data_source_impl.dart';
import 'package:crm_app/config/app_settings/data/repo/settings_repo_impl.dart';
import 'package:crm_app/config/app_settings/domain/repo/settings_repo.dart';
import 'package:crm_app/config/shared/controllers/user_cubit/user_cubit.dart';
import 'package:crm_app/core/api/dio_client.dart';
import 'package:crm_app/core/preferences/shared_pref.dart';
import 'package:crm_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:crm_app/features/auth/data/repo/auth_repo.dart';
import 'package:crm_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator(SharedPreferences sharedPreferences) async {
  // Register SharedPreferences first
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register CrmAppPreferences
  sl.registerLazySingleton(() => CrmAppPreferences(sl()));

  // Register DioClient
  sl.registerLazySingleton(() => DioClient(sl()));

  //? Cubits
  sl.registerFactory<UserCubit>(() => UserCubit());
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl()));
  sl.registerLazySingleton<AppSettingsCubit>(() => AppSettingsCubit(sl()));

  //* Repository
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl(), sl()));

  sl.registerLazySingleton<AppSettingsRepo>(() => AppSettingsRepoImpl(sl()));

  //* Datasources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<AppSettingsRemoteDataSource>(() => AppSettingsRemoteDataSourceImpl(sl()));
}
