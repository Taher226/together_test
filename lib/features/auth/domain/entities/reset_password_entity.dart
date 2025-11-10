import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;
  const ResetPasswordEntity({
    required this.success,
    this.message,
    this.messages,
  });
  @override
  List<Object?> get props => [success, message, messages];
}
