part of 'user_auth_cubit.dart';

sealed class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

final class UserAuthInitial extends UserAuthState {}

final class UserAuthLoading extends UserAuthState {}

final class UserAuthenticated extends UserAuthState {
  final UserModel user;

  const UserAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

final class UserAuthError extends UserAuthState {
  final String message;

  const UserAuthError(this.message);

  @override
  List<Object> get props => [message];
}

final class UserAuthUnauthenticated extends UserAuthState {}
