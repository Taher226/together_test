import 'package:equatable/equatable.dart';

abstract class ForgetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;

  ForgetPasswordSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ForgetPasswordError extends ForgetPasswordState {
  final String error;

  ForgetPasswordError(this.error);

  @override
  List<Object?> get props => [error];
}
