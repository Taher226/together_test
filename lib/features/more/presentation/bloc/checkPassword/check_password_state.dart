part of 'check_password_bloc.dart';

abstract class CheckPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckPasswordInitial extends CheckPasswordState {}

class CheckPasswordLoading extends CheckPasswordState {}

class CheckPasswordSuccess extends CheckPasswordState {
  final CheckPasswordModel model;
  CheckPasswordSuccess(this.model);
  @override
  List<Object?> get props => [model];
}

class CheckPasswordFailure extends CheckPasswordState {
  final String error;

  CheckPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
