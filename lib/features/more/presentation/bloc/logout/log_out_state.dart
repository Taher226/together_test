part of 'log_out_bloc.dart';

abstract class LogoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final LogoutModel model;
  LogoutSuccess(this.model);
  @override
  List<Object?> get props => [model];
}

class LogoutFailure extends LogoutState {
  final String error;
  LogoutFailure(this.error);
  @override
  List<Object?> get props => [error];
}
