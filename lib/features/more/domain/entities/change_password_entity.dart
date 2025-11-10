import 'package:equatable/equatable.dart';

class ChangePasswordEntity extends Equatable {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;
  const ChangePasswordEntity({
    required this.success,
    this.message,
    this.messages,
  });
  @override
  List<Object?> get props => [success, message, messages];
}
