import 'package:equatable/equatable.dart';

abstract class SendOtpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendOtpSubmittedEvent extends SendOtpEvent {
  final String email;

  SendOtpSubmittedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
