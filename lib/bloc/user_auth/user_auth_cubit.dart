import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/repositories/authentication/firebase_auth_repo.dart';

import '../../data/models/user_model/user_model.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit() : super(UserAuthInitial());

  void checkUserAuth() async {
    try {
      emit(UserAuthLoading());
      final UserModel? user =
          await DepInj.locator<FirebaseAuthRepo>().getUser();
      if (user == null) {
        emit(UserAuthUnauthenticated());
        return;
      }
      emit(UserAuthenticated(user));
      print('asd');
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }
}
