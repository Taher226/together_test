part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePasswordRequestEvent extends ChangePasswordEvent {
  final String token;
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordRequestEvent({
    required this.token,
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
    token,
    currentPassword,
    newPassword,
    confirmPassword,
  ];
}
