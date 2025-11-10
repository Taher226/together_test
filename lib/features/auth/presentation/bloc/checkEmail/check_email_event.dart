part of 'check_email_bloc.dart';

abstract class CheckEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckEmailRequestEvent extends CheckEmailEvent {
  final String email;

  CheckEmailRequestEvent(this.email);

  @override
  List<Object?> get props => [email];
}
