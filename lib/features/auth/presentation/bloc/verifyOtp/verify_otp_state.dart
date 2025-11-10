part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpEntity entity;
  VerifyOtpSuccess(this.entity);
  @override
  List<Object?> get props => [entity];
}

class VerifyOtpError extends VerifyOtpState {
  final String error;
  VerifyOtpError(this.error);
  @override
  List<Object?> get props => [error];
}
