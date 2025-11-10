part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordEntity entity;
  ResetPasswordSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ResetPasswordError extends ResetPasswordState {
  final String error;
  ResetPasswordError(this.error);
  @override
  List<Object?> get props => [error];
}
