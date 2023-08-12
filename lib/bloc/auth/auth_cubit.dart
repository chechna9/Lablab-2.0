import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lablab2/bloc/user_auth/user_auth_cubit.dart';
import 'package:lablab2/data/models/user_model/user_model.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/repositories/authentication/firebase_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._userAuthCubit) : super(AuthInitial());
  final UserAuthCubit _userAuthCubit;

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await DepInj.locator<FirebaseAuthRepo>()
          .signInWithEmailAndPassword(email, password);
      _userAuthCubit.emit(UserAuthenticated(UserModel(email: email)));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      await DepInj.locator<FirebaseAuthRepo>()
          .signUpWithEmailAndPassword(email, password);
      _userAuthCubit.emit(UserAuthenticated(UserModel(email: email)));

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
