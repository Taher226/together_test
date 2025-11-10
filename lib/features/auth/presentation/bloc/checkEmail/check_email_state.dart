part of 'check_email_bloc.dart';

abstract class CheckEmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckEmailInitial extends CheckEmailState {}

class CheckEmailLoading extends CheckEmailState {}

class CheckEmailSuccess extends CheckEmailState {
  final CheckEmailEntity entity;

  CheckEmailSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class CheckEmailError extends CheckEmailState {
  final String error;

  CheckEmailError(this.error);

  @override
  List<Object> get props => [error];
}
