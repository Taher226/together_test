part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterSubmittedEvent extends RegisterEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String passwordConfirmation;
  final int? countryId;
  final int? stateId;
  final String? city;
  final String? postalCode;
  final String? address;

  const RegisterSubmittedEvent({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.passwordConfirmation,
    this.countryId,
    this.stateId,
    this.city,
    this.postalCode,
    this.address,
  });

  @override
  List<Object?> get props => [
    email,
    firstName,
    lastName,
    password,
    passwordConfirmation,
    countryId,
    stateId,
    city,
    postalCode,
    address,
  ];
}
