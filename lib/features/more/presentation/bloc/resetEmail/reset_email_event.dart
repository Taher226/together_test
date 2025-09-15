part of 'reset_email_bloc.dart';

abstract class ResetEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetEmailRequestEvent extends ResetEmailEvent {
  final String token;
  final String email;
  final String password;
  final int otp;
  ResetEmailRequestEvent(this.email, this.token, this.password, this.otp);
  @override
  List<Object?> get props => [token, email, password, otp];
}
