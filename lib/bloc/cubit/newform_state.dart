part of 'newform_cubit.dart';

sealed class NewformState extends Equatable {
  const NewformState();

  @override
  List<Object> get props => [];
}

final class NewformInitial extends NewformState {}
final class NewformLoading extends NewformState {}
final class NewformSuccess extends NewformState {}
final class NewformError extends NewformState {
  final String error;
  const NewformError(this.error);
  @override
  List<Object> get props => [error];
}
