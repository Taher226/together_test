import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/data/models/send_otp_model.dart';

abstract class SendOtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendOtpInitial extends SendOtpState {}

class SendOtpLoading extends SendOtpState {}

class SendOtpSuccess extends SendOtpState {
  final SendOtpModel model;

  SendOtpSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class SendOtpError extends SendOtpState {
  final String error;

  SendOtpError(this.error);

  @override
  List<Object?> get props => [error];
}
