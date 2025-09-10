part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordRequestEvent extends ResetPasswordEvent {
  final String email;
  final int otp;
  final String password;
  final String passwordConfirmation;

  ResetPasswordRequestEvent({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object?> get props => [email, otp, password, passwordConfirmation];
}
