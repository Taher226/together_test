part of 'check_password_bloc.dart';

abstract class CheckPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckPasswordRequestEvent extends CheckPasswordEvent {
  final String token;
  final String password;

  CheckPasswordRequestEvent({required this.token, required this.password});
  @override
  List<Object?> get props => [token, password];
}
