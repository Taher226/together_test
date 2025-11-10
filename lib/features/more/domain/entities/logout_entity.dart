import 'package:equatable/equatable.dart';

class LogoutEntity extends Equatable {
  final bool success;
  final String message;
  const LogoutEntity({required this.success, required this.message});
  @override
  List<Object?> get props => [success, message];
}
