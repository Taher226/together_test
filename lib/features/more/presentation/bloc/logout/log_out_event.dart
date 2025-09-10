part of 'log_out_bloc.dart';

abstract class LogoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogOutRequestEvent extends LogoutEvent {
  final String token;
  LogOutRequestEvent(this.token);
  @override
  List<Object?> get props => [token];
}
