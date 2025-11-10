part of 'check_password_bloc.dart';

abstract class CheckPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckPasswordInitial extends CheckPasswordState {}

class CheckPasswordLoading extends CheckPasswordState {}

class CheckPasswordSuccess extends CheckPasswordState {
  final CheckPasswordEntity entity;
  CheckPasswordSuccess(this.entity);
  @override
  List<Object?> get props => [entity];
}

class CheckPasswordFailure extends CheckPasswordState {
  final String error;

  CheckPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
