part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordRequestEvent extends ForgetPasswordEvent {
  final String email;

  ForgetPasswordRequestEvent(this.email);

  @override
  List<Object?> get props => [email];
}
