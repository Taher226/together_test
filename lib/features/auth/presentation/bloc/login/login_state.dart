part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  final String token;

  LoginSuccess({required this.message, required this.token});
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}
