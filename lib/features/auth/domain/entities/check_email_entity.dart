import 'package:equatable/equatable.dart';

class CheckEmailEntity extends Equatable {
  final bool success;
  final List<String>? messages;
  final String message;

  const CheckEmailEntity({
    required this.success,
    this.messages,
    required this.message,
  });
  @override
  List<Object?> get props => [success, messages, message];
}
