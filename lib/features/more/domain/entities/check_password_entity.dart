import 'package:equatable/equatable.dart';

class CheckPasswordEntity extends Equatable {
  final bool success;
  final String? message;
  final List<String>? messages;
  const CheckPasswordEntity({
    required this.success,
    this.message,
    this.messages,
  });
  @override
  List<Object?> get props => [success, message, messages];
}
