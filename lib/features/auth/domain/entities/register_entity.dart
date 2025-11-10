import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final bool success;
  final List<String>? messages;
  final String message;

  const RegisterEntity({
    required this.success,
    this.messages,
    required this.message,
  });
  @override
  List<Object?> get props => [success, messages, message];
}
