import 'package:get_it/get_it.dart';

import 'package:lablab2/repositories/authentication/firebase_auth_repo.dart';
import 'package:lablab2/routes/app_router.dart';

import 'repositories/authentication/auth_repository.dart';

class DepInj {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => FirebaseAuthRepo());
  }
}
