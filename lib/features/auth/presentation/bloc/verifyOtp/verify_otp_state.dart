part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpModel model;
  VerifyOtpSuccess(this.model);
  @override
  List<Object?> get props => [model];
}

class VerifyOtpError extends VerifyOtpState {
  final String error;
  VerifyOtpError(this.error);
  @override
  List<Object?> get props => [error];
}
