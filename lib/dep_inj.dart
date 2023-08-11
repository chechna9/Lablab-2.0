import 'package:get_it/get_it.dart';

import 'package:lablab2/bloc/auth/auth_cubit.dart';
import 'package:lablab2/bloc/user_auth/user_auth_cubit.dart';
import 'package:lablab2/repositories/authentication/firebase_auth_repo.dart';
import 'package:lablab2/routes/app_router.dart';

class DepInj {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => FirebaseAuthRepo());
    locator.registerLazySingleton(() => AuthCubit(),);
    locator.registerLazySingleton(() => UserAuthCubit());
  }
}
