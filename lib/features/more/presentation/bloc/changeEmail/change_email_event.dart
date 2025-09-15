part of 'change_email_bloc.dart';

abstract class ChangeEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeEmailRequestEvent extends ChangeEmailEvent {
  final String token;
  final String email;

  ChangeEmailRequestEvent({required this.token, required this.email});

  @override
  List<Object?> get props => [token, email];
}
