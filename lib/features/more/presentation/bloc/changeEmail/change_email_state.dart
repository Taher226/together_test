part of 'change_email_bloc.dart';

abstract class ChangeEmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeEmailInitial extends ChangeEmailState {}

class ChangeEmailLoading extends ChangeEmailState {}

class ChangeEmailSuccess extends ChangeEmailState {
  final String message;

  ChangeEmailSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ChangeEmailFailure extends ChangeEmailState {
  final String error;

  ChangeEmailFailure(this.error);

  @override
  List<Object?> get props => [error];
}
