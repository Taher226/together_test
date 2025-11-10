import 'package:equatable/equatable.dart';

class ResetEmailEntity extends Equatable {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;
  const ResetEmailEntity({required this.success, this.message, this.messages});
  @override
  List<Object?> get props => [success, message, messages];
}
