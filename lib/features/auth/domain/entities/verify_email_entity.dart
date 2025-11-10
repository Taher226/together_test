import 'package:equatable/equatable.dart';

class VerifyEmailEntity extends Equatable {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;
  final String? data;
  const VerifyEmailEntity({
    required this.success,
    this.message,
    this.messages,
    this.data,
  });
  @override
  List<Object?> get props => [success, message, messages, data];
}
