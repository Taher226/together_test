import 'package:equatable/equatable.dart';

class EditProfileEntity extends Equatable {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;
  const EditProfileEntity({required this.success, this.message, this.messages});
  @override
  List<Object?> get props => [success, message, messages];
}
