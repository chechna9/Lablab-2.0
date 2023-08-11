import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/repositories/authentication/firebase_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await DepInj.locator<FirebaseAuthRepo>()
          .signInWithEmailAndPassword(email, password);
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
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
