part of 'verify_email_bloc.dart';

abstract class VerifyEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyEmailRequestEvent extends VerifyEmailEvent {
  final String email;
  final String otp;

  VerifyEmailRequestEvent({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}
