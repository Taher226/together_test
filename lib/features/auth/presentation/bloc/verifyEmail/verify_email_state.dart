part of 'verify_email_bloc.dart';

abstract class VerifyEmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailSuccess extends VerifyEmailState {
  final VerifyEmailModel model;
  VerifyEmailSuccess(this.model);
  @override
  List<Object?> get props => [model];
}

class VerifyEmailError extends VerifyEmailState {
  final String message;
  VerifyEmailError(this.message);

  @override
  List<Object?> get props => [message];
}
