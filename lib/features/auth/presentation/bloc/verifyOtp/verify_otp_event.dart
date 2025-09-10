part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();

  @override
  List<Object?> get props => [];
}

class VerifyOtpRequestEvent extends VerifyOtpEvent {
  final String email;
  final int otp;

  VerifyOtpRequestEvent({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}
