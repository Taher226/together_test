part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditProfileRequestEvent extends EditProfileEvent {
  final String token;
  final String method;
  final String firstName;
  final String lastName;
  final String? phone;
  final String? address;
  EditProfileRequestEvent(
    this.method,
    this.firstName,
    this.lastName,
    this.phone,
    this.address,
    this.token,
  );
  @override
  List<Object?> get props => [
    token,
    method,
    firstName,
    lastName,
    phone,
    address,
  ];
}
