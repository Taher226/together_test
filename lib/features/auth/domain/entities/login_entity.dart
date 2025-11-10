import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final bool success;
  final String message;
  final List<String>? messages;
  final String? token;
  final String? photoUrl;
  final String? lang;

  const LoginEntity({
    required this.success,
    required this.message,
    this.messages,
    this.token,
    this.photoUrl,
    this.lang,
  });
  @override
  List<Object?> get props => [
    success,
    messages,
    message,
    token,
    photoUrl,
    lang,
  ];
}
